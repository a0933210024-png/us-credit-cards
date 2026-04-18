# 信用卡資料更新總報告 — 2026-04-17

> 針對 `src/data/*-cards.json` 中 56 張卡的最新資訊審核結果。詳細 diff 與 JSON patch 在各分檔，這份是**決策總覽**。

## 📁 分項報告

| 銀行群組 | 張數 | 完整報告 |
|---|---|---|
| Chase | 17 | [card-updates-chase.md](./card-updates-chase.md) |
| American Express | 14 | [card-updates-amex.md](./card-updates-amex.md) |
| Citi + Capital One | 11 | [card-updates-citi-capitalone.md](./card-updates-citi-capitalone.md) |
| Other（Bilt/USB/WF/BoA/Barclays/Apple/Atmos） | 14 | [card-updates-other.md](./card-updates-other.md) |

**整體抓取成功率：56/56（100%）** — Amex 官網被擋，全改走 TPG/DoC/NerdWallet 交叉驗證。

---

## 🚨 P0：重大結構性問題（必改）

### 1. Capital One Savor/SavorOne 品牌已互換（2024-07 起）
- 現 JSON 的 `capital-one-savor`（$95/4%）其實是**已停發**的舊卡
- 現今「Savor」= 舊 SavorOne（$0 年費、3% 餐飲/娛樂/串流/雜貨）
- 現今「SavorOne」= 全新 $39 fair-credit 卡，無開卡禮
- **處置建議**：重寫兩張卡的 schema，或將舊 Savor 標 `is_active: false`

### 2. Capital One Venture X 賺點率顛倒
- 現 JSON：flights 10x / hotels 5x
- 正確：**hotels/rental cars via CapOne Travel = 10x，flights/vacation rentals = 5x**

### 3. Amex Business Gold 的 "$240 Uber Credit" 是錯的
- 那是消費版 Gold 的福利；Business Gold 實際是 FedEx/Grubhub/Office Supply credits
- 疑似當初 data entry 時混淆了

### 4. Citi Strata Premier 飯店 credit 條件寫錯
- 現 JSON：「每年 $100 Hotel Credit via thankyou.com」
- 正確：每年一次，在 **cititravel.com 訂 $500+ 住宿折 $100**

---

## 📉 P1：產品狀態變更（需改 `is_active` 或重寫）

| 卡 | 狀態 | 建議 |
|---|---|---|
| **Barclays Aviator Red** | 2025-10 停發，2026-04-26 自動轉為 Citi AA 卡 | `is_active: false` + 加備註 |
| **US Bank Altitude Reserve** | 2024-11 停收新申請，2025-12 點數從 1.5cpp 貶到 1cpp | `is_active: false` |
| **Apple Card** | 2026-01 公告從 Goldman 轉給 **JPMorgan Chase**（~24 個月 rollout） | 加備註；福利短期不變 |
| **Bilt Obsidian / Palladium** | 2026-01-14 Bilt 2.0 全新推出 | 重寫 — 現 JSON 的開卡禮格式完全不對 |
| **Alaska → Atmos Ascent / Summit** | 2025 Alaska 改名 Atmos，Ascent 目前 85K / Summit 100K SUB | 確認卡名改對 |

---

## 💰 P2：開卡禮 / 年費變動（需更新數值）

### 大幅調升的年費
- **Chase United Explorer**: $95 → **$150**（首年 $0）
- **Chase United Quest**: $250 → **$350**
- **Chase United Club Infinite**: $525 → **$695**
- **Chase Southwest Priority**: $149 → **$229**（$75 travel credit 被砍）
- **Amex Business Platinum**: $695 → **$895**（2025 refresh）

### 開卡禮上調（值得申請時機）
- **Amex Platinum**: 175K / $12K / 6m（確認，JSON 已對）
- **Amex Gold**: 60K → **100K** / $6K
- **Amex Business Gold**: 100K → **200K**
- **Amex Marriott Brilliant**: 95K → **200K** / $6K（限時至 5/13/2026）
- **Amex Business Platinum**: → **300K** / $20K
- **Chase United Explorer**: 60K → 80K
- **Chase United Club Infinite**: 80K → 110K + 3K PQP
- **Chase Ink Business Preferred**: 90K → **100K UR**
- **Chase Freedom Unlimited**: $200 → $250
- **Marriott Bonvoy Boundless**: 3 → 4 free nights + $100 airline credit（2026 限時）
- **Amazon Prime Visa**: $200 → $150 GC（但 Chase Travel 加入 5% tier）

