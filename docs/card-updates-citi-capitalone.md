# Citi & Capital One 卡片資料更新報告

**查詢時間**: 2026-04-17
**研究員**: Claude Code
**成功率**: 11 / 11 卡片均取得可靠資料（10/11 High，1/11 Medium）

## 摘要
- Citi 5 張：多數開卡禮與年費與現 JSON 接近，但 Strata Premier 的開卡禮 **下調** 為 60,000 點（原 75,000 點）、Hotel Credit 機制需重寫（非 thankyou.com $100 credit，而是 Citi Travel 訂 $500+ 飯店折 $100）、earning rates 缺 10x Citi Travel。AAdvantage Executive 開卡禮 **降為 70k miles / $7,000 消費**（原 70k / $10,000）。
- Capital One 6 張：最大發現是 **Savor / SavorOne 品牌調換**（2024/10 起）。現 JSON 的「Savor $95 年費」卡已不再接受申請；「Savor」現為原 SavorOne（$0 年費）；SavorOne 現為 $39 年費、針對 fair credit 的新卡。VentureOne 的一般消費為 **1.25x**（已正確）、Venture/Venture X 的 earning 結構需補齊 5x/10x 細節。Venture 目前有 1/20–4/13/2026 限時 75k+$250 travel credit（**今天剛到期 4 天**，標準為 75k）。

---

## Citi Double Cash Card (`citi-double-cash`)

**資料來源**: citi.com 官方頁、Doctor of Credit（2026-04）、NerdWallet
**查詢時間**: 2026-04-17
**信心度**: High

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|---|---|---|---|
| annual_fee | 0 | 0 | ✅ 無變動 |
| signup_bonus_description | $1,500 / 6 個月 / $200 | 相同 | ✅ 無變動 |
| earning_rates.general | 2% / 2x TYP | 相同 | ✅ 無變動 |
| earning_rates.citi_travel | — | 5% total（2% base + 3% bonus）on hotels/cars/attractions via Citi Travel | 建議新增 |

### 建議 JSON patch
```json
{
  "earning_rates": {
    "citi_travel_hotels_cars_attractions": "5% total (2% base + 3% bonus) / 5x TYP",
    "general": "2% cash back（1% 消費時 + 1% 繳帳單時）/ 2x ThankYou Points"
  }
}
```

### 備註
現 JSON 正確，僅缺 Citi Travel 3% bonus 類別。無年費卡無影響點數策略。

---

## Citi Custom Cash Card (`citi-custom-cash`)

**資料來源**: Doctor of Credit（2026-04）、NerdWallet、TPG
**查詢時間**: 2026-04-17
**信心度**: High

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|---|---|---|---|
| annual_fee | 0 | 0 | ✅ |
| signup_bonus | $1,500 / 6mo / $200 | 相同 | ✅ |
| earning_rates.top_category | 5% 首 $500 | 相同 | ✅ |
| earning_rates.citi_travel_promo | — | 6/30/2026 前 Citi Travel 訂飯店/租車/attractions 享額外 4% | 限時促銷 |

### 建議 JSON patch
```json
// 可選：在 key_benefits 新增限時促銷
"每月自動偵測消費最高的類別享 5% 回饋",
"限時至 2026/6/30：Citi Travel 訂飯店/租車/景點門票享額外 4% 回饋"
```

### 備註
現 JSON 正確。Citi 48 個月規則適用。

---

## Citi Strata Premier Card (`citi-strata-premier`)

**資料來源**: citi.com 官方頁、NerdWallet、TPG（2026-04）
**查詢時間**: 2026-04-17
**信心度**: High

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|---|---|---|---|
| annual_fee | 95 | 95 | ✅ |
| signup_bonus miles | 75,000 TYP / $4,000 / 3mo | **60,000 TYP** / $4,000 / 3mo | ⚠️ 降低 |
| signup_bonus_value_estimate | 750 | ~600（TPG 估 1.85cpp 為 ~$1,140，保守用 $600） | 降低 |
| earning_rates.citi_travel | — | **10x TYP** on hotels/cars/attractions via Citi Travel | 缺漏 |
| earning_rates.flights/hotels 3x | 合併 | 3x on air travel + other hotels（Citi Travel 外）| 語意修正 |
| hotel_credit 說明 | 每年 $100 Hotel Credit（透過 thankyou.com 訂） | 每年 **1 次**，於 **cititravel.com** 訂 **$500+** 飯店住宿折 $100（訂購時立抵） | 重寫 |
| 外加 | — | 無 authorized user fees | 新增好處 |

