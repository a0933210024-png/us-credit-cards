# Amex 信用卡資料更新報告

**查詢時間**: 2026-04-17
**研究方法**: WebSearch (allowed_domains: thepointsguy.com, doctorofcredit.com, nerdwallet.com)
**Amex 官網狀態**: 如預期會 403 blocked，本次全程未嘗試 americanexpress.com 產品頁
**搜尋成功率**: 14/14 (100%)

## 總覽：主要變動

| 卡片 | 最大變動 |
|------|---------|
| amex-platinum | Welcome offer 已升級為 175K/$12K，信心度 High |
| amex-gold | Welcome offer 現上看 100K/$6K（原 JSON 60K） |
| amex-business-platinum | Welcome offer 上看 300K/$20K；年費已升 $695→$895 |
| amex-business-gold | Welcome offer 上看 200K/$15K，$240+$155+$150 新 credit |
| amex-hilton-honors | 新 limited-time offer 70K + Free Night，到 4/15/2026（已過期） |
| amex-hilton-aspire | Welcome offer 175K/$6K（與 JSON 一致） |
| amex-hilton-surpass | Welcome offer 130K + Free Night（與 JSON 一致） |
| amex-marriott-bonvoy-brilliant | Welcome offer 上調至 200K/$6K（原 95K） |
| amex-delta-skymiles-gold | Welcome offer 上看 80K/$2K（原 40K/$3K） |
| amex-delta-skymiles-platinum | Welcome offer 上看 90K/$3K（原 60K/$5K） |
| amex-delta-skymiles-reserve | Welcome offer 上看 100K/$5K（原 60K/$6K） |
| amex-green | 無重大變動（40K/$3K 維持） |
| amex-blue-cash-preferred | 第一年 $0 年費（原 JSON $95 從第一年起） |
| amex-blue-cash-everyday | Home Chef credit 新增；現公開 offer $200（與 JSON 一致） |

---

## The Platinum Card from American Express (`amex-platinum`)

**資料來源**:
- https://thepointsguy.com/credit-cards/amex-platinum-current-offer/
- https://thepointsguy.com/credit-cards/amex-platinum-2025-refresh/
- https://www.doctorofcredit.com/american-express-platinum-175000-points-signup-bonus/
**信心度**: High

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|------|--------|---------|------|
| signup_bonus_description | 80,000 MR / $8K / 6 月 | 175,000 MR / $12K / 6 月 | 2025/9 refresh 後最高公開值 |
| signup_bonus_value_estimate | 1600 | 3500 | TPG 9/2025 valuation |
| signup_bonus_spend_requirement | 8000 | 12000 | |
| key_benefits | 未含 Oura Ring / 未更新 entertainment | 應加 $200 Oura Ring credit；$300 Entertainment credit 已確認 | |

### 建議 JSON patch
```json
{
  "signup_bonus_description": "開卡後 6 個月內消費滿 $12,000 可獲得最高 175,000 Membership Rewards 點數（因人而異）",
  "signup_bonus_value_estimate": 3500,
  "signup_bonus_spend_requirement": 12000,
  "key_benefits_add": ["$200 Oura Ring Credit（每年一次，透過 ouraring.com 購買）"]
}
```

### 備註
- Welcome offer 是 CardMatch/pre-qualify 因人而異，175K 為公開最高值
- 年費 $895 已正確

---

## American Express Gold Card (`amex-gold`)

**資料來源**: https://thepointsguy.com/credit-cards/amex-gold-current-offer/
**信心度**: High

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|------|--------|---------|------|
| signup_bonus_description | 60,000 MR / $6K | 最高 100,000 MR / $6K / 6 月 | TPG 2/2026 valuation |
| signup_bonus_value_estimate | 1200 | 2000 | |

### 建議 JSON patch
```json
{
  "signup_bonus_description": "開卡後 6 個月內消費滿 $6,000 可獲得最高 100,000 Membership Rewards 點數（因人而異）",
  "signup_bonus_value_estimate": 2000
}
```

### 備註
- 年費 $325 與現有 credit 結構正確

---

## American Express Green Card (`amex-green`)

