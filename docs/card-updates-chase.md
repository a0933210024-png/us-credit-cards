# Chase 信用卡資料更新報告

**查詢日期**: 2026-04-17
**資料來源**: Chase 官網為主，TPG / DoC / NerdWallet 為輔
**Fetch 成功率**: 13/17 Chase 頁面 WebFetch 成功（76%），其餘 4 張以 WebSearch 補齊
**總結**: 17 張卡中 **12 張有變動**（含 signup bonus 更新、年費調漲、earning rates 改版），**5 張無變動**

---

## Chase Sapphire Preferred (`chase-sapphire-preferred`)

**資料來源**: https://creditcards.chase.com/rewards-credit-cards/sapphire/preferred
**查詢時間**: 2026-04-17
**信心度**: High

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|------|---------|----------|------|
| annual_fee | $95 | $95 | 無變動 |
| signup_bonus_description | 3 個月內 $5,000 得 75,000 UR | 3 個月內 $5,000 得 75,000 UR | 無變動 |
| signup_bonus_value_estimate | 937 | 937 | 無變動 |
| earning_rates | 如現 JSON | 與現 JSON 一致 | 無變動 |
| key_benefits | 如現 JSON | Chase 新增 trip cancel up to $10,000、auto rental $60,000；現 JSON 已列主要福利 | ✅ 無變動（現有 7 條 key_benefits 已涵蓋重點） |

### 建議 JSON patch
✅ 無變動

---

## Chase Sapphire Reserve (`chase-sapphire-reserve`)

**資料來源**: https://creditcards.chase.com/rewards-credit-cards/sapphire/reserve
**查詢時間**: 2026-04-17
**信心度**: High

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|------|---------|----------|------|
| annual_fee | $795 | $795 | 無變動 |
| signup_bonus_description | 3 個月 $6,000 得 125,000 UR | 同上（官方標明「$2,500 value」） | 無變動 |
| signup_bonus_value_estimate | 2500 | 2500 | 無變動 |
| earning_rates | 如現 JSON | 與現 JSON 一致 | 無變動 |
| key_benefits | 如現 JSON | 官網 IHG Platinum Elite 現為「through 12/31/27」 | 微調：IHG 狀態明確到 12/31/27 |

### 建議 JSON patch
✅ 無變動（IHG 狀態描述可選擇更新）

---

## Chase Freedom Unlimited (`chase-freedom-unlimited`)

**資料來源**: https://creditcards.chase.com/cash-back-credit-cards/freedom/unlimited
**查詢時間**: 2026-04-17
**信心度**: High

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|------|---------|----------|------|
| annual_fee | $0 | $0 | 無變動 |
| signup_bonus_description | 3 個月 $500 得 $200 | 3 個月 $500 得 **$250** | ✏️ 改了（開卡禮提高） |
| signup_bonus_value_estimate | 200 | 250 | ✏️ 改了 |
| earning_rates | 如現 JSON | 一致 | 無變動 |

### 建議 JSON patch
```json
{
  "signup_bonus_description": "開卡後 3 個月內消費滿 $500 可獲得 $250 現金回饋（或 25,000 UR 點數）",
  "signup_bonus_value_estimate": 250
}
```

---

## Chase Freedom Flex (`chase-freedom-flex`)

**資料來源**: https://creditcards.chase.com/cash-back-credit-cards/freedom/flex
**查詢時間**: 2026-04-17
**信心度**: High

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|------|---------|----------|------|
| annual_fee | $0 | $0 | 無變動 |
| signup_bonus_description | 3 個月 $500 得 $200 | 一致 | 無變動 |
| earning_rates | 如現 JSON | 一致 | 無變動 |

### 建議 JSON patch
✅ 無變動

---

## Chase Freedom Rise (`chase-freedom-rise`)

**資料來源**: https://creditcards.chase.com/cash-back-credit-cards/freedom/rise
**查詢時間**: 2026-04-17
**信心度**: High

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|------|---------|----------|------|
| annual_fee | $0 | $0 | 無變動 |
| signup_bonus_description | 3 個月 $500 + 6 個月準時繳款得 $25 | **前 3 個月內設定 autopay 並維持 90 天得 $25** | ✏️ 改了（條件從「消費 $500 + 準時繳款」改為「啟用自動扣款」） |
| signup_bonus_spend_requirement | 500 | **0** | ✏️ 改了 |

### 建議 JSON patch
```json
{
  "signup_bonus_description": "開卡後 3 個月內啟用自動扣款（autopay）並維持至少 90 天可獲 $25 statement credit",
  "signup_bonus_spend_requirement": 0
}
```