### Spend 門檻降低
- **Citi AA Executive**: $10K → **$7K**（仍給 70K miles）
- **Marriott Bonvoy Bold**: $2K → **$1K** spend，Elite Nights 15 → 5
- **Capital One VentureOne**: $1K → **$500**
- **Wells Fargo Autograph**: spend $1.5K → **$1K**
- **BofA Premium Rewards**: spend $3K → **$4K**（反向，變難了）

### 開卡禮下調
- **Citi Strata Premier**: 75K → **60K**

### 首年免年費新增
- **Amex Blue Cash Preferred**: 現提供 $0 first year（JSON 為 false）
- **Amex Delta SkyMiles Gold**: 現提供 $0 first year（JSON 為 false）

---

## 🧩 P3：福利細節修正

### 缺漏 / 錯誤的 credit
- **Amex Platinum**: 漏 $200 Oura Ring credit
- **Amex Business Platinum**: Dell credit 改為 $150 + $1K spend bonus；新增 $600 Hotel、$200 Hilton、$120 Wireless、$360 Indeed credits
- **Amex Blue Cash Everyday**: 漏 Disney Bundle ($84) 和 Home Chef ($180) credits
- **Amex Green**: CLEAR Plus credit 需調為 $199（CLEAR 漲價）
- **Chase Capital One Quicksilver**: 新增 $100 Capital One Travel credit
- **Chase IHG Premier**: 新增 $20K/$40K 年消費里程碑獎勵
- **Chase Freedom Rise**: 改為 $25 autopay bonus（無消費門檻）
- **Chase World of Hyatt**: 重構為 30K + 2x on $15K/6m（最高 60K）

### 賺點率 / 年費錯誤
- **US Bank Altitude Connect**: JSON 寫 $95（首年免），實際 **$0 年費**；SUB 20K/$1K；雜貨從 4x 降 2x
- **Chase United 系列三張**: earning rates 全部改版（詳見 chase 報告）

---

## ⏰ 時效性注意

幾個優惠在「今天附近」到期，套用時要再確認：
- **Amex Hilton Honors 70K + Free Night** 2026-04-15 已結束（2 天前）— 需要重查現行 offer
- **Capital One Venture Jan–Apr 2026 限時優惠**（$250 travel + 75K）2026-04-13 已結束（4 天前）
- **Capital One Venture X 100K/$10K 限時** 狀態未確認（標為「待確認」）
- **Marriott Brilliant 200K** 5/13/2026 到期
- **Amex Hilton Aspire 175K** 與 JSON 相符，確認
- **Hilton Surpass** 無變動

---

## ✅ 完全無變動（可放心跳過）

- Chase Sapphire Preferred、Sapphire Reserve、Freedom Flex
- Chase Ink Business Cash、Ink Business Unlimited
- Amex Hilton Surpass、Hilton Aspire、Green（結構相符）
- Wells Fargo Active Cash、Autograph Journey
- BofA Customized Cash Rewards

---

## 🔧 建議的套用順序

```
Phase 1（今天做）— 修錯誤，不涉及追蹤時限
  1. P0 全部（Savor/SavorOne 重寫、Venture X 點率、Business Gold、Strata Premier）
  2. P1 狀態變更（Aviator Red、Altitude Reserve 標 inactive；Bilt 2.0 重寫；Atmos 確認）
  3. P2 年費變動（不會因時間失效）

Phase 2（一週內做）— 開卡禮數字，套用前再查一次
  4. P2 開卡禮變動 — 每張套用前 fetch 一次該卡最新 offer 確認
  5. P3 福利細節

Phase 3（持續）— 建立定期 refresh 機制
  6. 寫一個 npm script，每 2 週自動重跑這次的 research，產新 diff
```

---

## ⚠️ 做這次 refresh 時發現的結構性問題

這次爬文時發現幾個**流程問題**，建議順便修：

1. **現 JSON 沒有 `last_verified_at` 欄位** — 不知道每張卡資料的新鮮度
2. **沒有 `offer_expires_at`** — 限時優惠過期了仍在顯示
3. **沒有 `issuer_url` 欄位** — 每次要重新找官網連結
4. **benefit 項目跟卡片分離儲存**（`benefits` array），但有些欄位已 outdated，不易判斷哪些是當年福利、哪些已終止

要不要我把這 4 個結構性改進也規劃進下一步？

---

## 📝 下一步請你決定

1. **要我直接動手改 JSON 嗎？** 若要，從哪個優先級開始？（建議 P0 + P1 先）
2. **P2 開卡禮要套到什麼程度？** 全套？還是只套「已確認長期變動」（像年費）？
3. **要不要同時加 schema 欄位**（last_verified_at / offer_expires_at / issuer_url）？