### 建議 JSON patch
```json
{
  "signup_bonus_description": "開卡後 3 個月內消費滿 $4,000 可獲得 60,000 ThankYou Points",
  "signup_bonus_value_estimate": 600,
  "earning_rates": {
    "citi_travel_hotels_cars_attractions": "10x TYP",
    "air_travel_and_other_hotels": "3x TYP",
    "dining": "3x TYP",
    "groceries": "3x TYP",
    "gas_and_ev_charging": "3x TYP",
    "general": "1x TYP"
  },
  "benefits": [
    {
      "benefit_category": "hotel_credit",
      "benefit_name": "$100 Hotel Credit",
      "benefit_description": "每日曆年 1 次，透過 cititravel.com 訂購 $500+（不含稅費）的單次飯店住宿，訂購當下自動折抵 $100",
      "benefit_value": 100,
      "benefit_type": "credit",
      "reset_date_type": "calendar_year"
    }
  ]
}
```

### 備註
開卡禮從 75k 降至 60k，是本次報告中降幅最明顯的卡片。Hotel Credit 使用方式有明顯差異（非月/年任意 credit，而是單筆折扣 + 最低消費門檻）。移除「ground_transportation」和獨立 ev_charging（官方分類為 gas + EV 合併 3x）。

---

## Citi / AAdvantage Platinum Select World Elite Mastercard (`citi-aadvantage-platinum-select`)

**資料來源**: TPG AA current offers、NerdWallet（2026-01 加薪活動）
**查詢時間**: 2026-04-17
**信心度**: High

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|---|---|---|---|
| annual_fee | 99 (首年免) | 99（首年免）| ✅ |
| signup_bonus | 50k miles / $2,500 / 3mo | 標準同；**限時 80k / $3,500 / 4mo**（待確認是否仍有效） | 可能升級 |
| earning_rates | AA 2x / dining 2x / gas 2x / 一般 1x | 相同 | ✅ |
| companion_certificate | $20,000 贈 companion certificate | **改為 $20,000 贈 $125 flight discount**（依 NerdWallet 最新說法） | 待確認 |

### 建議 JSON patch
```json
{
  "signup_bonus_description": "開卡後 3 個月內消費滿 $2,500 可獲得 50,000 AAdvantage miles（限時 80k/$3,500/4mo 供應中，待確認期限）",
  "key_benefits": [
    "首年免年費",
    "免費託運第一件行李（持卡人 + 同訂位最多 4 名旅伴）",
    "優先登機",
    "25% 機上消費折扣",
    "每年消費滿 $20,000 獲得 $125 AA 機票折扣（待確認 vs Companion Certificate）"
  ]
}
```

### 備註
Companion certificate 與 $125 flight discount 兩種說法並存，官方頁 404 無法直接驗證，建議保守標「待確認」。Citi 48 個月規則適用。

---

## Citi / AAdvantage Executive World Elite Mastercard (`citi-aadvantage-executive`)

**資料來源**: TPG（2026-03 review）、TPG AA current offers
**查詢時間**: 2026-04-17
**信心度**: High

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|---|---|---|---|
| annual_fee | 595 | 595 | ✅ |
| signup_bonus | 70k miles / **$10,000** / 3mo | 70k miles / **$7,000** / 3mo | ⚠️ 消費門檻**下調** |
| earning_rates | AA 4x / dining 2x / 一般 1x | 相同 | ✅ |
| authorized_user_fee | — | 3 位 AU $175/年（額外每位 $175） | 新增 |
| $40,000 earn 10k EQMs | 是 | 相同（建議保留）| ✅ |