---

## Chase Ink Business Preferred (`chase-ink-business-preferred`)

**資料來源**: https://creditcards.chase.com/business-credit-cards/ink/business-preferred
**查詢時間**: 2026-04-17
**信心度**: High

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|------|---------|----------|------|
| annual_fee | $95 | $95 | 無變動 |
| signup_bonus_description | 3 個月 $8,000 得 90,000 UR | 3 個月 $8,000 得 **100,000 UR** | ✏️ 改了（開卡禮提高） |
| signup_bonus_value_estimate | 1125 | 1250 | ✏️ 改了 |

### 建議 JSON patch
```json
{
  "signup_bonus_description": "開卡後 3 個月內消費滿 $8,000 可獲得 100,000 Ultimate Rewards 點數",
  "signup_bonus_value_estimate": 1250,
  "key_benefits": [
    "UR 點數透過 portal 訂旅行價值提升 25%",
    "可轉點到 Hyatt/United 等夥伴",
    "開卡禮 100K UR 是 Chase 商業卡中最高之一",
    "可將 UR 點數轉給個人 Sapphire 卡",
    "DashPass 會員資格 + 每月 $10 DoorDash grocery credit"
  ]
}
```

---

## Chase Ink Business Cash (`chase-ink-business-cash`)

**資料來源**: https://creditcards.chase.com/business-credit-cards/ink/cash
**查詢時間**: 2026-04-17
**信心度**: High

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|------|---------|----------|------|
| annual_fee | $0 | $0 | 無變動 |
| signup_bonus_description | 3 個月 $6,000 得 $750 | 一致 | 無變動 |
| earning_rates | 如現 JSON | 一致 | 無變動 |

### 建議 JSON patch
✅ 無變動

---

## Chase Ink Business Unlimited (`chase-ink-business-unlimited`)

**資料來源**: https://creditcards.chase.com/business-credit-cards/ink/unlimited
**查詢時間**: 2026-04-17
**信心度**: High

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|------|---------|----------|------|
| annual_fee | $0 | $0 | 無變動 |
| signup_bonus_description | 3 個月 $6,000 得 $750 | 一致 | 無變動 |
| earning_rates | 如現 JSON | 一致 | 無變動 |

### 建議 JSON patch
✅ 無變動

---

## United Explorer Card (`chase-united-explorer`)

**資料來源**: https://creditcards.chase.com/travel-credit-cards/united/united-explorer
**查詢時間**: 2026-04-17
**信心度**: High

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|------|---------|----------|------|
| annual_fee | $95 | **$150** | ✏️ 改了（年費調漲，第一年 $0） |
| annual_fee_waived_first_year | false | **true** | ✏️ 改了 |
| signup_bonus_description | 3 個月 $3,000 得 60,000 miles | 3 個月 $3,000 得 **70,000 miles + 加副卡再 10,000**（共 80,000） | ✏️ 改了 |
| signup_bonus_value_estimate | 780 | ~1040 | ✏️ 改了 |
| earning_rates | 現 JSON（2x United/dining/hotel） | **9x United 機票 / 3x 其他 United / 2x 飯店 + 餐廳 / 1x 其他** | ✏️ 大改版 |
| key_benefits | 如現 JSON | 新增：$100 United travel credit（年 $10,000 後）、10,000 miles 獎勵（年 $20,000 後）、$500+ partner credits | ✏️ 改了 |

### 建議 JSON patch
```json
{
  "annual_fee": 150,
  "annual_fee_waived_first_year": true,
  "signup_bonus_description": "開卡後 3 個月內消費滿 $3,000 得 70,000 miles + 3 個月內新增副卡再得 10,000 miles（共 80,000）",
  "signup_bonus_value_estimate": 1040,
  "signup_bonus_spend_requirement": 3000,
  "signup_bonus_time_limit_months": 3,
  "earning_rates": {
    "united_flights": "9x United miles（United 機票）",
    "united_other": "3x United miles（其他 United 消費）",
    "dining": "2x United miles",
    "hotel": "2x United miles",
    "general": "1x United miles"
  },
  "key_benefits": [
    "免費託運第一件行李（同行最多一人也免費）",
    "優先登機",
    "每年 2 張 United Club 一次性通行證",
    "25% 機上消費折扣",
    "$100 United travel credit（年度消費 $10,000 後）",
    "10,000 mile 獎勵機票折扣（年度消費 $20,000 後）",
    "$500+ partner credits（hotels、rideshare、Instacart、Avis/Budget、JSX）",
    "Global Entry / TSA PreCheck / NEXUS credit 每 4 年 $120"
  ]
}
```

