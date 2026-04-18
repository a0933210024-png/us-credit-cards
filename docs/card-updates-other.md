# Other Cards 更新 Diff Report

**查詢時間**: 2026-04-17
**涵蓋卡片**: 14 張
**成功率**: 14/14 (100%)

## 摘要 / Status Flags

| Slug | 狀態 | 主要變動 |
|---|---|---|
| bilt-blue | active / newly-launched | Bilt 2.0（2026-01-14 上線），新增 $100 Bilt Cash 開卡禮 |
| bilt-obsidian | active / newly-launched | 開卡禮改為 $200 Bilt Cash（免消費門檻），原 JSON 資料不符 |
| bilt-palladium | active / newly-launched | 開卡禮變更；$400 hotel credit 為半年 $200 structure 確認 |
| us-bank-altitude-reserve | closed-to-new-apps | 2024-11 起停止新申請；2025-12 redemption 降至 1cpp；$325 credit 僅限 Travel Center |
| us-bank-altitude-connect | active | 現行 SUB 降至 20k / $1,000；細節有差 |
| wells-fargo-autograph | active | SUB 確認 20k / $1,000（非 $1,500） |
| wells-fargo-autograph-journey | active | 無重大變動 |
| wells-fargo-active-cash | active | ✅ 無變動 |
| bofa-premium-rewards | active | SUB 門檻更正為 $4,000（非 $3,000），earning 為 2x/1.5x base |
| bofa-customized-cash-rewards | active | 季度上限降至 $2,500（原 JSON 正確） |
| barclays-aadvantage-aviator-red | **discontinued** | 2025-10 停售；現有卡 2026-04-26 轉換為 Citi |
| apple-card | active | 2026-01 宣布 Chase 將取代 Goldman Sachs 發卡（約 24 個月過渡） |
| boa-alaska-atmos-ascent | active / newly-launched | 現行限時 85k SUB；標準 70k |
| boa-alaska-atmos-summit | active / newly-launched | 現行 SUB 需要 $6,000 / 90d，80k → 100k targeted |

---

## Bilt Blue Card (`bilt-blue`)

**資料來源**: Bilt Newsroom, The Points Guy, NerdWallet, CNBC Select
**查詢時間**: 2026-04-17
**信心度**: High
**狀態**: active (newly-launched 2026-01-14)

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|---|---|---|---|
| signup_bonus_description | 無固定開卡禮 | 核卡後獲得 $100 Bilt Cash | Bilt 2.0 新增的核卡禮 |
| signup_bonus_value_estimate | 0 | 100 | |

### 建議 JSON patch
```json
{
  "signup_bonus_description": "核卡後獲得 $100 Bilt Cash（免消費門檻）",
  "signup_bonus_value_estimate": 100,
  "signup_bonus_spend_requirement": 0,
  "signup_bonus_time_limit_months": 0
}
```

### 備註
Earning rates 與 JSON 相符。Bilt 2.0 程式 2026-01-14 正式上線。

---

## Bilt Obsidian Card (`bilt-obsidian`)

**資料來源**: Bilt Newsroom, TPG, NerdWallet, OneMileAtATime
**查詢時間**: 2026-04-17
**信心度**: High
**狀態**: active (newly-launched 2026-01-14)

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|---|---|---|---|
| signup_bonus_description | 開卡後 3 個月內消費滿 $2,000 可獲得 25,000 Bilt Points | 核卡後獲得 $200 Bilt Cash（免消費門檻） | 現行公開 offer 不是 25k points |
| signup_bonus_value_estimate | 450 | 200 | |
| signup_bonus_spend_requirement | 2000 | 0 | |
| signup_bonus_time_limit_months | 3 | 0 | |
| key_benefits | 含 $100 年度飯店 credit | 半年分配的年度 Bilt Travel hotel credit（確切金額待確認，Obsidian 較小） | TPG/Bilt 僅說「annual Bilt Travel Hotel credits distributed semi-annually」，未明列金額 |

### 建議 JSON patch
```json
{
  "signup_bonus_description": "核卡後獲得 $200 Bilt Cash（免消費門檻）",
  "signup_bonus_value_estimate": 200,
  "signup_bonus_spend_requirement": 0,
  "signup_bonus_time_limit_months": 0
}
```