### 建議 JSON patch
```json
{
  "signup_bonus_description": "開卡後 3 個月內消費滿 $7,000 可獲得 70,000 AAdvantage miles",
  "signup_bonus_spend_requirement": 7000,
  "key_benefits": [
    "Admirals Club 貴賓室免費使用（可帶 2 位同行旅客）",
    "免費託運前三件行李",
    "優先登機和安檢",
    "Global Entry / TSA PreCheck 報銷",
    "每年消費滿 $40,000 贈送 10,000 EQMs",
    "Authorized User：3 位合計 $175/年，額外每位 $175"
  ]
}
```

### 備註
門檻下調對用戶有利。AU 費用為 2024 年新增，現 JSON 未列出。

---

## Capital One Venture X Rewards Credit Card (`capital-one-venture-x`)

**資料來源**: capitalone.com 官方頁、TPG 當前 offer 頁（2026-04）
**查詢時間**: 2026-04-17
**信心度**: High（標準 offer）/ Medium（100k 限時是否仍在）

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|---|---|---|---|
| annual_fee | 395 | 395 | ✅ |
| signup_bonus | 75k / $4,000 / 3mo | 標準 75k / $4,000 / 3mo（**限時 100k / $10,000 / 6mo** 2025-11 起，仍在供應，待驗證結束日）| 部分更新 |
| earning_rates.hotels_cars_via_portal | 5x | **10x**（hotels + rental cars via Capital One Travel） | ⚠️ 修正 |
| earning_rates.flights_via_portal | 10x | **5x**（flights + vacation rentals via Capital One Travel） | ⚠️ 修正 |
| earning_rates.flights_direct | 2x | 一般 2x（flights 不是官方 bonus 類） | 修正 |

### 建議 JSON patch
```json
{
  "signup_bonus_description": "開卡後 3 個月內消費滿 $4,000 可獲得 75,000 miles（限時 100k/$10,000/6mo 活動供應中，待確認結束日）",
  "earning_rates": {
    "hotels_rental_cars_via_capital_one_travel": "10x miles",
    "flights_vacation_rentals_via_capital_one_travel": "5x miles",
    "general": "2x miles"
  }
}
```

### 備註
現 JSON 把 flights 10x 和 hotels 5x **搞反了**。官方正確是 hotels/cars 10x、flights/vacation rentals 5x。其他 benefits（$300 travel credit、10k anniversary miles、Capital One Lounge 2026-02-01 起政策變更）現 JSON 描述正確。

---

## Capital One Venture Rewards Credit Card (`capital-one-venture`)

**資料來源**: capitalone.com 官方頁、TPG 當前 offer、NerdWallet
**查詢時間**: 2026-04-17
**信心度**: High

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|---|---|---|---|
| annual_fee | 95 | 95 | ✅ |
| signup_bonus | 75k / $4,000 / 3mo | 相同（2026-01-20～2026-04-13 曾有 75k + $250 Capital One Travel credit 限時加碼，**今日已過期**） | ✅ 標準值 |
| earning_rates | portal 5x / general 2x | hotels/cars via Capital One Travel 5x / general 2x | 同，用詞更精確 |
| extra benefit | $50 experience credit on Lifestyle Collection | — | 缺漏，Hertz Five Star status 缺漏 |

### 建議 JSON patch
```json
{
  "earning_rates": {
    "hotels_rental_cars_via_capital_one_travel": "5x miles",
    "general": "2x miles"
  },
  "key_benefits": [
    "所有消費 2x miles",
    "可轉點到 15+ 航空夥伴",
    "Miles 可直接折抵旅行消費",
    "Global Entry / TSA PreCheck 報銷（up to $120）",
    "無外幣交易手續費",
    "Hertz Five Star 租車會員",
    "Lifestyle Collection 飯店/度假村 $50 experience credit"
  ]
}
```

### 備註
1/20–4/13/2026 限時 $250 Capital One Travel credit 已於本報告 4 天前（4/13）結束。若 4/14 後重啟活動需查證，建議此次更新先不含。

---

## Capital One VentureOne Rewards Credit Card (`capital-one-ventureone`)