### 備註
- 2025 United 卡全線改版（annual fee + earning rates），本條為改版後現況

---

## United Quest Card (`chase-united-quest`)

**資料來源**: https://creditcards.chase.com/travel-credit-cards/united/united-quest
**查詢時間**: 2026-04-17
**信心度**: High

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|------|---------|----------|------|
| annual_fee | $250 | **$350** | ✏️ 改了 |
| signup_bonus_description | 3 個月 $4,000 得 70,000 miles | **3 個月 $4,000 得 90,000 miles + 3,000 PQP，加副卡再 10,000（共 100,000 miles + 3,000 PQP）** | ✏️ 改了 |
| signup_bonus_value_estimate | 910 | ~1300 | ✏️ 改了 |
| earning_rates | 如現 JSON | **10x United 機票 / 4x 其他 United / 2x 其他 travel / 2x 餐廳 / 2x streaming / 1x 其他** | ✏️ 大改版 |
| key_benefits | $125 travel credit + 2 bags + 5k PQP + 10k 週年 | **$200 United travel credit**、免費託運前 2 件、10,000 mile 獎勵折扣、1,000 annual card bonus PQP、$530 partner credits | ✏️ 改了 |

### 建議 JSON patch
```json
{
  "annual_fee": 350,
  "signup_bonus_description": "開卡後 3 個月內消費滿 $4,000 得 90,000 United miles + 3,000 PQP + 3 個月內新增副卡再得 10,000 miles（共 100,000 miles + 3,000 PQP）",
  "signup_bonus_value_estimate": 1300,
  "signup_bonus_spend_requirement": 4000,
  "earning_rates": {
    "united_flights": "10x United miles（United 機票）",
    "united_other": "4x United miles（其他 United 消費）",
    "travel": "2x United miles",
    "dining": "2x United miles",
    "streaming": "2x United miles",
    "general": "1x United miles"
  },
  "key_benefits": [
    "每年 $200 United 旅行 credit",
    "免費託運前兩件行李",
    "Priority 登機",
    "10,000 mile 獎勵機票折扣（每年 + 年度消費 $20,000 後再一次）",
    "1,000 annual card bonus PQP",
    "Global Entry / TSA PreCheck / NEXUS credit（每 4 年 $120）",
    "$530+ partner credits（hotels、rideshare、Instacart、JSX、Avis/Budget）"
  ]
}
```

### 備註
- 2025 United 卡改版後現況

---

## United Club Infinite Card (`chase-united-club-infinite`)

**資料來源**: https://creditcards.chase.com/travel-credit-cards/united/club-infinite
**查詢時間**: 2026-04-17
**信心度**: High

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|------|---------|----------|------|
| annual_fee | $525 | **$695** | ✏️ 改了 |
| signup_bonus_description | 3 個月 $5,000 得 80,000 miles | **3 個月 $5,000 得 100,000 miles + 3,000 PQP + 加副卡再 10,000 miles**（共 110,000 + 3,000 PQP） | ✏️ 改了 |
| signup_bonus_value_estimate | 1040 | ~1430 | ✏️ 改了 |
| earning_rates | 4x United/2x dining/2x travel/1x | **11x United 機票 / 5x 其他 United / 5x prepaid Renowned Hotels / 2x travel 和 dining / 1x 其他** | ✏️ 大改版 |
| key_benefits | 如現 JSON | 新增：$875 partner credits、1,500 annual card bonus PQP、20,000 mile 獎勵折扣；既有 United Club 無限使用仍在 | ✏️ 改了 |

### 建議 JSON patch
```json
{
  "annual_fee": 695,
  "signup_bonus_description": "開卡後 3 個月內消費滿 $5,000 得 100,000 miles + 3,000 PQP + 3 個月內新增副卡再得 10,000 miles（共 110,000 + 3,000 PQP）",
  "signup_bonus_value_estimate": 1430,
  "earning_rates": {
    "united_flights": "11x United miles（United 機票）",
    "united_other": "5x United miles（其他 United 消費）",
    "renowned_hotels": "5x United miles（Renowned Hotels prepaid）",
    "travel": "2x United miles",
    "dining": "2x United miles",
    "general": "1x United miles"
  },
  "key_benefits": [
    "United Club 貴賓室無限使用（價值 $750+）",
    "免費託運前兩件行李（本人 + 同行一位）",
    "Global Entry / TSA PreCheck / NEXUS credit（每 4 年 $120）",
    "Premier Access（優先報到/安檢/登機/行李）",
    "1,500 annual card bonus PQP",
    "每年 20,000 mile 獎勵機票折扣",
    "$875+ partner credits（hotel、rideshare、car rental、Instacart、JSX）"
  ]
}
```