### 備註
25,000 Bilt Points / $2,000 的原 JSON 資料在公開 offer 中找不到證據，可能為早期假設。現行核卡即送 $200 Bilt Cash。Hotel credit 確切金額待確認。

---

## Bilt Palladium Card (`bilt-palladium`)

**資料來源**: Bilt Newsroom, TPG, OneMileAtATime, UpgradedPoints, NerdWallet
**查詢時間**: 2026-04-17
**信心度**: High
**狀態**: active (newly-launched 2026-01-14)

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|---|---|---|---|
| signup_bonus_description | $4,000/3m → 50k pts + $300 Bilt Cash + Bilt Gold | 相符（$4,000 於 3 個月非房租消費） | 確認 |
| $400 hotel credit 結構 | 半年 $200 | Jan-Jun $200 + Jul-Dec $200 | 確認 |

### 建議 JSON patch
無重大更動建議。可微調 description 增加精確性：
```json
{
  "signup_bonus_description": "開卡 3 個月內非房租消費滿 $4,000 可獲得 50,000 Bilt Points + 核卡送 $300 Bilt Cash + Bilt Gold 身分"
}
```

### 備註
✅ 大致無變動。

---

## US Bank Altitude Reserve Visa Infinite (`us-bank-altitude-reserve`)

**資料來源**: NerdWallet, UpgradedPoints, FrequentMiler, DoctorOfCredit
**查詢時間**: 2026-04-17
**信心度**: High
**狀態**: **closed-to-new-apps**（2024-11-11 起）

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|---|---|---|---|
| is_active | true | **false**（不接受新申請） | 2024-11 起停止新申請 |
| earning_rates.mobile_wallet | 3x | 3x on first $5,000/billing cycle, then 1x | 2025-12 起限額 |
| earning_rates | 舊結構 | 新增 travel portal 10x hotels/car、5x flights | 2025-12 新政策 |
| key_benefits | Real-Time Mobile Rewards 1.5x | **移除**：redemption 降至 1cpp | 2025-12 起砍 33% |
| key_benefits | $325 travel & dining credit | $325 credit **僅限 US Bank Travel Center** | 2025-12 起限制 |

### 建議 JSON patch
```json
{
  "is_active": false,
  "signup_bonus_description": "目前不接受新申請（2024-11-11 起停止）",
  "signup_bonus_value_estimate": 0,
  "signup_bonus_spend_requirement": 0,
  "signup_bonus_time_limit_months": 0,
  "earning_rates": {
    "travel_portal_hotels_cars": "10x points（US Bank Travel Center）",
    "travel_portal_flights": "5x points（US Bank Travel Center）",
    "mobile_wallet": "3x points（每月帳單週期前 $5,000，之後 1x）",
    "travel_direct": "3x points",
    "dining": "3x points",
    "general": "1x points"
  },
  "key_benefits": [
    "**已停止接受新申請（2024-11-11 起）**",
    "$325 旅行 credit（僅限 US Bank Travel Center）",
    "Priority Pass Select 貴賓室",
    "Global Entry / TSA PreCheck 報銷",
    "點數轉換航空/飯店夥伴（2025-12 新增）",
    "點數兌換旅行降至 1 cpp（2025-12 起，不再有 1.5x Real-Time Mobile Rewards）"
  ]
}
```

### 備註
重大警示：此卡 2024-11-11 起已停止接受新申請；2025-12 又大幅貶值（點數價值 1.5cpp → 1cpp，$325 credit 受限）。建議標記 is_active: false 並在 UI 顯眼提示。

---

## US Bank Altitude Connect Visa Signature (`us-bank-altitude-connect`)

**資料來源**: usbank.com 官網, U.S. News, WalletHub
**查詢時間**: 2026-04-17
**信心度**: High
**狀態**: active

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|---|---|---|---|
| annual_fee | 95 | **0** | 官網顯示無年費 |
| annual_fee_waived_first_year | true | false（本來就無年費） | |
| signup_bonus_description | $2,000/3m → 50,000 點 | **$1,000/90d → 20,000 點** | 大幅降低 |
| signup_bonus_value_estimate | 500 | 200 | |
| signup_bonus_spend_requirement | 2000 | 1000 | |
| earning_rates.travel_via_portal | 5x | 5x（僅 prepaid hotels/cars）| 細節 |
| earning_rates.gas_ev_charging | 4x | 4x（每季 $1,000 上限）| 新增上限 |
| earning_rates.groceries | 4x | **2x**（與 dining、streaming 同級）| 大幅降級 |
| key_benefits | 4 次 lounge visit/年 | 4 次 Priority Pass visits（與現 JSON 對齊）| 原 JSON 寫 2 次，實為 4 次 |
| key_benefits | $30 streaming credit | 待確認（官網未列，可能已取消）| |

