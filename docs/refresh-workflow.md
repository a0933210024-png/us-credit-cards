# 信用卡資料定期 Refresh 工作流程

> 這份 SOP 說明如何定期把 `src/data/*-cards.json` 裡的資料保持新鮮。

## 🕐 建議頻率

| 週期 | 做什麼 | 預估時間 |
|---|---|---|
| **每 2 週** | 跑 `npm run check-freshness`，處理到期/快到期的 offer | 15 min |
| **每 30 天** | 針對 "stale"（黃燈）的卡做輕量 refresh | 30 min |
| **每 90 天** | 針對 "very_stale"（橙燈）做完整 refresh | 2 小時 |
| **每年一次** | 全 56 張卡重新 research | 一個下午 |

## 🛠 工具

### 1. 偵測哪些卡需要更新

```bash
cd us-credit-cards
npm run check-freshness
```

輸出範例：
```
▸ Chase (2)
   🔴 chase-united-explorer — 開卡禮 offer 已於 2026-04-15 到期
   🟡 chase-sapphire-reserve — 45 天未驗證（上次 2026-03-03）

Summary: 1 expired · 0 very stale · 1 stale · 0 missing
```

- 🔴 **expired** — 優先處理（網站使用者看得到過期 offer）
- 🟠 **very_stale** — 超過 90 天沒驗證
- 🟡 **stale** — 超過 30 天沒驗證
- ⚪ **missing** — 從沒驗證過（新卡）

退出碼：有 expired 就是 `1`（方便接 CI / 每日 cron 寄信）。

### 2. 只想看 JSON 輸出（給別的腳本用）
```bash
npm run check-freshness -- --json
```

## 🔄 Refresh 的具體步驟

### 🟢 小規模（1~5 張卡，像每週檢查）

直接在 Claude Code 裡跑以下 prompt（把 `{SLUG}` 換成實際的 slug）：

```
請幫我 refresh 以下信用卡的資料：{SLUG_LIST}

步驟：
1. 讀 src/data/ 下對應的 JSON 找到這張卡目前的資料
2. WebFetch issuer_url（如果 Amex 被擋就改用 WebSearch 限定
   thepointsguy.com, doctorofcredit.com, nerdwallet.com）
3. 對照現有欄位，找出差異：
   annual_fee, signup_bonus_description, signup_bonus_value_estimate,
   signup_bonus_spend_requirement, signup_bonus_time_limit_months,
   earning_rates, key_benefits
4. 產出差異表給我審核
5. 我確認後，你直接改 JSON，並更新：
   - last_verified_at = 今天
   - offer_expires_at = 如果是限時 offer
   - status / status_note = 如果產品有變動
```

### 🟡 中規模（6~20 張卡）

用 subagent 分批跑（參考 2026-04-17 那次的做法）：

1. 建 `docs/card-updates-YYYY-MM-DD.md` 總報告
2. 派 1~2 個 `general-purpose` agent 並行 research
3. agent 產出 per-card diff 到分檔
4. 自己審核後再派 agent 寫回 JSON
5. 跑 `npm run build && npm run check-freshness` 驗證

### 🔴 大規模（全 56 張卡）

照 2026-04-17 那次的做法，分 4 批（Chase / Amex / Citi+CapOne / Other）。完整指令看 `docs/card-data-updates-2026-04-17.md` 裡的 agent prompt。

## 📋 Refresh 時要檢查的欄位

每次 refresh 都要更新這些「硬性」欄位：

```json
{
  "annual_fee": 95,
  "annual_fee_waived_first_year": false,
  "signup_bonus_description": "...",
  "signup_bonus_value_estimate": 937,
  "signup_bonus_spend_requirement": 5000,
  "signup_bonus_time_limit_months": 3,
  "earning_rates": { ... },
  "key_benefits": [ ... ],
  "last_verified_at": "YYYY-MM-DD",
  "offer_expires_at": "YYYY-MM-DD" | undefined,
  "issuer_url": "...",
  "status": "active" | "closed_to_new" | "discontinued" | "issuer_transition",
  "status_note": "..."
}
```

`benefits` array 不是硬性，但如果發現明顯缺漏（像 Amex Platinum 的 Oura Ring credit）順手補。

## 🚨 常見陷阱

1. **Amex 官網會 return 403** — 不要浪費時間 fetch `americanexpress.com/us/credit-cards/...` product pages。直接走 WebSearch 限定 TPG/DoC/NerdWallet。
2. **Citi/CapOne signup bonus 是 JS 渲染的** — WebFetch 抓到 `{$amount}` 模板變數時代表要改走聚合站。
3. **Welcome offer 因人而異（Amex 特別明顯）** — 記錄「公開最高 elevated offer」，並在 `offer_expires_at` 註明到期日。
4. **"One-bonus-per-lifetime" 限制** — Amex 大部分卡都有；轉換卡（Platinum → Gold downgrade）可能仍可拿。這個規則寫在 CLAUDE.md。
5. **限時 offer 結束後**：不要留「到期日是過去」的資料。把 SUB 改回標準 offer，或把 offer_expires_at 拿掉。
6. **Issuer 更換**（例：Apple Card 從 Goldman → Chase）：用 `status: "issuer_transition"` + `status_note`。

## 🔔 自動化（Phase 4，未來可做）

- **GitHub Actions**：每天跑 `npm run check-freshness`，有 expired 就開 issue
- **Vercel Cron Job**：抓 `issuer_url` 檢查頁面是否改版（banner、新 disclaimer）
- **Email/Slack 通知**：串接 expiry 前 7 天警告

目前這些是 nice-to-have，手動跑 `check-freshness` 已經夠用。

## 📁 檔案位置

| 檔 | 用途 |
|---|---|
| `src/data/*-cards.json` | 實際的卡片資料 |
| `src/scripts/check-freshness.ts` | 健診腳本 |
| `docs/card-updates-{issuer}.md` | 每次 refresh 的 diff 報告（保留供稽核） |
| `docs/card-data-updates-YYYY-MM-DD.md` | Refresh session 總覽 |
| `docs/refresh-workflow.md` | 本檔 |