---

## World of Hyatt Credit Card (`chase-world-of-hyatt`)

**資料來源**: https://creditcards.chase.com/travel-credit-cards/world-of-hyatt-credit-card
**查詢時間**: 2026-04-17
**信心度**: High

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|------|---------|----------|------|
| annual_fee | $95 | $95 | 無變動 |
| signup_bonus_description | 3 個月 $6,000 得 30,000 + 再 $15,000 得 2 晚 free night | **3 個月 $3,000 得 30,000 + 前 6 個月內最多 $15,000 消費享 2x 點數（可再拿 30,000）** | ✏️ 改了（結構大改，現在是「加倍點數」非 free nights） |
| signup_bonus_value_estimate | 600 | ~1200（60,000 Hyatt 點數 ~ $1,200） | ✏️ 改了 |
| signup_bonus_spend_requirement | 6000 | **3000**（初始門檻） | ✏️ 改了 |
| earning_rates | 如現 JSON | 一致 | 無變動 |
| key_benefits | 如現 JSON | 一致（Cat 1-4 Free Night、Discoverist、$15K 消費再 1 晚） | 無變動 |

### 建議 JSON patch
```json
{
  "signup_bonus_description": "開卡後 3 個月內消費滿 $3,000 可獲得 30,000 Hyatt 點數，加上前 6 個月內消費最多 $15,000 享 2x 點數（可多賺 30,000 點），共最高 60,000 點",
  "signup_bonus_value_estimate": 1200,
  "signup_bonus_spend_requirement": 3000,
  "signup_bonus_time_limit_months": 3
}
```

### 備註
- 第二段 bonus 的 6 個月與第一段 3 個月並列計算，time_limit_months 仍維持 3（主要 bonus 門檻）

---

## Marriott Bonvoy Boundless (`chase-marriott-bonvoy-boundless`)

**資料來源**: https://creditcards.chase.com/travel-credit-cards/marriott-bonvoy/boundless
**查詢時間**: 2026-04-17
**信心度**: High

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|------|---------|----------|------|
| annual_fee | $95 | $95 | 無變動 |
| signup_bonus_description | 3 個月 $3,000 得 3 晚 Free Night（每晚 50,000 點） | **3 個月 $3,000 得 3 晚 FNA + 4 個月 $4,000 再 1 晚（共 4 晚，每晚最高 50,000 點）+ $100 airline credit（2026 限定）** | ✏️ 改了（增加 1 晚 + airline credit） |
| signup_bonus_value_estimate | 750 | ~1100（4 晚 × $250 + $100） | ✏️ 改了 |
| earning_rates | 6x Marriott/3x dining,groceries,gas/2x 其他 | **6x Marriott / 3x dining+gas+groceries（前 $6,000/年合計） / 2x 其他** | 微改：3x 有 $6,000/年上限（現 JSON 未標註） |
| key_benefits | 如現 JSON | 一致 | 無變動 |

### 建議 JSON patch
```json
{
  "signup_bonus_description": "開卡後 3 個月內消費滿 $3,000 得 3 晚 Free Night Awards + 4 個月內消費滿 $4,000 再得 1 晚（共 4 晚 FNA，每晚最高 50,000 點）+ $100 airline credit（2026 限定）",
  "signup_bonus_value_estimate": 1100,
  "earning_rates": {
    "marriott_purchases": "6x Marriott Bonvoy points",
    "dining_gas_groceries": "3x Marriott Bonvoy points（前 $6,000/年合計）",
    "general": "2x Marriott Bonvoy points"
  }
}
```

### 備註
- 若 $100 airline credit 2026 之後終止（1/8/2026–10/1/2026 核卡可享），此 value estimate 應回落至 ~1000

---

## Marriott Bonvoy Bold (`chase-marriott-bonvoy-bold`)