### 建議 JSON patch
```json
{
  "annual_fee": 0,
  "annual_fee_waived_first_year": false,
  "signup_bonus_description": "開卡 90 天內消費滿 $1,000 可獲得 20,000 點數",
  "signup_bonus_value_estimate": 200,
  "signup_bonus_spend_requirement": 1000,
  "earning_rates": {
    "travel_portal_prepaid": "5x points（US Bank Travel Center 預付飯店/租車）",
    "travel": "4x points",
    "gas_ev_charging": "4x points（每季 $1,000 上限）",
    "dining": "2x points",
    "streaming": "2x points",
    "groceries": "2x points",
    "general": "1x points"
  },
  "key_benefits": [
    "無年費",
    "旅行 4x、加油/EV 4x（季度上限）",
    "每年 4 次 Priority Pass 貴賓室造訪",
    "TSA PreCheck / Global Entry 報銷（4 年一次）",
    "0% APR 前 15 個月",
    "無外幣交易手續費"
  ]
}
```

### 備註
重大變動：此卡已改為無年費且 SUB 大幅縮水。原 JSON earning rates（4x groceries、$30 streaming credit）與現行卡面明顯不符，可能是舊版資料。

---

## Wells Fargo Autograph Card (`wells-fargo-autograph`)

**資料來源**: TPG, NerdWallet, U.S. News, WF 官網
**查詢時間**: 2026-04-17
**信心度**: High
**狀態**: active

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|---|---|---|---|
| signup_bonus_description | $1,500/3m → 20,000 點 | **$1,000/3m → 20,000 點** | 門檻降低 |
| signup_bonus_spend_requirement | 1500 | 1000 | |
| earning_rates | 6 類 3x | 確認 restaurants, gas/EV, travel, transit, popular streaming, phone plans 3x | 相符 |

### 建議 JSON patch
```json
{
  "signup_bonus_description": "開卡 3 個月內消費滿 $1,000 可獲得 20,000 Rewards 點數",
  "signup_bonus_spend_requirement": 1000
}
```

### 備註
2026 TPG Awards 獲選「No-Annual-Fee Credit Card of the Year」。

---

## Wells Fargo Autograph Journey (`wells-fargo-autograph-journey`)

**資料來源**: TPG, NerdWallet, UpgradedPoints, WF 官網
**查詢時間**: 2026-04-17
**信心度**: High
**狀態**: active

### 差異表
無重大差異。原 JSON 資料（$95 年費、$4,000/3m → 60k 點、5x hotels / 4x airlines / 3x dining & travel / 1x general、$50 flight credit）全部確認。

### 建議 JSON patch
✅ 無變動。

### 備註
建議 key_benefits 中明確 earning 描述：5x hotels、4x airlines、3x other travel & restaurants。

---

## Wells Fargo Active Cash (`wells-fargo-active-cash`)

**資料來源**: U.S. News, WF 官網, WalletHub
**查詢時間**: 2026-04-17
**信心度**: High
**狀態**: active

### 差異表
✅ 無變動。$500/3m → $200、2% flat 全部相符。

### 備註
無變動。

---

## Bank of America Premium Rewards (`bofa-premium-rewards`)

**資料來源**: bankofamerica.com 官網, TPG, U.S. News
**查詢時間**: 2026-04-17
**信心度**: High
**狀態**: active

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|---|---|---|---|
| signup_bonus_description | $3,000/3m → 60k | **$4,000/90d → 60k** | 門檻提高到 $4,000 |
| signup_bonus_spend_requirement | 3000 | 4000 | |
| earning_rates.dining | 3.5x（含加成） | **2x base**（加成後視 Preferred Rewards tier）| JSON 混用加成後數字可能誤導 |
| earning_rates.travel | 3.5x | 2x base | |
| earning_rates.general | 2.625x（Platinum Honors）| 1.5x base | |