**資料來源**: capitalone.com 官方頁、TPG capital-one-best-welcome-offers（2026-04）
**查詢時間**: 2026-04-17
**信心度**: High

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|---|---|---|---|
| annual_fee | 0 | 0 | ✅ |
| signup_bonus | 20k / $500 / 3mo → $1,000 | 20k / **$500** / 3mo | ⚠️ spend_requirement 目前 JSON 寫 1000 但標準為 500 |
| earning_rates.general | 1.25x | 1.25x | ✅ |
| earning_rates.portal | 5x | 5x hotels/cars via Capital One Travel | ✅ |

### 建議 JSON patch
```json
{
  "signup_bonus_description": "開卡後 3 個月內消費滿 $500 可獲得 20,000 Capital One miles",
  "signup_bonus_spend_requirement": 500
}
```

### 備註
現 JSON `signup_bonus_spend_requirement: 1000` 疑似舊值，TPG 最新顯示為 $500 最低門檻。

---

## Capital One Savor Cash Rewards Credit Card (`capital-one-savor`)

**資料來源**: NerdWallet（Savor/SavorOne rebrand 報導）、TPG Savor review、Doctor of Credit
**查詢時間**: 2026-04-17
**信心度**: High（**重大變更**）

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|---|---|---|---|
| annual_fee | **95** | **0** | ⚠️ 舊 $95 Savor 已於 2024-07 停止接受申請，10 月 SavorOne（$0）接管「Savor」名稱 |
| signup_bonus | $300 / $3,000 / 3mo | **$200 / $500 / 3mo** | ⚠️ 大幅調整 |
| earning_rates.dining/entertainment/streaming | **4%** | **3%** | ⚠️ 下調 |
| earning_rates.groceries | 3% | 3% | ✅ |
| earning_rates.capital_one_travel | — | 5% hotels/vacation rentals/rental cars | 新增 |
| foreign_transaction_fee | 0 | 0 | ✅ |

### 建議 JSON patch
```json
{
  "card_network": "Mastercard",
  "annual_fee": 0,
  "signup_bonus_description": "開卡後 3 個月內消費滿 $500 可獲得 $200 現金回饋",
  "signup_bonus_value_estimate": 200,
  "signup_bonus_spend_requirement": 500,
  "signup_bonus_time_limit_months": 3,
  "earning_rates": {
    "capital_one_travel_hotels_vacation_rentals_rental_cars": "5% cash back",
    "dining": "3% cash back",
    "entertainment": "3% cash back",
    "streaming": "3% cash back",
    "groceries": "3% cash back（Walmart/Target 除外）",
    "general": "1% cash back"
  },
  "key_benefits": [
    "餐廳/娛樂/串流/超市 3% 回饋",
    "Capital One Travel 5% 回饋",
    "Capital One Entertainment 購票優先",
    "無外幣交易手續費",
    "無年費"
  ]
}
```

### 備註
**現 JSON 描述的舊 Savor（$95/4%）已停接申請。** 必須更新為新 Savor（$0/3%）的資料，否則誤導用戶。注意這張卡 = 原來的 SavorOne。

---

## Capital One SavorOne Cash Rewards Credit Card (`capital-one-savorone`)

**資料來源**: TPG SavorOne review、Doctor of Credit relaunch 報導
**查詢時間**: 2026-04-17
**信心度**: Medium（新卡、資料仍在流動）

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|---|---|---|---|
| annual_fee | **0** | **$39** | ⚠️ 2025 重啟的 SavorOne 是 fair credit 卡，有 $39 年費 |
| credit_score_recommended | Good (670+) | Fair (580+) | ⚠️ |
| signup_bonus | $200 / $500 / 3mo | **無 welcome bonus** | ⚠️ |
| earning_rates.dining/entertainment/groceries/streaming | 3% | 3% | ✅ |
| earning_rates.capital_one_entertainment | — | 8% | 新增 |
| earning_rates.capital_one_travel | — | 5% | 新增 |