**資料來源**: https://creditcards.chase.com/travel-credit-cards/marriott-bonvoy/bold
**查詢時間**: 2026-04-17
**信心度**: High

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|------|---------|----------|------|
| annual_fee | $0 | $0 | 無變動 |
| signup_bonus_description | 3 個月 $2,000 得 30,000 點 | **3 個月 $1,000 得 30,000 點** | ✏️ 改了（門檻降低） |
| signup_bonus_spend_requirement | 2000 | **1000** | ✏️ 改了 |
| earning_rates | 3x Marriott/2x dining/2x travel/1x | **3x Marriott / 2x groceries+rideshare+food delivery+streaming/internet/cable/phone / 1x 其他** | ✏️ 改了（2x 類別重整） |
| key_benefits | Silver Elite + 15 Elite Nights | **Silver Elite + 5 Elite Night Credits**（不是 15）+ Pay Yourself Back | ✏️ 改了（Elite Nights 下調） |

### 建議 JSON patch
```json
{
  "signup_bonus_description": "開卡後 3 個月內消費滿 $1,000 可獲得 30,000 Marriott Bonvoy 點數",
  "signup_bonus_spend_requirement": 1000,
  "earning_rates": {
    "marriott_purchases": "3x Marriott Bonvoy points",
    "groceries_rideshare_delivery_streaming": "2x Marriott Bonvoy points（groceries、rideshare、food delivery、streaming/internet/cable/phone）",
    "general": "1x Marriott Bonvoy points"
  },
  "key_benefits": [
    "無年費 Marriott 卡",
    "Marriott 消費 3x 回饋",
    "自動獲得 Silver Elite 會員資格",
    "5 Elite Night Credits",
    "Pay Yourself Back（airline / hotel 消費點數折抵，每年上限 $750）"
  ]
}
```

---

## IHG One Rewards Premier Credit Card (`chase-ihg-one-rewards-premier`)

**資料來源**: https://creditcards.chase.com/travel-credit-cards/ihg-rewards-club/premier
**查詢時間**: 2026-04-17
**信心度**: High

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|------|---------|----------|------|
| annual_fee | $99 | $99 | 無變動 |
| signup_bonus_description | 3 個月 $3,000 得 140,000 | 一致（或加碼到 200k 的限時 offer 另計） | 無變動 |
| earning_rates | 10x IHG / 5x dining+gas+travel / 3x 其他 | 一致 | 無變動 |
| key_benefits | 如現 JSON | 新增：$100 statement credit + 10,000 bonus points（年消費 $20k 後）、Diamond Elite（年 $40k） | 微增（高額消費獎勵） |

### 建議 JSON patch
```json
{
  "key_benefits": [
    "IHG 消費 10x 點數",
    "每年持卡週年贈送 1 晚 Free Night Award（最高 40,000 點）",
    "自動獲得 Platinum Elite 會員資格",
    "第 4 晚免費（用點數兌換時）",
    "Global Entry / TSA PreCheck 報銷",
    "年度消費 $20,000 得 $100 credit + 10,000 點",
    "年度消費 $40,000 升級 Diamond Elite"
  ]
}
```

---

## Southwest Rapid Rewards Priority Credit Card (`chase-southwest-priority`)

**資料來源**: https://creditcards.chase.com/travel-credit-cards/southwest/priority
**查詢時間**: 2026-04-17
**信心度**: High

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|------|---------|----------|------|
| annual_fee | $149 | **$229** | ✏️ 改了（大漲） |
| signup_bonus_description | 3 個月 $4,000 得 50,000 點 | **3 個月 $2,000 得 60,000 點** | ✏️ 改了（門檻降、點數增） |
| signup_bonus_value_estimate | 700 | ~840 | ✏️ 改了 |
| signup_bonus_spend_requirement | 4000 | **2000** | ✏️ 改了 |
| earning_rates | 3x Southwest / 2x hotel partner+transit+streaming / 1x | **4x Southwest / 2x 加油站+餐廳 / 1x 其他** | ✏️ 大改版 |
| key_benefits | $75 credit、7,500 週年、4 張 upgraded boarding、Companion Pass | **免費託運第一件行李（本人 + 最多 8 同行）、7,500 點週年、Preferred seat、無限 Extra Legroom 升級（48 小時內）、Group 5 登機、25% 機上消費**；**不再有 $75 travel credit、不再有 upgraded boarding 4 張** | ✏️ 大改版 |