### 建議 JSON patch
```json
{
  "signup_bonus_description": "開卡 90 天內消費滿 $4,000 可獲得 60,000 點數",
  "signup_bonus_spend_requirement": 4000,
  "earning_rates": {
    "travel": "2x points（Platinum Honors 加成後最高 3.5x）",
    "dining": "2x points（Platinum Honors 加成後最高 3.5x）",
    "general": "1.5x points（Platinum Honors 加成後最高 2.625x）"
  }
}
```

### 備註
BofA 將於 2026-05 推出新 BofA Rewards Program，未來可能影響此卡。建議後續關注。

---

## Bank of America Customized Cash Rewards (`bofa-customized-cash-rewards`)

**資料來源**: bankofamerica.com, U.S. News, WalletHub
**查詢時間**: 2026-04-17
**信心度**: High
**狀態**: active

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|---|---|---|---|
| choice_category 上限 | 每季 $2,500 | 每季 $2,500（選擇類別 + 2% 類別**合併**計算） | 現 JSON 敘述不夠精確 |

### 建議 JSON patch
```json
{
  "earning_rates": {
    "choice_category": "3% cash back（自選 1 個類別：加油&EV/網購&訂閱/餐廳/旅行/藥局/居家裝修）",
    "groceries_wholesale": "2% cash back",
    "general": "1% cash back",
    "quarterly_cap_note": "3% 與 2% 合併每季 $2,500 上限，超過降為 1%"
  }
}
```

### 備註
目前有首年 6%（限時促銷）offer，但非常態。現有 $200 / $1,000 SUB 相符。

---

## Barclays AAdvantage Aviator Red (`barclays-aadvantage-aviator-red`)

**資料來源**: USCreditCardGuide, DoctorOfCredit
**查詢時間**: 2026-04-17
**信心度**: High
**狀態**: **discontinued**（2025-10 停售）

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|---|---|---|---|
| is_active | true | **false** | 2025-10 起停售新申請；Citi 成為 AA 獨家發卡行 |
| 重大事件 | 未提 | **2026-04-26 自動轉換為 Citi 卡** | 現有卡友即將被轉換 |

### 建議 JSON patch
```json
{
  "is_active": false,
  "signup_bonus_description": "已停售（2025-10）。現有卡將於 2026-04-26 轉換為 Citi AAdvantage 卡",
  "signup_bonus_value_estimate": 0,
  "signup_bonus_spend_requirement": 0,
  "key_benefits": [
    "**已停售 - Barclays 已退出 AA 合作（2025-10）**",
    "**現有卡將於 2026-04-26 自動轉換為 Citi 發行的 AA 卡**",
    "持卡人可保留 AA miles 餘額",
    "行李免託運、優先登機等福利移交至 Citi"
  ]
}
```

### 備註
重大產品狀態變化。建議 UI 明顯標示「已停售，將轉為 Citi 卡」。

---

## Apple Card (`apple-card`)

**資料來源**: apple.com/newsroom, JPMorgan Chase, MacRumors, TechCrunch
**查詢時間**: 2026-04-17
**信心度**: High
**狀態**: active（issuer 轉換中，預計 ~24 個月過渡）

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|---|---|---|---|
| issuer | Apple / Goldman Sachs | **Apple / JPMorgan Chase（轉換中）** | 2026-01-07 官方公告，預計 ~24 個月完成過渡 |
| 其他 | – | Benefits、rewards、Mastercard 網路暫不變 | |

### 建議 JSON patch
```json
{
  "issuer": "Apple / JPMorgan Chase（Goldman Sachs 過渡中）",
  "key_benefits": [
    "無年費",
    "Apple 購物 3% 回饋",
    "Apple Pay 付款 2% 回饋",
    "Daily Cash 每日結算直接入帳",
    "無手續費、無逾期費、無外幣交易手續費",
    "iPhone 上精美的消費追蹤和管理介面",
    "分期購買 Apple 產品 0% 利率",
    "**2026-01 起 JPMorgan Chase 將接替 Goldman Sachs 發卡（過渡約 24 個月）**",
    "Mastercard 網路維持不變"
  ]
}
```

### 備註
現有持卡人短期內福利不變。Goldman 的 Apple Savings 不會自動轉移，需另外處理。

---

## Atmos Rewards Ascent Visa Signature (`boa-alaska-atmos-ascent`)