**資料來源**: https://thepointsguy.com/credit-cards/amex-green-current-offer/
**信心度**: High

✅ **無重大變動**
- 40,000 MR / $3,000 / 6 月：與 JSON 一致
- 年費 $150 正確
- CLEAR+ credit：NerdWallet 顯示為 $199（JSON 為 $189），可能為 CLEAR 漲價，建議確認至 $199

### 建議 JSON patch
```json
{
  "key_benefits": ["旅行/交通/餐廳 3x MR", "$199 CLEAR Plus Credit", "LoungeBuddy 機場貴賓室（每年使用 2 次）", "轉點到航空/飯店夥伴"],
  "benefits[0].benefit_value": 199,
  "benefits[0].benefit_description": "報銷 CLEAR Plus 會員費用，享快速通關（CLEAR 會費已升至 $199）"
}
```

---

## Blue Cash Preferred Card from American Express (`amex-blue-cash-preferred`)

**資料來源**: https://www.nerdwallet.com/credit-cards/reviews/american-express-blue-cash-preferred
**信心度**: High

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|------|--------|---------|------|
| annual_fee_waived_first_year | false | true | $0 intro for first year, then $95 |
| signup_bonus_value_estimate | 250 | 250（最高 300） | 公開 offer $250，因人有機會 $300 |

### 建議 JSON patch
```json
{
  "annual_fee_waived_first_year": true
}
```

### 備註
- 首年免年費為當前標準 offer

---

## Blue Cash Everyday Card from American Express (`amex-blue-cash-everyday`)

**資料來源**: https://www.nerdwallet.com/credit-cards/reviews/american-express-blue-cash-everyday
**信心度**: Medium

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|------|--------|---------|------|
| key_benefits | 未含 Disney 與 Home Chef | 應加 $84 Disney Streaming + $180 Home Chef credit | 較新 refresh 加入的 credit |

### 建議 JSON patch
```json
{
  "key_benefits": ["無年費", "超市和網購 3% 回饋", "加油 3% 回饋", "$84 Disney Streaming Credit（每月 $7）", "$180 Home Chef Credit（每月 $15）", "0% APR 前 15 個月"],
  "benefits_add": [
    {"benefit_category": "streaming", "benefit_name": "$84 Disney Streaming Credit", "benefit_value": 84, "reset_date_type": "monthly"},
    {"benefit_category": "dining_credit", "benefit_name": "$180 Home Chef Credit", "benefit_value": 180, "reset_date_type": "monthly"}
  ]
}
```

---

## Hilton Honors American Express Card (`amex-hilton-honors`)

**資料來源**: https://thepointsguy.com/credit-cards/hilton-honors-amex-current-offers/
**信心度**: High

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|------|--------|---------|------|
| signup_bonus_description | 70,000 / $2K | 70,000 + Free Night / $2K / 6 月（limited-time 至 4/15/2026，已過期） | 4/15 到期，需查當前 offer |

### 建議 JSON patch
```json
{
  "note_to_verify": "Limited-time 70K + Free Night offer 於 4/15/2026 結束，4/17 當天應重新查詢新 offer"
}
```

### 備註
- 該 limited-time offer 正好於今天前 2 天（2026-04-15）到期，建議之後再驗證

---

## Hilton Honors American Express Surpass Card (`amex-hilton-surpass`)

**資料來源**: https://thepointsguy.com/credit-cards/hilton-honors-amex-current-offers/
**信心度**: High

✅ **無重大變動**
- 130,000 Hilton points + 1 Free Night / $3K / 6 月：與 JSON 一致
- 年費 $150 正確
- Earning rates 正確

---

## Hilton Honors American Express Aspire Card (`amex-hilton-aspire`)

**資料來源**: https://thepointsguy.com/credit-cards/hilton-honors-amex-current-offers/
**信心度**: High

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|------|--------|---------|------|
| signup_bonus_description | 175K / $6K | 150K 或 175K / $6K（elevated offer） | 175K 為近期 elevated，150K 為常規 |

✅ 大致一致，JSON 記錄 175K（公開最高值）正確
- 年費 $550 正確

