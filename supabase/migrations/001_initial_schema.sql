-- ============================================================
-- US Credit Cards Database Schema
-- ============================================================

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ============================================================
-- credit_cards
-- ============================================================
CREATE TABLE credit_cards (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  slug TEXT UNIQUE NOT NULL,
  issuer TEXT NOT NULL,
  card_name TEXT NOT NULL,
  card_network TEXT NOT NULL,
  annual_fee NUMERIC NOT NULL DEFAULT 0,
  annual_fee_waived_first_year BOOLEAN NOT NULL DEFAULT false,
  signup_bonus_description TEXT,
  signup_bonus_value_estimate NUMERIC DEFAULT 0,
  signup_bonus_spend_requirement NUMERIC DEFAULT 0,
  signup_bonus_time_limit_months INT DEFAULT 0,
  earning_rates JSONB DEFAULT '{}'::jsonb,
  key_benefits TEXT[] DEFAULT '{}',
  application_rules JSONB DEFAULT '{}'::jsonb,
  foreign_transaction_fee NUMERIC NOT NULL DEFAULT 0,
  credit_score_recommended TEXT,
  card_image_url TEXT,
  apply_url TEXT,
  is_active BOOLEAN NOT NULL DEFAULT true,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_credit_cards_issuer ON credit_cards (issuer);
CREATE INDEX idx_credit_cards_annual_fee ON credit_cards (annual_fee);
CREATE INDEX idx_credit_cards_is_active ON credit_cards (is_active);
CREATE INDEX idx_credit_cards_card_network ON credit_cards (card_network);

-- ============================================================
-- card_benefits
-- ============================================================
CREATE TABLE card_benefits (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  card_id UUID NOT NULL REFERENCES credit_cards(id) ON DELETE CASCADE,
  benefit_category TEXT NOT NULL,
  benefit_name TEXT NOT NULL,
  benefit_description TEXT NOT NULL,
  benefit_value NUMERIC NOT NULL DEFAULT 0,
  benefit_type TEXT NOT NULL,
  usage_reminder TEXT,
  reset_date_type TEXT,
  recommended_usage TEXT
);

CREATE INDEX idx_card_benefits_card_id ON card_benefits (card_id);
CREATE INDEX idx_card_benefits_category ON card_benefits (benefit_category);

-- ============================================================
-- points_programs
-- ============================================================
CREATE TABLE points_programs (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  program_name TEXT UNIQUE NOT NULL,
  currency_name TEXT NOT NULL,
  base_value_cpp NUMERIC NOT NULL DEFAULT 1.0,
  best_value_cpp NUMERIC NOT NULL DEFAULT 1.0,
  earning_cards TEXT[] DEFAULT '{}'
);

CREATE INDEX idx_points_programs_name ON points_programs (program_name);

-- ============================================================
-- transfer_partners
-- ============================================================
CREATE TABLE transfer_partners (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  points_program_id UUID NOT NULL REFERENCES points_programs(id) ON DELETE CASCADE,
  partner_name TEXT NOT NULL,
  partner_type TEXT NOT NULL,
  transfer_ratio_from INT NOT NULL DEFAULT 1,
  transfer_ratio_to INT NOT NULL DEFAULT 1,
  transfer_time_estimate TEXT,
  is_instant BOOLEAN NOT NULL DEFAULT false,
  sweet_spots JSONB DEFAULT '[]'::jsonb
);

CREATE INDEX idx_transfer_partners_program_id ON transfer_partners (points_program_id);
CREATE INDEX idx_transfer_partners_partner_name ON transfer_partners (partner_name);
CREATE INDEX idx_transfer_partners_partner_type ON transfer_partners (partner_type);

-- ============================================================
-- spending_categories
-- ============================================================
CREATE TABLE spending_categories (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  category_name TEXT NOT NULL,
  category_name_zh TEXT NOT NULL,
  best_card_id UUID REFERENCES credit_cards(id) ON DELETE SET NULL,
  earning_rate TEXT NOT NULL,
  runner_up_card_id UUID REFERENCES credit_cards(id) ON DELETE SET NULL,
  runner_up_earning_rate TEXT,
  notes TEXT
);

CREATE INDEX idx_spending_categories_best_card ON spending_categories (best_card_id);
CREATE INDEX idx_spending_categories_runner_up ON spending_categories (runner_up_card_id);

-- ============================================================
-- news_updates
-- ============================================================
CREATE TABLE news_updates (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  title TEXT NOT NULL,
  summary TEXT NOT NULL,
  source_url TEXT,
  source_name TEXT,
  category TEXT NOT NULL,
  related_card_ids UUID[] DEFAULT '{}',
  published_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_news_updates_category ON news_updates (category);
CREATE INDEX idx_news_updates_published_at ON news_updates (published_at DESC);

-- ============================================================
-- card_combos
-- ============================================================
CREATE TABLE card_combos (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  combo_name TEXT NOT NULL,
  description TEXT NOT NULL,
  card_ids UUID[] DEFAULT '{}',
  total_annual_fee NUMERIC NOT NULL DEFAULT 0,
  estimated_annual_value NUMERIC NOT NULL DEFAULT 0,
  target_audience TEXT,
  pros TEXT[] DEFAULT '{}',
  cons TEXT[] DEFAULT '{}'
);

-- ============================================================
-- Updated_at trigger function
-- ============================================================
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_credit_cards_updated_at
  BEFORE UPDATE ON credit_cards
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

-- ============================================================
-- Row Level Security (RLS)
-- ============================================================

-- Enable RLS on all tables
ALTER TABLE credit_cards ENABLE ROW LEVEL SECURITY;
ALTER TABLE card_benefits ENABLE ROW LEVEL SECURITY;
ALTER TABLE points_programs ENABLE ROW LEVEL SECURITY;
ALTER TABLE transfer_partners ENABLE ROW LEVEL SECURITY;
ALTER TABLE spending_categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE news_updates ENABLE ROW LEVEL SECURITY;
ALTER TABLE card_combos ENABLE ROW LEVEL SECURITY;

-- Public read access (anonymous users can read all data)
CREATE POLICY "Allow public read access on credit_cards"
  ON credit_cards FOR SELECT
  USING (true);

CREATE POLICY "Allow public read access on card_benefits"
  ON card_benefits FOR SELECT
  USING (true);

CREATE POLICY "Allow public read access on points_programs"
  ON points_programs FOR SELECT
  USING (true);

CREATE POLICY "Allow public read access on transfer_partners"
  ON transfer_partners FOR SELECT
  USING (true);

CREATE POLICY "Allow public read access on spending_categories"
  ON spending_categories FOR SELECT
  USING (true);

CREATE POLICY "Allow public read access on news_updates"
  ON news_updates FOR SELECT
  USING (true);

CREATE POLICY "Allow public read access on card_combos"
  ON card_combos FOR SELECT
  USING (true);

-- Service role full access (for seed script and admin operations)
CREATE POLICY "Allow service role full access on credit_cards"
  ON credit_cards FOR ALL
  USING (auth.role() = 'service_role');

CREATE POLICY "Allow service role full access on card_benefits"
  ON card_benefits FOR ALL
  USING (auth.role() = 'service_role');

CREATE POLICY "Allow service role full access on points_programs"
  ON points_programs FOR ALL
  USING (auth.role() = 'service_role');

CREATE POLICY "Allow service role full access on transfer_partners"
  ON transfer_partners FOR ALL
  USING (auth.role() = 'service_role');

CREATE POLICY "Allow service role full access on spending_categories"
  ON spending_categories FOR ALL
  USING (auth.role() = 'service_role');

CREATE POLICY "Allow service role full access on news_updates"
  ON news_updates FOR ALL
  USING (auth.role() = 'service_role');

CREATE POLICY "Allow service role full access on card_combos"
  ON card_combos FOR ALL
  USING (auth.role() = 'service_role');