**資料來源**: alaskaair.com/atmosrewards, DoctorOfCredit, OneMileAtATime, UpgradedPoints, BofA Newsroom
**查詢時間**: 2026-04-17
**信心度**: High
**狀態**: active (newly-launched 2025)

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|---|---|---|---|
| signup_bonus_description | $3,000/90d → 70k + $99 Companion Fare | 現行限時 $4,500/120d → **85,000** + $99 Companion Fare；標準常態為 80k | TPG/DoC 多個來源一致 |
| signup_bonus_value_estimate | 1050 | ~1,275（85k × 1.5cpp + $99 CF ≈ $200） | |
| signup_bonus_spend_requirement | 3000 | 4500（限時）或 3000（早期）| 變動中 |
| signup_bonus_time_limit_months | 3 | 4 個月（120 天，限時 offer）| |

### 建議 JSON patch
```json
{
  "signup_bonus_description": "開卡 120 天內消費滿 $4,500 可獲得 85,000 Atmos Rewards 點數 + $99 Companion Fare（限時 offer，標準為 80k / $3,000）",
  "signup_bonus_value_estimate": 1275,
  "signup_bonus_spend_requirement": 4500,
  "signup_bonus_time_limit_months": 4
}
```

### 備註
限時 85k offer 持續中，無確切截止日期。24 個月 cooldown（曾擁有此卡 24 個月內不可再申請）值得加到 application_rules。

---

## Atmos Rewards Summit Visa Infinite (`boa-alaska-atmos-summit`)

**資料來源**: bankofamerica.com, UpgradedPoints, OneMileAtATime, DoctorOfCredit, TPG
**查詢時間**: 2026-04-17
**信心度**: High
**狀態**: active (newly-launched 2025-08)

### 差異表
| 欄位 | 現 JSON | 最新查到 | 說明 |
|---|---|---|---|
| signup_bonus_description | $4,000/90d → 80k + 25k Global Companion Award | 現行 targeted offer：**$6,000/90d → 100k + 25k Global Companion Award + 50% flight discount code** | DoC 確認 100k 為 targeted 提升；80k 仍為 public standard |
| signup_bonus_value_estimate | 1575 | ~1,875（100k × 1.5cpp + 25k CF ≈ $375） | |
| signup_bonus_spend_requirement | 4000 | 6000（targeted）或 4000（public）| |
| earning_rates.international | 3x | **3x foreign transactions（無外幣交易手續費卻仍有 3x 加成）** | 相符，描述可更清楚 |

### 建議 JSON patch
```json
{
  "signup_bonus_description": "開卡 90 天內消費滿 $4,000 可獲得 80,000 點 + 25,000 點 Global Companion Award（現行有 $6,000 消費換 100k + 50% 折扣碼的 targeted 版本）",
  "signup_bonus_value_estimate": 1575,
  "signup_bonus_spend_requirement": 4000,
  "earning_rates": {
    "alaska_hawaiian": "3x Atmos Points（Alaska/Hawaiian 直接消費）",
    "dining": "3x Atmos Points",
    "foreign_transactions": "3x Atmos Points（所有海外交易）",
    "general": "1x Atmos Points"
  }
}
```

### 備註
其餘福利（8 Lounge passes, GE/TSA credit, status points, 10k anniversary）全部相符。2025-08 正式上線。

---

## 總結

- **discontinued / closed-to-new-apps**: Barclays AAdvantage Aviator Red, US Bank Altitude Reserve
- **Issuer 變更**: Apple Card（Goldman → Chase, 24 個月過渡期）
- **Newly-launched 2025-2026**: Bilt 2.0 三張卡、Atmos Ascent / Summit
- **SUB 門檻改變**: Wells Fargo Autograph（$1,500→$1,000）、BofA Premium Rewards（$3,000→$4,000）、US Bank Altitude Connect（$2,000→$1,000，同時獎勵從 50k 降至 20k）
- **資料錯誤**: Bilt Obsidian 的 25k/$2,000 開卡禮在公開來源找不到證據、US Bank Altitude Connect 年費實為 $0（原 JSON 寫 $95）

建議優先處理（高影響）：
1. us-bank-altitude-reserve → 改 is_active: false
2. barclays-aadvantage-aviator-red → 改 is_active: false
3. us-bank-altitude-connect → 更正年費與 SUB
4. apple-card → 更新 issuer 資訊
5. bilt-obsidian → 更正開卡禮