---

## Marriott Bonvoy Brilliant American Express Card (`amex-marriott-bonvoy-brilliant`)

**資料來源**:
- https://thepointsguy.com/credit-cards/marriott-bonvoy-current-offers/
- https://www.nerdwallet.com/credit-cards/news/marriott-bonvoy-boundless-bevy-brilliant-unveil-new-bonus-offers-march-2026
**信心度**: High

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|------|--------|---------|------|
| signup_bonus_description | 95K / $6K | 200,000 Bonvoy points / $6K / 6 月（至 5/13/2026） | 2026 年初大幅提升 |
| signup_bonus_value_estimate | 760 | 1600 | TPG valuation |

### 建議 JSON patch
```json
{
  "signup_bonus_description": "開卡後 6 個月內消費滿 $6,000 可獲得 200,000 Marriott Bonvoy 點數（限時至 5/13/2026）",
  "signup_bonus_value_estimate": 1600
}
```

---

## Delta SkyMiles Gold American Express Card (`amex-delta-skymiles-gold`)

**資料來源**: https://www.nerdwallet.com/reviews/credit-cards/american-express-gold-delta-skymiles
**信心度**: High

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|------|--------|---------|------|
| signup_bonus_description | 40K / $3K | 最高 80,000 SkyMiles / $2K / 6 月 | 當前 public elevated offer |
| signup_bonus_value_estimate | 480 | 960 | 1.2¢/mile × 80K |
| signup_bonus_spend_requirement | 3000 | 2000 | 同時下調 |
| annual_fee_waived_first_year | false | true | $0 intro for first year, then $150 |

### 建議 JSON patch
```json
{
  "signup_bonus_description": "開卡後 6 個月內消費滿 $2,000 可獲得最高 80,000 Delta SkyMiles",
  "signup_bonus_value_estimate": 960,
  "signup_bonus_spend_requirement": 2000,
  "annual_fee_waived_first_year": true
}
```

---

## Delta SkyMiles Platinum American Express Card (`amex-delta-skymiles-platinum`)

**資料來源**: https://thepointsguy.com/credit-cards/delta-amex-current-offers/
**信心度**: High

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|------|--------|---------|------|
| signup_bonus_description | 60K / $5K | 最高 90,000 / $3K / 6 月 | |
| signup_bonus_value_estimate | 720 | 1080 | |
| signup_bonus_spend_requirement | 5000 | 3000 | |

### 建議 JSON patch
```json
{
  "signup_bonus_description": "開卡後 6 個月內消費滿 $3,000 可獲得最高 90,000 Delta SkyMiles",
  "signup_bonus_value_estimate": 1080,
  "signup_bonus_spend_requirement": 3000
}
```

### 備註
- 年費 $350 正確
- Companion Certificate 維持

---

## Delta SkyMiles Reserve American Express Card (`amex-delta-skymiles-reserve`)

**資料來源**: https://thepointsguy.com/credit-cards/delta-amex-current-offers/
**信心度**: High

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|------|--------|---------|------|
| signup_bonus_description | 60K / $6K | 最高 100,000 / $5K / 6 月 | |
| signup_bonus_value_estimate | 720 | 1200 | 1.2¢/mile |
| signup_bonus_spend_requirement | 6000 | 5000 | |

### 建議 JSON patch
```json
{
  "signup_bonus_description": "開卡後 6 個月內消費滿 $5,000 可獲得最高 100,000 Delta SkyMiles",
  "signup_bonus_value_estimate": 1200,
  "signup_bonus_spend_requirement": 5000
}
```

### 備註
- 年費 $650 正確
- Sky Club 政策已改為 15 visits/年（2024 起）；若每年消費 $75K+ 享 unlimited — 建議補充說明

---

## The Business Platinum Card from American Express (`amex-business-platinum`)

