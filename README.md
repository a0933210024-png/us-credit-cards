# US Card Guide - 美國信用卡資訊網站

面向在美華人的信用卡資訊平台，繁體中文介面，涵蓋信用卡比較、點數攻略、福利提醒等功能。

## Tech Stack

- **Framework:** Next.js 16 (App Router) + TypeScript
- **Styling:** Tailwind CSS v4 + shadcn/ui
- **Database:** Supabase (PostgreSQL) — 可用本地 JSON fallback 開發
- **State:** Zustand
- **Deployment:** Vercel

## Getting Started

```bash
# Install dependencies
npm install

# Run development server
npm run dev
```

Open [http://localhost:3000](http://localhost:3000).

No Supabase setup needed for development — the app automatically falls back to local JSON data in `src/data/`.

## Setting Up Supabase (Optional)

1. Create a Supabase project
2. Copy `.env.example` to `.env.local` and fill in your credentials
3. Run the migration:
   ```sql
   -- Copy contents of supabase/migrations/001_initial_schema.sql
   -- into the Supabase SQL Editor and execute
   ```
4. Seed the database:
   ```bash
   SUPABASE_URL=... SUPABASE_SERVICE_ROLE_KEY=... npx tsx src/scripts/seed.ts
   ```

## Pages

| Route | Description |
|-------|-------------|
| `/` | Home — featured cards, quick links, news |
| `/cards` | Credit card database with filtering & comparison |
| `/cards/[slug]` | Individual card detail |
| `/best-cards` | Best card by spending category + rewards calculator |
| `/benefits` | Card benefits reminder by issuer/category |
| `/points` | Points transfer guide, sweet spots, calculator |
| `/signup-bonus` | Sign-up bonus ranking + Chase 5/24 checker |
| `/news` | Credit card news & updates |

## Data

All credit card data lives in `src/data/` as JSON files:

- **52 credit cards** across Chase, Amex, Citi, Capital One, and others
- **61 transfer partners** across 5 points programs
- **15 sweet spot redemption routes**
- **9 spending categories** with best card recommendations
- **6 card combo recommendations**

## Scripts

```bash
npm run build    # Production build
npm run dev      # Development server
npm run lint     # ESLint
npx tsc --noEmit # Type checking
```

## Deploy to Vercel

```bash
npx vercel
```

No environment variables needed for basic deployment (uses JSON fallback).

## License

MIT