### 建議 JSON patch
```json
{
  "annual_fee": 229,
  "signup_bonus_description": "開卡後 3 個月內消費滿 $2,000 可獲得 60,000 Southwest 點數",
  "signup_bonus_value_estimate": 840,
  "signup_bonus_spend_requirement": 2000,
  "earning_rates": {
    "southwest_purchases": "4x SW points",
    "gas_stations": "2x SW points",
    "dining": "2x SW points",
    "general": "1x SW points"
  },
  "key_benefits": [
    "免費託運第一件行李（本人 + 最多 8 位同行）",
    "每年 7,500 點週年禮",
    "Preferred seat 座位選擇（訂位時）",
    "無限次 Extra Legroom 座位升級（起飛前 48 小時內）",
    "Group 5 登機（更早搶行李艙）",
    "25% 機上消費折扣",
    "累積 Companion Pass 所需點數",
    "DashPass 會員資格 1 年"
  ]
}
```

### 備註
- 此卡 2025 年改版，年費 + benefits 大洗牌（對標 Southwest 取消隨身行李政策）
- `benefits` 陣列中 `$75 Southwest Credit` 物件應刪除（已非現行福利）

---

## Amazon Prime Visa (`chase-amazon-prime-visa`)

**資料來源**: https://creditcards.chase.com/cash-back-credit-cards/amazon-prime-rewards
**查詢時間**: 2026-04-17
**信心度**: High

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|------|---------|----------|------|
| annual_fee | $0 | $0 | 無變動 |
| signup_bonus_description | 核卡後 $200 Amazon Gift Card | **核卡後 $150 Amazon Gift Card** | ✏️ 改了（開卡禮下調） |
| signup_bonus_value_estimate | 200 | 150 | ✏️ 改了 |
| earning_rates | 5% Amazon/WF, 2% travel,dining,gas, 1% 其他 | **5% Amazon + WF + Chase Travel（需 Prime）, 2% 加油+餐廳+transit/rideshare, 1% 其他** | 微改（Chase Travel 新加入 5%；transit/rideshare 取代 travel 作為 2%） |

### 建議 JSON patch
```json
{
  "signup_bonus_description": "核卡後立即獲得 $150 Amazon Gift Card（需 Prime 會員）",
  "signup_bonus_value_estimate": 150,
  "earning_rates": {
    "amazon": "5% cash back（需 Prime 會員）",
    "whole_foods": "5% cash back（需 Prime 會員）",
    "chase_travel": "5% cash back（需 Prime 會員）",
    "gas": "2% cash back",
    "dining": "2% cash back",
    "transit_rideshare": "2% cash back",
    "general": "1% cash back"
  }
}
```

### 備註
- $150 是近期常態 offer，節慶期可能看到 $200 或 $250
- 無 Prime 會員時 Amazon 回饋降為 3%（現 JSON 描述仍正確）

---

# 彙總

## 有變動（12 張，建議更新）
1. **Chase Freedom Unlimited** — signup $200 → $250
2. **Chase Freedom Rise** — signup 改為 autopay enrollment
3. **Chase Ink Business Preferred** — signup 90k → 100k UR
4. **United Explorer** — AF $95 → $150（第一年 $0）、新 earning rates、bonus up 到 80k
5. **United Quest** — AF $250 → $350、bonus 提升 100k + 3k PQP、新 earning rates
6. **United Club Infinite** — AF $525 → $695、bonus 提升 110k + 3k PQP、新 earning rates
7. **World of Hyatt** — signup 結構改為 30k + 2x points 6 個月（最高 60k）
8. **Marriott Bonvoy Boundless** — signup 3 晚 → 4 晚 + $100 airline credit（2026 限定）
9. **Marriott Bonvoy Bold** — spend $2k → $1k、earning rates 改、Elite Nights 15 → 5
10. **IHG One Rewards Premier** — 新增高額消費獎勵（$20k、$40k milestone）
11. **Southwest Priority** — AF $149 → $229、bonus 50k → 60k、新 earning rates、福利大洗牌
12. **Amazon Prime Visa** — signup $200 → $150、Chase Travel 加入 5% 類別

## 無變動（5 張）
- Chase Sapphire Preferred
- Chase Sapphire Reserve
- Chase Freedom Flex
- Chase Ink Business Cash
- Chase Ink Business Unlimited

## Fetch 統計
- WebFetch 直接成功：Sapphire Preferred、Sapphire Reserve、Freedom Unlimited、Freedom Flex、Freedom Rise、Ink Preferred、Ink Unlimited、Ink Cash、United Explorer、United Quest、United Club Infinite、World of Hyatt、Marriott Boundless、Marriott Bold、IHG Premier、Southwest Priority、Amazon Prime Visa (17/17 最終皆有 Chase 官網資料)
- 部分首嘗試 URL 404，以 WebSearch 找到正確 URL 後重新 fetch，全部皆以 Chase 官方頁面為主要來源