**資料來源**:
- https://thepointsguy.com/credit-cards/amex-business-platinum-current-offer/
- https://thepointsguy.com/credit-cards/amex-business-platinum-2025-refresh/
- https://www.doctorofcredit.com/american-express-refreshes-platinum-business-platinum-cards-895-fee-175k-200k-bonus-many-new-credits/
**信心度**: High

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|------|--------|---------|------|
| annual_fee | 695 | 895 | 2025 refresh 後已漲 $200 |
| signup_bonus_description | 150K / $15K / 3 月 | 最高 300K / $20K / 3 月 | |
| signup_bonus_value_estimate | 3000 | 6000 | |
| signup_bonus_spend_requirement | 15000 | 20000 | |
| key_benefits | Dell $400 | Dell 結構變更：$150 + $1000 達標獎勵 | |
| key_benefits | 未含 $600 Hotel / $200 Hilton / $120 Wireless / $360 Indeed | 已加入新 credit | |

### 建議 JSON patch
```json
{
  "annual_fee": 895,
  "signup_bonus_description": "開卡後 3 個月內消費滿 $20,000 可獲得最高 300,000 Membership Rewards 點數（因人而異）",
  "signup_bonus_value_estimate": 6000,
  "signup_bonus_spend_requirement": 20000,
  "key_benefits": [
    "航班和預付飯店 5x MR",
    "單筆超過 $5K 消費享 1.5x MR",
    "$600 Hotel Credit（透過 Amex Travel 訂 FHR/THC）",
    "$200 航空 Fee Credit",
    "$200 Hilton Credit（每季 $50）",
    "$1,150 Dell Credit（$150 基礎 + $1,000 達標後獎勵）",
    "$360 Indeed Credit（每季 $90）",
    "$120 Wireless Credit（每月 $10）",
    "$200 Adobe Credit",
    "Centurion Lounge、Priority Pass、Delta Sky Club（搭 Delta 時）",
    "Hilton Gold / Marriott Gold Elite"
  ]
}
```

### 備註
- 年費漲價為本次 refresh 最大變動，與消費 Platinum 同步

---

## American Express Business Gold Card (`amex-business-gold`)

**資料來源**:
- https://thepointsguy.com/credit-cards/amex-business-gold-current-offer/
- https://www.nerdwallet.com/business/credit-cards/reviews/american-express-business-gold
**信心度**: High

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|------|--------|---------|------|
| signup_bonus_description | 100K / $15K / 3 月 | 最高 200K / $15K / 3 月 | 4/2026 elevated offer |
| signup_bonus_value_estimate | 2000 | 4000 | |
| key_benefits | Uber $240 | $240 FedEx/Grubhub/Office Supply + $155 Walmart+ + $150 Squarespace | 2025/10 新增 |

### 建議 JSON patch
```json
{
  "signup_bonus_description": "開卡後 3 個月內消費滿 $15,000 可獲得最高 200,000 Membership Rewards 點數（因人而異）",
  "signup_bonus_value_estimate": 4000,
  "key_benefits": [
    "每月消費最高的 2 個類別自動享 4x MR",
    "$240 FedEx/Grubhub/Office Supply Credit（每月 $20）",
    "$155 Walmart+ Credit（每月 $12.95）",
    "$150 Squarespace Credit（2025/10 新增）",
    "可轉點到航空/飯店夥伴",
    "靈活的付款方式（可選擇分期或全額）"
  ]
}
```

### 備註
- ⚠️ 現 JSON 有 `$240 Uber Credit`，但最新資料顯示 Business Gold 的 $240 credit 是 FedEx/Grubhub/Office Supply（非 Uber）— 可能是消費 Gold 混淆，建議更正
- DoC 提及 Amex 正在調查 $495 年費 + AI credit 的未來版本，目前未上線

---

## Guardrail 提醒
- 所有 welcome offer 記錄的是**公開最高值**（pre-qualify/elevated）；實際因人而異
- 所有 Amex 卡片適用 **one-bonus-per-lifetime** 規則
- Amex Platinum / Business Platinum / Green / Gold / Business Gold 為 Charge Card，不計入 5-card limit
- CLEAR+ 會費已自 $189 升至 $199（影響 Green / Platinum / Aspire 的 credit 額度，Amex 通常同步調整 — 建議 Platinum $209、Aspire $209 也重新確認）
