-- ============================================================
-- User card tracking tables for CardTracker mobile app
-- ============================================================

-- Track which cards each user holds
CREATE TABLE user_cards (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  card_id UUID NOT NULL REFERENCES credit_cards(id) ON DELETE CASCADE,
  card_open_date DATE,
  nickname TEXT,
  is_active BOOLEAN NOT NULL DEFAULT true,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE(user_id, card_id)
);

CREATE INDEX idx_user_cards_user_id ON user_cards (user_id);
CREATE INDEX idx_user_cards_card_id ON user_cards (card_id);

-- Track benefit usage per period
CREATE TABLE benefit_usage (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  benefit_id UUID NOT NULL REFERENCES card_benefits(id) ON DELETE CASCADE,
  user_card_id UUID NOT NULL REFERENCES user_cards(id) ON DELETE CASCADE,
  used_amount NUMERIC NOT NULL DEFAULT 0,
  used_at DATE NOT NULL DEFAULT CURRENT_DATE,
  used_where TEXT,
  notes TEXT,
  period_start DATE NOT NULL,
  period_end DATE NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_benefit_usage_user_id ON benefit_usage (user_id);
CREATE INDEX idx_benefit_usage_benefit_id ON benefit_usage (benefit_id);
CREATE INDEX idx_benefit_usage_user_card_id ON benefit_usage (user_card_id);
CREATE INDEX idx_benefit_usage_period ON benefit_usage (period_start, period_end);

-- ============================================================
-- Row Level Security
-- ============================================================

ALTER TABLE user_cards ENABLE ROW LEVEL SECURITY;
ALTER TABLE benefit_usage ENABLE ROW LEVEL SECURITY;

-- user_cards: users can only access their own rows
CREATE POLICY "Users can view own cards" ON user_cards
  FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can insert own cards" ON user_cards
  FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Users can update own cards" ON user_cards
  FOR UPDATE USING (auth.uid() = user_id);
CREATE POLICY "Users can delete own cards" ON user_cards
  FOR DELETE USING (auth.uid() = user_id);

-- benefit_usage: users can only access their own rows
CREATE POLICY "Users can view own usage" ON benefit_usage
  FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can insert own usage" ON benefit_usage
  FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Users can update own usage" ON benefit_usage
  FOR UPDATE USING (auth.uid() = user_id);
CREATE POLICY "Users can delete own usage" ON benefit_usage
  FOR DELETE USING (auth.uid() = user_id);
