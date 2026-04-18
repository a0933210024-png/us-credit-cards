# US Credit Card 信用卡資訊網站

## 專案概述
面向在美華人的信用卡資訊平台，繁體中文為主、英文為輔。
信用卡名稱和銀行名稱保留英文原名，描述用繁體中文。

## 技術棧
- Next.js 14+ (App Router) + TypeScript
- Tailwind CSS + shadcn/ui
- Supabase (PostgreSQL)
- Zustand 狀態管理
- Vercel 部署

## 專案結構
src/
├── app/                        # 頁面
│   ├── page.tsx                # 首頁
│   ├── layout.tsx              # Root layout
│   ├── cards/
│   │   ├── page.tsx            # 信用卡列表
│   │   └── [slug]/page.tsx     # 單卡詳情
│   ├── best-cards/page.tsx     # 最佳日常用卡
│   ├── benefits/page.tsx       # 福利提醒
│   ├── points/page.tsx         # 點數轉點攻略
│   ├── signup-bonus/page.tsx   # 開卡禮推薦
│   └── news/page.tsx           # 新聞更新
├── components/
│   ├── ui/                     # shadcn 元件（自動生成）
│   ├── layout/                 # Header, Footer, Nav, ThemeToggle
│   ├── cards/                  # CardGrid, CardDetail, CardCompare, CardFilter
│   ├── points/                 # TransferTable, SweetSpotCard, PointsCalculator
│   ├── benefits/               # BenefitList, BenefitReminder, UsageTip
│   └── home/                   # HeroSection, FeaturedCards, NewsTickerBar
├── lib/
│   ├── supabase.ts             # Supabase client
│   ├── queries/                # 各 table 的 query functions
│   ├── types.ts                # 所有 TypeScript 類型
│   ├── constants.ts            # 常數（顏色、類別名稱等）
│   └── utils.ts                # 工具函式
├── data/                       # Seed data JSON
│   ├── chase-cards.json
│   ├── amex-cards.json
│   ├── citi-cards.json
│   ├── capital-one-cards.json
│   ├── other-cards.json
│   ├── transfer-partners.json
│   ├── sweet-spots.json
│   ├── spending-categories.json
│   └── card-combos.json
├── scripts/
│   └── seed.ts                 # Seed script
└── supabase/
    └── migrations/
        └── 001_initial_schema.sql

## 資料庫 Schema

### credit_cards
id (uuid PK), slug (unique), issuer (text), card_name (text), card_network (text),
annual_fee (numeric), annual_fee_waived_first_year (boolean),
signup_bonus_description (text), signup_bonus_value_estimate (numeric),
signup_bonus_spend_requirement (numeric), signup_bonus_time_limit_months (int),
earning_rates (jsonb), key_benefits (text[]),
application_rules (jsonb), foreign_transaction_fee (numeric),
credit_score_recommended (text), card_image_url (text),
apply_url (text), is_active (boolean), created_at, updated_at

### card_benefits
id (uuid PK), card_id (FK), benefit_category (text), benefit_name (text),
benefit_description (text), benefit_value (numeric),
benefit_type (text), usage_reminder (text),
reset_date_type (text), recommended_usage (text)

### points_programs
id (uuid PK), program_name (text), currency_name (text),
base_value_cpp (numeric), best_value_cpp (numeric),
earning_cards (text[])

### transfer_partners
id (uuid PK), points_program_id (FK), partner_name (text),
partner_type (text), transfer_ratio_from (int), transfer_ratio_to (int),
transfer_time_estimate (text), is_instant (boolean), sweet_spots (jsonb)

### spending_categories
id (uuid PK), category_name (text), category_name_zh (text),
best_card_id (FK), earning_rate (text),
runner_up_card_id (FK), runner_up_earning_rate (text), notes (text)

### news_updates
id (uuid PK), title (text), summary (text), source_url (text),
source_name (text), category (text),
related_card_ids (uuid[]), published_at (timestamptz), created_at

### card_combos
id (uuid PK), combo_name (text), description (text),
card_ids (uuid[]), total_annual_fee (numeric),
estimated_annual_value (numeric), target_audience (text),
pros (text[]), cons (text[])

## 設計規範
- 主色: #1a365d (深藍), 點綴: #c9a84c (金色), 背景: white
- 字體: Noto Sans TC (中文), Inter (英文)
- 圓角卡片 + 陰影 + hover 上浮動效
- 完全 responsive
- 支援 Dark mode（dark class strategy）

## 信用卡資料要求
- earning_rates jsonb 格式: {"dining": "4x", "groceries": "4x", "travel": "3x", "gas": "3x", "streaming": "4x", "general": "1x"}
- application_rules jsonb 格式: {"rule_name": "Chase 5/24", "description": "過去24個月內開超過5張新卡就無法核准Chase的卡"}
- 所有金額用美金，數字用半形
- 不確定的資料標記 "待確認"

## 資料新鮮度欄位（每張卡都有）
- `last_verified_at`: ISO 日期，上次對銀行官網/聚合站驗證的時間
- `offer_expires_at`: ISO 日期，限時 signup bonus 到期日（沒限時就 omit）
- `issuer_url`: 銀行官網產品頁（Amex 因為會 403，可填 TPG article URL 作 fallback）
- `status`: "active" | "closed_to_new" | "discontinued" | "issuer_transition"
- `status_note`: 產品狀態說明（停發日期、發卡行轉換等）

## Refresh 流程
- 跑 `npm run check-freshness` 看哪些卡需要更新
- 完整 SOP: docs/refresh-workflow.md
- 每次 refresh 產出 diff 報告在 docs/card-updates-*.md 供稽核
- Amex 官網會 403，所有 Amex 卡都走 WebSearch + TPG/DoC/NerdWallet

## 驗證指令
- npm run build
- npx tsc --noEmit
- npm run lint
- npm run check-freshness

## Teammate 工作規範
- 只修改自己負責的檔案/目錄
- 完成後跑驗證指令
- 有相依性問題透過 message 溝通
- commit message 用英文