### 建議 JSON patch
```json
{
  "annual_fee": 39,
  "annual_fee_waived_first_year": false,
  "signup_bonus_description": "此卡無開卡禮",
  "signup_bonus_value_estimate": 0,
  "signup_bonus_spend_requirement": 0,
  "signup_bonus_time_limit_months": 0,
  "earning_rates": {
    "capital_one_entertainment": "8% cash back",
    "capital_one_travel": "5% cash back",
    "dining": "3% cash back",
    "entertainment": "3% cash back",
    "streaming": "3% cash back",
    "groceries": "3% cash back（Walmart/Target 除外）",
    "general": "1% cash back"
  },
  "credit_score_recommended": "Fair (580+)",
  "key_benefits": [
    "Capital One Entertainment 8% 回饋",
    "Capital One Travel 5% 回饋",
    "餐廳/娛樂/串流/超市 3% 回饋",
    "針對 fair credit（580+）",
    "$39 年費但無外幣手續費",
    "無開卡禮"
  ]
}
```

### 備註
**⚠️ 重大決策**：建議站方考慮是否保留此卡。現版 SavorOne 目標客群（fair credit）與主站定位（多為 good/excellent credit 使用者）不太相符。或可用 `is_active: false` 隱藏，改為推薦 Savor。待確認是否站方要保留此 slug。

---

## Capital One Quicksilver Cash Rewards Credit Card (`capital-one-quicksilver`)

**資料來源**: TPG（2026-04 current offer）、NerdWallet、Doctor of Credit
**查詢時間**: 2026-04-17
**信心度**: High

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|---|---|---|---|
| annual_fee | 0 | 0 | ✅ |
| signup_bonus | $200 / $500 / 3mo | $200 / $500 / 3mo + **$100 Capital One Travel credit** 首年（立即可用） | 新增 travel credit |
| earning_rates.general | 1.5% | 1.5% | ✅ |
| earning_rates.capital_one_travel | — | 5% on hotels/rental cars via Capital One Travel | 新增 |
| earning_rates.capital_one_entertainment | — | 5% | 新增 |

### 建議 JSON patch
```json
{
  "signup_bonus_description": "開卡後 3 個月內消費滿 $500 獲得 $200 現金回饋 + 首年 $100 Capital One Travel credit",
  "signup_bonus_value_estimate": 300,
  "earning_rates": {
    "capital_one_travel_hotels_rental_cars": "5% cash back",
    "capital_one_entertainment": "5% cash back",
    "general": "1.5% cash back"
  },
  "key_benefits": [
    "無年費",
    "所有消費 1.5% 無上限回饋",
    "Capital One Travel 5% 回饋（hotels/rental cars）",
    "首年 $100 Capital One Travel credit",
    "無外幣交易手續費",
    "0% APR 前 15 個月"
  ]
}
```

### 備註
開卡禮實質總值從 $200 升至 $300。5x 類別應補上。

---

## 整體建議

### 高優先（資料已明顯不正確，建議立即更新）
1. **capital-one-savor**：現 JSON 是已停接的舊 $95 卡，必須改為 $0 年費新 Savor
2. **capital-one-savorone**：需改為 $39 fair credit 卡或停用
3. **capital-one-venture-x**：earning rates hotels 10x/flights 5x **顛倒**
4. **citi-aadvantage-executive**：消費門檻 $10,000 → $7,000
5. **citi-strata-premier**：開卡禮 75k → 60k、hotel credit 說明重寫

### 中優先
6. **capital-one-ventureone**：signup_bonus_spend_requirement 1000 → 500
7. **capital-one-quicksilver**：加入 5x travel/entertainment 與 $100 travel credit
8. **citi-aadvantage-platinum-select**：Companion Cert vs $125 flight discount 待查證

### 低優先（補充資訊）
9. **citi-double-cash**：補 Citi Travel 5x 類別
10. **citi-custom-cash**：補 2026-06-30 Citi Travel 限時促銷
11. **capital-one-venture**：補 Hertz Five Star 和 Lifestyle Collection $50 credit

### 資料來源限制
- Citi 官方 AA 卡片頁均 404（可能 URL 已變），只能靠 TPG/NerdWallet
- Capital One 官方頁 welcome bonus 常為 JS 渲染，signup 數字需靠第三方
- Venture X 的 100k 限時 offer 起始於 2025-11，結束日未公告，保守處理為「標準 75k + 限時 100k 待確認」
