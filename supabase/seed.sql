-- ============================================================
-- Seed data for US Credit Cards database
-- Generated automatically from JSON data files
-- ============================================================

-- Wrap everything in a transaction
BEGIN;

-- ============================================================
-- 1. INSERT CREDIT CARDS
-- ============================================================

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'chase-sapphire-preferred', 'Chase', 'Chase Sapphire Preferred', 'Visa', 95,
  false, '開卡後 3 個月內消費滿 $5,000 可獲得 75,000 Ultimate Rewards 點數',
  937, 5000,
  3, '{"chase_travel":"5x UR（透過 Chase Travel）","dining":"3x UR","online_groceries":"3x UR","streaming":"3x UR","travel":"2x UR","general":"1x UR"}'::jsonb, ARRAY['UR 點數透過 portal 訂旅行價值提升 25%', '轉點到 Hyatt/United/Southwest 等夥伴', '旅行延誤保險', '主卡持有人可將點數轉給 Freedom 系列加值', 'DoorDash DashPass 會員資格', '行李延誤保險最高 $3,000', '每年底以前年度消費總額 10% 的 bonus 點數']::text[],
  '{"rule_name":"Chase 5/24","description":"過去 24 個月內新開超過 5 張任何銀行的信用卡（含副卡），Chase 會自動拒絕申請","one_sapphire_rule":"不能同時持有 Sapphire Preferred 和 Sapphire Reserve，且 48 個月內不能拿過 Sapphire 系列開卡禮"}'::jsonb, 0,
  'Good to Excellent (670+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'chase-sapphire-reserve', 'Chase', 'Chase Sapphire Reserve', 'Visa', 795,
  false, '開卡後 3 個月內消費滿 $6,000 可獲得 125,000 Ultimate Rewards 點數',
  2500, 6000,
  3, '{"chase_travel":"8x UR（透過 Chase Travel 預訂）","flights":"4x UR（直接向航空公司購票）","hotels":"4x UR（直接向飯店預訂）","dining":"3x UR","general":"1x UR"}'::jsonb, ARRAY['$300 年度旅行 credit', '$500 The Edit 飯店 credit（每次預訂最高 $250）', '$250 Chase Travel 飯店 credit（指定連鎖，至 12/31/26）', '$300 餐飲 credit（Sapphire Exclusive Tables，每半年 $150）', '$288 Apple TV + Music', '$120 DashPass + 每月 promo', '$300 StubHub credit（每半年 $150）', '$120 Lyft credit + 5x', '$120 Peloton credit + 10x', 'Chase Sapphire Lounge + Priority Pass 1,300+ 貴賓室', 'Global Entry/TSA PreCheck credit（每 4 年 $120）', 'IHG Platinum Elite Status', 'UR 點數透過 portal 訂旅行價值提升 50%', '轉點到 Hyatt/United/Southwest 等夥伴', '旅行延誤保險（延誤 2 小時即觸發）', '主卡持有人可將點數轉給 Freedom 系列加值']::text[],
  '{"rule_name":"Chase 5/24","description":"過去 24 個月內新開超過 5 張任何銀行的信用卡（含副卡），Chase 會自動拒絕申請","one_sapphire_rule":"不能同時持有 Sapphire Preferred 和 Sapphire Reserve，且 48 個月內不能拿過 Sapphire 系列開卡禮"}'::jsonb, 0,
  'Excellent (720+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'chase-freedom-unlimited', 'Chase', 'Chase Freedom Unlimited', 'Visa', 0,
  false, '開卡後 3 個月內消費滿 $500 可獲得 $200 現金回饋（或 20,000 UR 點數）',
  200, 500,
  3, '{"dining":"3x UR","drugstores":"3x UR","travel_via_portal":"5x UR","general":"1.5% / 1.5x UR"}'::jsonb, ARRAY['無年費，一般消費 1.5% 回饋', '餐廳和藥局 3x UR', '搭配 Sapphire 卡可將 UR 點數轉點或加值', '0% APR 前 15 個月']::text[],
  '{"rule_name":"Chase 5/24","description":"過去 24 個月內新開超過 5 張任何銀行的信用卡（含副卡），Chase 會自動拒絕申請"}'::jsonb, 3,
  'Good to Excellent (670+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'chase-freedom-flex', 'Chase', 'Chase Freedom Flex', 'Mastercard', 0,
  false, '開卡後 3 個月內消費滿 $500 可獲得 $200 現金回饋',
  200, 500,
  3, '{"rotating_quarterly":"5x UR（每季不同類別，需啟動，每季上限 $1,500）","dining":"3x UR","drugstores":"3x UR","travel_via_portal":"5x UR","general":"1x UR"}'::jsonb, ARRAY['無年費，季度輪轉 5x 回饋', '餐廳和藥局 3x UR', '搭配 Sapphire 卡可將 UR 點數轉點或加值', 'Mastercard World Elite 權益', '手機保護計劃（用此卡付手機帳單）']::text[],
  '{"rule_name":"Chase 5/24","description":"過去 24 個月內新開超過 5 張任何銀行的信用卡（含副卡），Chase 會自動拒絕申請"}'::jsonb, 3,
  'Good to Excellent (670+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'chase-freedom-rise', 'Chase', 'Chase Freedom Rise', 'Visa', 0,
  false, '前 3 個月消費滿 $500，連續 6 個月準時繳款後可獲 $25 bonus',
  25, 500,
  3, '{"general":"1.5% cash back"}'::jsonb, ARRAY['無年費，適合建立信用', '一般消費 1.5% 回饋', 'Chase Credit Journey 免費信用分數監測', '無需信用歷史即可申請']::text[],
  '{"rule_name":"Chase 5/24","description":"過去 24 個月內新開超過 5 張任何銀行的信用卡（含副卡），Chase 會自動拒絕申請"}'::jsonb, 3,
  'Fair to Good (580+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'chase-ink-business-preferred', 'Chase', 'Ink Business Preferred Credit Card', 'Visa', 95,
  false, '開卡後 3 個月內消費滿 $8,000 可獲得 90,000 Ultimate Rewards 點數',
  1125, 8000,
  3, '{"travel":"3x UR（每年首 $150,000）","shipping":"3x UR（每年首 $150,000）","internet_cable_phone":"3x UR（每年首 $150,000）","advertising_social_media":"3x UR（每年首 $150,000）","general":"1x UR"}'::jsonb, ARRAY['UR 點數透過 portal 訂旅行價值提升 25%', '可轉點到 Hyatt/United 等夥伴', '手機保護計劃', '開卡禮 90K UR 是 Chase 個人卡中最高之一', '可將 UR 點數轉給個人 Sapphire 卡']::text[],
  '{"rule_name":"Chase 5/24","description":"過去 24 個月內新開超過 5 張任何銀行的信用卡（含副卡），Chase 會自動拒絕申請"}'::jsonb, 0,
  'Good to Excellent (670+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'chase-ink-business-cash', 'Chase', 'Ink Business Cash Credit Card', 'Visa', 0,
  false, '開卡後 3 個月內消費滿 $6,000 可獲得 $750 現金回饋',
  750, 6000,
  3, '{"office_supply_stores":"5x UR（每年首 $25,000）","internet_cable_phone":"5x UR（每年首 $25,000）","gas_stations":"2x UR（每年首 $25,000）","dining":"2x UR（每年首 $25,000）","general":"1x UR"}'::jsonb, ARRAY['無年費商業卡', '辦公用品店 5x 回饋（含 gift card 購買）', '搭配 Ink Preferred 或 Sapphire 可轉點', '不計入 5/24 個人卡額度']::text[],
  '{"rule_name":"Chase 5/24","description":"過去 24 個月內新開超過 5 張任何銀行的信用卡（含副卡），Chase 會自動拒絕申請"}'::jsonb, 3,
  'Good to Excellent (670+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'chase-ink-business-unlimited', 'Chase', 'Ink Business Unlimited Credit Card', 'Visa', 0,
  false, '開卡後 3 個月內消費滿 $6,000 可獲得 $750 現金回饋',
  750, 6000,
  3, '{"general":"1.5x UR"}'::jsonb, ARRAY['無年費商業卡', '所有消費 1.5x UR 無上限', '搭配 Ink Preferred 或 Sapphire 可轉點', '不計入 5/24 個人卡額度', '0% APR 前 12 個月']::text[],
  '{"rule_name":"Chase 5/24","description":"過去 24 個月內新開超過 5 張任何銀行的信用卡（含副卡），Chase 會自動拒絕申請"}'::jsonb, 3,
  'Good to Excellent (670+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'chase-united-explorer', 'Chase', 'United Explorer Card', 'Visa', 95,
  false, '開卡後 3 個月內消費滿 $3,000 可獲得 60,000 United MileagePlus 哩程',
  780, 3000,
  3, '{"united_purchases":"2x United miles","dining":"2x United miles","hotel":"2x United miles","general":"1x United miles"}'::jsonb, ARRAY['免費託運第一件行李（同行最多一人也免費）', '優先登機', '每年 2 張 United Club 一次性通行證', '25% 機上消費折扣']::text[],
  '{"rule_name":"Chase 5/24","description":"過去 24 個月內新開超過 5 張任何銀行的信用卡（含副卡），Chase 會自動拒絕申請"}'::jsonb, 0,
  'Good to Excellent (670+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'chase-united-quest', 'Chase', 'United Quest Card', 'Visa', 250,
  false, '開卡後 3 個月內消費滿 $4,000 可獲得 70,000 United MileagePlus 哩程',
  910, 4000,
  3, '{"united_purchases":"3x United miles","dining":"2x United miles","hotel":"2x United miles","general":"1x United miles"}'::jsonb, ARRAY['每年 $125 United 旅行 credit', '免費託運前兩件行李', '每年 5,000 PQP（Premier Qualifying Points）', 'Priority 登機', '10,000 哩程週年禮']::text[],
  '{"rule_name":"Chase 5/24","description":"過去 24 個月內新開超過 5 張任何銀行的信用卡（含副卡），Chase 會自動拒絕申請"}'::jsonb, 0,
  'Good to Excellent (670+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'chase-united-club-infinite', 'Chase', 'United Club Infinite Card', 'Visa', 525,
  false, '開卡後 3 個月內消費滿 $5,000 可獲得 80,000 United MileagePlus 哩程',
  1040, 5000,
  3, '{"united_purchases":"4x United miles","dining":"2x United miles","travel":"2x United miles","general":"1x United miles"}'::jsonb, ARRAY['United Club 貴賓室無限使用', '免費託運前兩件行李', 'Global Entry / TSA PreCheck 報銷', 'Premier Access（優先報到/安檢/登機/行李）', '每年 $100 Global Services credit']::text[],
  '{"rule_name":"Chase 5/24","description":"過去 24 個月內新開超過 5 張任何銀行的信用卡（含副卡），Chase 會自動拒絕申請"}'::jsonb, 0,
  'Excellent (720+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'chase-world-of-hyatt', 'Chase', 'World of Hyatt Credit Card', 'Visa', 95,
  false, '開卡後 3 個月內消費滿 $6,000 可獲得 30,000 Hyatt 點數 + 額外消費滿 $15,000 再得 2 晚 free night',
  600, 6000,
  3, '{"hyatt_purchases":"4x Hyatt points","dining":"2x Hyatt points","airline_tickets":"2x Hyatt points","local_transit_commuting":"2x Hyatt points","fitness_gym":"2x Hyatt points","general":"1x Hyatt points"}'::jsonb, ARRAY['每年持卡週年贈送 1 晚 Category 1-4 Free Night Award', '自動獲得 Discoverist 會員資格', '每年消費滿 $15,000 可額外獲得 1 晚 Free Night（Cat 1-4）', 'Hyatt 點數價值是飯店點數中最高的（~2 cpp）', '2 額外 Qualifying Night Credits']::text[],
  '{"rule_name":"Chase 5/24","description":"過去 24 個月內新開超過 5 張任何銀行的信用卡（含副卡），Chase 會自動拒絕申請"}'::jsonb, 0,
  'Good to Excellent (670+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'chase-marriott-bonvoy-boundless', 'Chase', 'Marriott Bonvoy Boundless', 'Visa', 95,
  false, '開卡後 3 個月內消費滿 $3,000 可獲得 3 晚 Free Night Awards（每晚最高 50,000 點）',
  750, 3000,
  3, '{"marriott_purchases":"6x Marriott Bonvoy points","dining":"3x Marriott Bonvoy points","groceries":"3x Marriott Bonvoy points","gas":"3x Marriott Bonvoy points","general":"2x Marriott Bonvoy points"}'::jsonb, ARRAY['Marriott 消費 6x 回饋', '每年持卡週年贈送 1 晚 Free Night Award（最高 35,000 點）', '自動獲得 Silver Elite 會員資格', '每年 15 晚 Elite Night Credits']::text[],
  '{"rule_name":"Chase 5/24","description":"過去 24 個月內新開超過 5 張任何銀行的信用卡（含副卡），Chase 會自動拒絕申請"}'::jsonb, 0,
  'Good to Excellent (670+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'chase-marriott-bonvoy-bold', 'Chase', 'Marriott Bonvoy Bold', 'Visa', 0,
  false, '開卡後 3 個月內消費滿 $2,000 可獲得 30,000 Marriott Bonvoy 點數',
  210, 2000,
  3, '{"marriott_purchases":"3x Marriott Bonvoy points","dining":"2x Marriott Bonvoy points","travel":"2x Marriott Bonvoy points","general":"1x Marriott Bonvoy points"}'::jsonb, ARRAY['無年費 Marriott 卡', 'Marriott 消費 3x 回饋', '自動獲得 Silver Elite 會員資格', '15 晚 Elite Night Credits']::text[],
  '{"rule_name":"Chase 5/24","description":"過去 24 個月內新開超過 5 張任何銀行的信用卡（含副卡），Chase 會自動拒絕申請"}'::jsonb, 0,
  'Good to Excellent (670+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'chase-ihg-one-rewards-premier', 'Chase', 'IHG One Rewards Premier Credit Card', 'Mastercard', 99,
  false, '開卡後 3 個月內消費滿 $3,000 可獲得 140,000 IHG 點數',
  700, 3000,
  3, '{"ihg_purchases":"10x IHG points","dining":"5x IHG points","gas":"5x IHG points","travel":"5x IHG points","general":"3x IHG points"}'::jsonb, ARRAY['IHG 消費 10x 點數', '每年持卡週年贈送 1 晚 Free Night Award（最高 40,000 點）', '自動獲得 Platinum Elite 會員資格', '第 4 晚免費（用點數兌換時）', 'Global Entry / TSA PreCheck 報銷']::text[],
  '{"rule_name":"Chase 5/24","description":"過去 24 個月內新開超過 5 張任何銀行的信用卡（含副卡），Chase 會自動拒絕申請"}'::jsonb, 0,
  'Good to Excellent (670+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'chase-southwest-priority', 'Chase', 'Southwest Rapid Rewards Priority Credit Card', 'Visa', 149,
  false, '開卡後 3 個月內消費滿 $4,000 可獲得 50,000 Southwest 點數',
  700, 4000,
  3, '{"southwest_purchases":"3x SW points","rapid_rewards_hotel_partner":"2x SW points","local_transit_commuting":"2x SW points","internet_cable_streaming":"2x SW points","general":"1x SW points"}'::jsonb, ARRAY['每年 $75 Southwest 旅行 credit', '每年 7,500 點週年禮', '4 張 Upgraded Boarding 升級券', '累積 Companion Pass 所需點數', '無行李費（Southwest 政策）']::text[],
  '{"rule_name":"Chase 5/24","description":"過去 24 個月內新開超過 5 張任何銀行的信用卡（含副卡），Chase 會自動拒絕申請"}'::jsonb, 3,
  'Good to Excellent (670+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'chase-amazon-prime-visa', 'Chase', 'Amazon Prime Visa', 'Visa', 0,
  false, '核卡後立即獲得 $200 Amazon Gift Card',
  200, 0,
  0, '{"amazon":"5% cash back（需 Prime 會員）","whole_foods":"5% cash back（需 Prime 會員）","travel":"2% cash back","dining":"2% cash back","gas":"2% cash back","general":"1% cash back"}'::jsonb, ARRAY['Amazon 和 Whole Foods 5% 回饋（需 Prime 會員）', '無年費（但需 Prime 會員 $139/年）', '無外幣交易手續費', '無 Prime 會員時 Amazon 回饋降為 3%']::text[],
  '{"rule_name":"Chase 5/24","description":"過去 24 個月內新開超過 5 張任何銀行的信用卡（含副卡），Chase 會自動拒絕申請"}'::jsonb, 0,
  'Good to Excellent (670+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'amex-platinum', 'American Express', 'The Platinum Card from American Express', 'American Express', 895,
  false, '開卡後 6 個月內消費滿 $8,000 可獲得 80,000 Membership Rewards 點數',
  1600, 8000,
  6, '{"flights":"5x MR（直接向航空公司或透過 Amex Travel，年上限 $500,000）","prepaid_hotels_amex_travel":"5x MR","general":"1x MR"}'::jsonb, ARRAY['$600 Hotel Credit（透過 Amex Travel 訂 FHR/THC 飯店每半年 $300）', '$200 航空 Fee Credit（選定一家航空公司，折抵行李費/座位升級等）', '$200 Uber Credit（每月 $15，12 月額外 $20）', '$300 Entertainment Credit（每月 $25）', '$209 CLEAR+ Credit', '$400 Resy Dining Credit', '$300 lululemon Credit（每季 $75）', 'Global Entry / TSA PreCheck 報銷（每 4 年 $100）', 'Centurion Lounge 免費使用', 'Priority Pass Select 貴賓室', 'Fine Hotels + Resorts (FHR) 訂房享升等/早餐/晚退房', 'Hilton Gold / Marriott Gold Elite 會員資格']::text[],
  '{"rule_name":"Amex Once-Per-Lifetime","description":"同一張卡的開卡禮一輩子只能拿一次","popup_rule":"系統判斷你不夠「有利潤」會跳出 pop-up 阻擋開卡禮","note":"Platinum 是 Charge Card，不受 5 credit card limit 限制"}'::jsonb, 0,
  'Excellent (720+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'amex-gold', 'American Express', 'American Express Gold Card', 'American Express', 325,
  false, '開卡後 6 個月內消費滿 $6,000 可獲得 60,000 Membership Rewards 點數',
  1200, 6000,
  6, '{"dining":"4x MR（全球餐廳，年上限 $50,000）","groceries":"4x MR（美國超市，年上限 $25,000）","flights":"3x MR（直接向航空公司或 Amex Travel）","prepaid_hotels_amex_travel":"2x MR","general":"1x MR"}'::jsonb, ARRAY['$120 Dining Credit（每月 $10，可用於 Grubhub/Cheesecake Factory 等）', '$120 Uber Credit（每月 $10 Uber Cash）', '$84 Dunkin'' Credit（每月 $7）', '$100 Resy Credit（每半年 $50）', '餐廳和超市 4x MR 是市場最強', '轉點到 Delta/ANA/Singapore Airlines 等夥伴']::text[],
  '{"rule_name":"Amex Once-Per-Lifetime","description":"同一張卡的開卡禮一輩子只能拿一次","popup_rule":"系統判斷你不夠「有利潤」會跳出 pop-up 阻擋開卡禮","note":"Gold 是 Charge Card，不受 5 credit card limit 限制"}'::jsonb, 0,
  'Good to Excellent (670+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'amex-green', 'American Express', 'American Express Green Card', 'American Express', 150,
  false, '開卡後 6 個月內消費滿 $3,000 可獲得 40,000 Membership Rewards 點數',
  800, 3000,
  6, '{"travel":"3x MR","transit":"3x MR","dining":"3x MR","general":"1x MR"}'::jsonb, ARRAY['旅行/交通/餐廳 3x MR', '$189 CLEAR Plus Credit', 'LoungeBuddy 機場貴賓室（每年使用 2 次）', '轉點到航空/飯店夥伴']::text[],
  '{"rule_name":"Amex Once-Per-Lifetime","description":"同一張卡的開卡禮一輩子只能拿一次","popup_rule":"系統判斷你不夠「有利潤」會跳出 pop-up 阻擋開卡禮","note":"Green 是 Charge Card，不受 5 credit card limit 限制"}'::jsonb, 0,
  'Good to Excellent (670+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'amex-blue-cash-preferred', 'American Express', 'Blue Cash Preferred Card from American Express', 'American Express', 95,
  false, '開卡後 6 個月內消費滿 $3,000 可獲得 $250 statement credit',
  250, 3000,
  6, '{"groceries":"6%（美國超市，年上限 $6,000）","streaming":"6%","gas_transit":"3%","general":"1%"}'::jsonb, ARRAY['美國超市 6% 回饋是同類最高', '串流服務 6% 回饋', '交通和加油 3% 回饋', '$120 Disney+/Hulu/ESPN+ credit（每月 $10）', '0% APR 前 12 個月', '適合家庭超市和串流消費']::text[],
  '{"rule_name":"Amex 2/90 + 5 Card Limit","description":"90 天內最多核准 2 張 Amex credit card；最多同時持有 5 張 Amex credit card（charge card 不算）","once_per_lifetime":"同一張卡的開卡禮一輩子只能拿一次","popup_rule":"系統判斷你不夠「有利潤」會跳出 pop-up 阻擋開卡禮"}'::jsonb, 2.7,
  'Good to Excellent (670+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'amex-blue-cash-everyday', 'American Express', 'Blue Cash Everyday Card from American Express', 'American Express', 0,
  false, '開卡後 6 個月內消費滿 $2,000 可獲得 $200 statement credit',
  200, 2000,
  6, '{"groceries":"3% cash back（美國超市，每年首 $6,000）","online_shopping":"3% cash back","gas":"3% cash back（美國加油站，每年首 $6,000）","general":"1% cash back"}'::jsonb, ARRAY['無年費', '超市和網購 3% 回饋', '加油 3% 回饋', '0% APR 前 15 個月', '適合不想付年費但想要超市回饋的人']::text[],
  '{"rule_name":"Amex 2/90 + 5 Card Limit","description":"90 天內最多核准 2 張 Amex credit card；最多同時持有 5 張 Amex credit card（charge card 不算）","once_per_lifetime":"同一張卡的開卡禮一輩子只能拿一次","popup_rule":"系統判斷你不夠「有利潤」會跳出 pop-up 阻擋開卡禮"}'::jsonb, 2.7,
  'Good (670+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'amex-hilton-honors', 'American Express', 'Hilton Honors American Express Card', 'American Express', 0,
  false, '開卡後 6 個月內消費滿 $2,000 可獲得 70,000 Hilton Honors 點數',
  350, 2000,
  6, '{"hilton_purchases":"7x Hilton points","dining":"5x Hilton points","groceries":"5x Hilton points","gas":"5x Hilton points","general":"3x Hilton points"}'::jsonb, ARRAY['無年費 Hilton 卡', 'Hilton 消費 7x 回饋', '自動獲得 Hilton Silver 會員', '無外幣交易手續費']::text[],
  '{"rule_name":"Amex 2/90 + 5 Card Limit","description":"90 天內最多核准 2 張 Amex credit card；最多同時持有 5 張 Amex credit card（charge card 不算）","once_per_lifetime":"同一張卡的開卡禮一輩子只能拿一次","popup_rule":"系統判斷你不夠「有利潤」會跳出 pop-up 阻擋開卡禮"}'::jsonb, 0,
  'Good (670+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'amex-hilton-surpass', 'American Express', 'Hilton Honors American Express Surpass Card', 'American Express', 150,
  false, '開卡後 6 個月內消費滿 $3,000 可獲得 130,000 Hilton Honors 點數 + 1 晚 Free Night',
  950, 3000,
  6, '{"hilton_purchases":"12x Hilton points","dining":"6x Hilton points","groceries":"6x Hilton points","gas":"6x Hilton points","general":"3x Hilton points"}'::jsonb, ARRAY['Hilton 消費 12x 回饋', '自動獲得 Hilton Gold 會員（含免費早餐和升等）', '$200 Hilton Credit（每季 $50）', '每年消費滿 $15,000 贈送 1 晚 Free Night（無 category 限制）', 'Priority Pass Select（限 10 次/年）', '無外幣交易手續費']::text[],
  '{"rule_name":"Amex 2/90 + 5 Card Limit","description":"90 天內最多核准 2 張 Amex credit card；最多同時持有 5 張 Amex credit card（charge card 不算）","once_per_lifetime":"同一張卡的開卡禮一輩子只能拿一次","popup_rule":"系統判斷你不夠「有利潤」會跳出 pop-up 阻擋開卡禮"}'::jsonb, 0,
  'Good to Excellent (670+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'amex-hilton-aspire', 'American Express', 'Hilton Honors American Express Aspire Card', 'American Express', 550,
  false, '開卡後 6 個月內消費滿 $6,000 可獲得 175,000 Hilton Honors 點數',
  875, 6000,
  6, '{"hilton_purchases":"14x Hilton points","dining":"7x Hilton points","flights_booked_directly":"7x Hilton points","general":"3x Hilton points"}'::jsonb, ARRAY['自動獲得 Hilton Diamond 會員（最高等級）', '每年持卡週年贈送 1 晚 Free Night Award（無 category 限制）', '$400 Hilton Resort Credit（每半年 $200）', '$200 航空 Fee Credit（每季 $50）', '$209 CLEAR+ Credit', 'Priority Pass Select 貴賓室', '消費滿 $60,000 再送 1 晚 Free Night']::text[],
  '{"rule_name":"Amex 2/90 + 5 Card Limit","description":"90 天內最多核准 2 張 Amex credit card；最多同時持有 5 張 Amex credit card（charge card 不算）","once_per_lifetime":"同一張卡的開卡禮一輩子只能拿一次","popup_rule":"系統判斷你不夠「有利潤」會跳出 pop-up 阻擋開卡禮"}'::jsonb, 0,
  'Excellent (720+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'amex-marriott-bonvoy-brilliant', 'American Express', 'Marriott Bonvoy Brilliant American Express Card', 'American Express', 650,
  false, '開卡後 6 個月內消費滿 $6,000 可獲得 95,000 Marriott Bonvoy 點數',
  760, 6000,
  6, '{"marriott_purchases":"6x Marriott Bonvoy points","dining":"3x Marriott Bonvoy points","flights_booked_directly":"3x Marriott Bonvoy points","general":"2x Marriott Bonvoy points"}'::jsonb, ARRAY['每年持卡週年贈送 1 晚 Free Night Award（最高 85,000 點）', '自動獲得 Platinum Elite 會員資格', '$300 Marriott Bonvoy Credit（限 Marriott 消費）', 'Priority Pass Select 貴賓室', '每年 25 晚 Elite Night Credits', 'Global Entry / TSA PreCheck 報銷']::text[],
  '{"rule_name":"Amex 2/90 + 5 Card Limit","description":"90 天內最多核准 2 張 Amex credit card；最多同時持有 5 張 Amex credit card（charge card 不算）","once_per_lifetime":"同一張卡的開卡禮一輩子只能拿一次","popup_rule":"系統判斷你不夠「有利潤」會跳出 pop-up 阻擋開卡禮"}'::jsonb, 0,
  'Excellent (720+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'amex-delta-skymiles-gold', 'American Express', 'Delta SkyMiles Gold American Express Card', 'American Express', 150,
  false, '開卡後 6 個月內消費滿 $3,000 可獲得 40,000 Delta SkyMiles',
  480, 3000,
  6, '{"delta_purchases":"2x Delta SkyMiles","dining":"2x Delta SkyMiles","groceries":"2x Delta SkyMiles","general":"1x Delta SkyMiles"}'::jsonb, ARRAY['免費託運第一件行李（每年可省 $120+）', '優先登機', '每年 $200 Delta Stay credit（Delta Stays 訂房）', '20% 機上消費折扣']::text[],
  '{"rule_name":"Amex 2/90 + 5 Card Limit","description":"90 天內最多核准 2 張 Amex credit card；最多同時持有 5 張 Amex credit card（charge card 不算）","once_per_lifetime":"同一張卡的開卡禮一輩子只能拿一次","popup_rule":"系統判斷你不夠「有利潤」會跳出 pop-up 阻擋開卡禮"}'::jsonb, 0,
  'Good to Excellent (670+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'amex-delta-skymiles-platinum', 'American Express', 'Delta SkyMiles Platinum American Express Card', 'American Express', 350,
  false, '開卡後 6 個月內消費滿 $5,000 可獲得 60,000 Delta SkyMiles',
  720, 5000,
  6, '{"delta_purchases":"3x Delta SkyMiles","dining":"2x Delta SkyMiles","groceries":"2x Delta SkyMiles","general":"1x Delta SkyMiles"}'::jsonb, ARRAY['免費託運第一件行李', '每年獲得 Companion Certificate（同行票，國內來回只需付稅金）', 'Global Entry / TSA PreCheck 報銷', '20% 機上消費折扣', '每年 $200 Delta Stay credit']::text[],
  '{"rule_name":"Amex 2/90 + 5 Card Limit","description":"90 天內最多核准 2 張 Amex credit card；最多同時持有 5 張 Amex credit card（charge card 不算）","once_per_lifetime":"同一張卡的開卡禮一輩子只能拿一次","popup_rule":"系統判斷你不夠「有利潤」會跳出 pop-up 阻擋開卡禮"}'::jsonb, 0,
  'Good to Excellent (670+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'amex-delta-skymiles-reserve', 'American Express', 'Delta SkyMiles Reserve American Express Card', 'American Express', 650,
  false, '開卡後 6 個月內消費滿 $6,000 可獲得 60,000 Delta SkyMiles',
  720, 6000,
  6, '{"delta_purchases":"3x Delta SkyMiles","general":"1x Delta SkyMiles"}'::jsonb, ARRAY['Delta Sky Club 貴賓室免費使用', 'Centurion Lounge 使用（搭 Delta 航班時）', '免費託運第一件行李', '每年獲得 Companion Certificate', 'Global Entry / TSA PreCheck 報銷', '每年 MQM（Medallion Qualification Miles）boost']::text[],
  '{"rule_name":"Amex 2/90 + 5 Card Limit","description":"90 天內最多核准 2 張 Amex credit card；最多同時持有 5 張 Amex credit card（charge card 不算）","once_per_lifetime":"同一張卡的開卡禮一輩子只能拿一次","popup_rule":"系統判斷你不夠「有利潤」會跳出 pop-up 阻擋開卡禮"}'::jsonb, 0,
  'Excellent (720+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'amex-business-platinum', 'American Express', 'The Business Platinum Card from American Express', 'American Express', 695,
  false, '開卡後 3 個月內消費滿 $15,000 可獲得 150,000 Membership Rewards 點數',
  3000, 15000,
  3, '{"flights_and_prepaid_hotels":"5x MR（透過 Amex Travel 或直接和航空公司預訂）","us_purchases_over_5k":"1.5x MR（單筆消費超過 $5,000，每年最高 $2M）","general":"1x MR"}'::jsonb, ARRAY['航班和預付飯店 5x MR', '單筆超過 $5K 消費享 1.5x MR', 'MR 透過 Amex Travel 訂機票價值 +35%', 'Centurion Lounge、Priority Pass、Delta Sky Club（搭 Delta 時）', '$200 航空 Fee Credit', 'Dell Technologies Credit（每半年 $100）', 'Adobe Credit（每月 $19.99）', 'Indeed Credit（每月 $100）', 'Hilton Gold / Marriott Gold Elite']::text[],
  '{"rule_name":"Amex Once-Per-Lifetime","description":"同一張卡的開卡禮一輩子只能拿一次","popup_rule":"系統判斷你不夠「有利潤」會跳出 pop-up 阻擋開卡禮","note":"Business Platinum 是 Charge Card，不受 5 credit card limit 限制"}'::jsonb, 0,
  'Excellent (720+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'amex-business-gold', 'American Express', 'American Express Business Gold Card', 'American Express', 375,
  false, '開卡後 3 個月內消費滿 $15,000 可獲得 100,000 Membership Rewards 點數',
  2000, 15000,
  3, '{"top_2_categories":"4x MR（每月自動偵測消費最高的 2 個類別，每年首 $150,000）","categories_include":"航空、廣告、加油、餐廳、運輸、科技","general":"1x MR"}'::jsonb, ARRAY['每月消費最高的 2 個類別自動享 4x MR', '適合商業消費多元化的小企業主', '可轉點到航空/飯店夥伴', '靈活的付款方式（可選擇分期或全額）', '每年 $240 Uber Credit（每月 $20）']::text[],
  '{"rule_name":"Amex Once-Per-Lifetime","description":"同一張卡的開卡禮一輩子只能拿一次","popup_rule":"系統判斷你不夠「有利潤」會跳出 pop-up 阻擋開卡禮","note":"Business Gold 是 Charge Card，不受 5 credit card limit 限制"}'::jsonb, 0,
  'Excellent (720+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'citi-double-cash', 'Citi', 'Citi Double Cash Card', 'Mastercard', 0,
  false, '開卡後 6 個月內消費滿 $1,500 可獲得 $200 現金回饋',
  200, 1500,
  6, '{"general":"2% cash back（1% 消費時 + 1% 繳帳單時）/ 2x ThankYou Points"}'::jsonb, ARRAY['所有消費無上限 2% 回饋', '無年費', '可轉為 ThankYou Points 搭配 Strata Premier 轉點', '0% APR 前 18 個月（Balance Transfer）', 'Citi Entertainment 購票優先']::text[],
  '{"rule_name":"Citi 8/65 & 1/8 Rule","description":"8 天內最多申請 1 張 Citi 卡，65 天內最多申請 2 張"}'::jsonb, 3,
  'Good to Excellent (670+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'citi-custom-cash', 'Citi', 'Citi Custom Cash Card', 'Mastercard', 0,
  false, '開卡後 6 個月內消費滿 $1,500 可獲得 $200 現金回饋',
  200, 1500,
  6, '{"top_eligible_category":"5% cash back / 5x TYP（每月消費最高的類別，每計費週期首 $500）","categories_include":"餐廳、加油站、超市、藥局、旅行、交通、串流、健身房","general":"1% cash back / 1x TYP"}'::jsonb, ARRAY['每月自動偵測消費最高的類別享 5% 回饋', '無年費', '可轉為 ThankYou Points 搭配 Strata Premier 轉點', '適合單一類別消費集中的使用者', '0% APR 前 15 個月']::text[],
  '{"rule_name":"Citi 8/65 & 1/8 Rule","description":"8 天內最多申請 1 張 Citi 卡，65 天內最多申請 2 張"}'::jsonb, 3,
  'Good to Excellent (670+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'citi-strata-premier', 'Citi', 'Citi Strata Premier Card', 'Mastercard', 95,
  false, '開卡後 3 個月內消費滿 $4,000 可獲得 75,000 ThankYou Points',
  750, 4000,
  3, '{"flights":"3x TYP","hotels":"3x TYP","dining":"3x TYP","groceries":"3x TYP","gas":"3x TYP","ground_transportation":"3x TYP","ev_charging":"3x TYP","general":"1x TYP"}'::jsonb, ARRAY['多類別 3x 回饋（旅行/餐廳/超市/加油/交通等）', '轉點到 Turkish Airlines/Singapore Airlines 等航空夥伴', '每年 $100 Hotel Credit（透過 thankyou.com 訂）', '旅行延誤保險', '無外幣交易手續費', 'TYP 可合併 Double Cash 和 Custom Cash 的點數一起轉']::text[],
  '{"rule_name":"Citi 8/65 & 1/8 Rule + 24 Month Rule","description":"8 天內最多申請 1 張 Citi 卡，65 天內最多申請 2 張。過去 24 個月內拿過同一張卡的開卡禮則不能再拿"}'::jsonb, 0,
  'Good to Excellent (670+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'citi-aadvantage-platinum-select', 'Citi', 'Citi / AAdvantage Platinum Select World Elite Mastercard', 'Mastercard', 99,
  true, '開卡後 3 個月內消費滿 $2,500 可獲得 50,000 AAdvantage miles',
  625, 2500,
  3, '{"american_airlines_purchases":"2x AA miles","dining":"2x AA miles","gas":"2x AA miles","general":"1x AA miles"}'::jsonb, ARRAY['首年免年費', '免費託運第一件行李', '優先登機', '25% 機上消費折扣', '每年消費滿 $20,000 贈送 Companion Certificate']::text[],
  '{"rule_name":"Citi 8/65 & 1/8 Rule + 24 Month Rule","description":"8 天內最多申請 1 張 Citi 卡，65 天內最多申請 2 張。48 個月內拿過同一張 AA 卡的開卡禮則不能再拿"}'::jsonb, 0,
  'Good to Excellent (670+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'citi-aadvantage-executive', 'Citi', 'Citi / AAdvantage Executive World Elite Mastercard', 'Mastercard', 595,
  false, '開卡後 3 個月內消費滿 $10,000 可獲得 70,000 AAdvantage miles',
  875, 10000,
  3, '{"american_airlines_purchases":"4x AA miles","dining":"2x AA miles","general":"1x AA miles"}'::jsonb, ARRAY['Admirals Club 貴賓室免費使用（可帶 2 位同行旅客）', '免費託運前三件行李', '優先登機和安檢', 'Global Entry / TSA PreCheck 報銷', '每年消費滿 $40,000 贈送 10,000 EQMs']::text[],
  '{"rule_name":"Citi 8/65 & 1/8 Rule + 48 Month Rule","description":"8 天內最多申請 1 張 Citi 卡，65 天內最多申請 2 張。48 個月內拿過同一張 AA 卡的開卡禮則不能再拿"}'::jsonb, 0,
  'Excellent (720+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'capital-one-venture-x', 'Capital One', 'Capital One Venture X Rewards Credit Card', 'Visa', 395,
  false, '開卡後 3 個月內消費滿 $4,000 可獲得 75,000 Capital One miles',
  750, 4000,
  3, '{"flights_via_capital_one_travel":"10x miles","hotels_rental_cars_via_portal":"5x miles","flights_direct":"2x miles","general":"2x miles"}'::jsonb, ARRAY['$300 旅行 credit（透過 Capital One Travel 訂購，每年自動折抵）', '每年 10,000 Anniversary miles（價值 $100+）', 'Capital One Lounge 和 Plaza Premium Lounge（2026/2/1 起，來賓需付 $45/人進入 Capital One Lounge，授權使用者需付 $125/年才有貴賓室權限）', 'Priority Pass Select 貴賓室', '轉點到 Turkish Airlines/Air Canada 等 15+ 航空夥伴', '所有消費 2x miles 是高年費卡中最高一般消費回饋', 'Global Entry / TSA PreCheck 報銷', 'Hertz President''s Circle 租車會員']::text[],
  '{"rule_name":"Capital One 限制","description":"Capital One 通常限制同時持有 2 張 Capital One credit card。部分人可持有更多，取決於個人情況"}'::jsonb, 0,
  'Excellent (720+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'capital-one-venture', 'Capital One', 'Capital One Venture Rewards Credit Card', 'Visa', 95,
  false, '開卡後 3 個月內消費滿 $4,000 可獲得 75,000 Capital One miles',
  750, 4000,
  3, '{"hotels_rental_cars_via_portal":"5x miles","general":"2x miles"}'::jsonb, ARRAY['所有消費 2x miles', '可轉點到 15+ 航空夥伴', 'Miles 可直接折抵旅行消費', 'Global Entry / TSA PreCheck 報銷', '無外幣交易手續費']::text[],
  '{"rule_name":"Capital One 限制","description":"Capital One 通常限制同時持有 2 張 Capital One credit card"}'::jsonb, 0,
  'Good to Excellent (670+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'capital-one-ventureone', 'Capital One', 'Capital One VentureOne Rewards Credit Card', 'Visa', 0,
  false, '開卡後 3 個月內消費滿 $1,000 可獲得 20,000 Capital One miles',
  200, 1000,
  3, '{"hotels_rental_cars_via_portal":"5x miles","general":"1.25x miles"}'::jsonb, ARRAY['無年費旅行卡', '一般消費 1.25x miles', '可轉點到航空夥伴', '無外幣交易手續費', '0% APR 前 15 個月']::text[],
  '{"rule_name":"Capital One 限制","description":"Capital One 通常限制同時持有 2 張 Capital One credit card"}'::jsonb, 0,
  'Good (670+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'capital-one-savor', 'Capital One', 'Capital One Savor Cash Rewards Credit Card', 'Mastercard', 95,
  false, '開卡後 3 個月內消費滿 $3,000 可獲得 $300 現金回饋',
  300, 3000,
  3, '{"dining":"4% cash back","entertainment":"4% cash back","streaming":"4% cash back","groceries":"3% cash back","general":"1% cash back"}'::jsonb, ARRAY['餐廳/娛樂/串流 4% 回饋', '超市 3% 回饋', 'Capital One Entertainment 購票優先', '無外幣交易手續費']::text[],
  '{"rule_name":"Capital One 限制","description":"Capital One 通常限制同時持有 2 張 Capital One credit card"}'::jsonb, 0,
  'Good to Excellent (670+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'capital-one-savorone', 'Capital One', 'Capital One SavorOne Cash Rewards Credit Card', 'Visa', 0,
  false, '開卡後 3 個月內消費滿 $500 可獲得 $200 現金回饋',
  200, 500,
  3, '{"dining":"3% cash back","entertainment":"3% cash back","streaming":"3% cash back","groceries":"3% cash back","general":"1% cash back"}'::jsonb, ARRAY['無年費', '餐廳/娛樂/串流/超市 3% 回饋', 'Capital One Entertainment 購票優先', '無外幣交易手續費', '0% APR 前 15 個月']::text[],
  '{"rule_name":"Capital One 限制","description":"Capital One 通常限制同時持有 2 張 Capital One credit card"}'::jsonb, 0,
  'Good (670+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'capital-one-quicksilver', 'Capital One', 'Capital One Quicksilver Cash Rewards Credit Card', 'Visa', 0,
  false, '開卡後 3 個月內消費滿 $500 可獲得 $200 現金回饋',
  200, 500,
  3, '{"general":"1.5% cash back"}'::jsonb, ARRAY['無年費', '所有消費 1.5% 無上限回饋', '無外幣交易手續費', '0% APR 前 15 個月', '簡單好用的入門回饋卡']::text[],
  '{"rule_name":"Capital One 限制","description":"Capital One 通常限制同時持有 2 張 Capital One credit card"}'::jsonb, 0,
  'Good (670+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'bilt-blue', 'Bilt', 'Bilt Blue Card', 'Mastercard', 0,
  false, '無固定開卡禮',
  0, 0,
  0, '{"general":"1x Bilt Points（或選擇 4% Bilt Cash）","rent":"最高 1.25x（依每月非房租消費金額分級：>=100% 房租=1.25x, >=75%=1x, >=50%=0.75x, >=25%=0.5x）","mortgage":"同 rent 規則，透過 Bilt 付款無手續費"}'::jsonb, ARRAY['無年費即可用信用卡付房租和房貸賺點數，無手續費', 'Bilt Points 可 1:1 轉到 23 個航空/飯店夥伴', '入門級 Bilt 卡，適合只想賺房租點數的人', '10% 開卡首年新購買優惠 APR']::text[],
  '{"rule_name":"Bilt 規則","description":"三張 Bilt 卡的開卡禮為 lifetime 限制，只能拿一次","housing_earning":"房租/房貸點數依每月非房租消費比例分級，消費越多賺越多"}'::jsonb, 0,
  'Good (670+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'bilt-obsidian', 'Bilt', 'Bilt Obsidian Card', 'Mastercard', 95,
  false, '開卡後 3 個月內消費滿 $2,000 可獲得 25,000 Bilt Points',
  450, 2000,
  3, '{"dining_or_groceries":"3x Bilt Points（擇一，每年上限 $25,000）","travel":"2x Bilt Points","general":"1x Bilt Points（或 4% Bilt Cash）","rent":"最高 1x（依消費分級，或用 Bilt Cash 兌換）","mortgage":"同 rent 規則"}'::jsonb, ARRAY['3x 餐廳或超市（擇一）', '2x 旅行', '$100 年度飯店 credit（透過 Bilt Travel）', '23 個轉點夥伴 1:1', 'World Elite Mastercard 保障']::text[],
  '{"rule_name":"Bilt 規則","description":"三張 Bilt 卡的開卡禮為 lifetime 限制","category_choice":"開卡預設 3x 為餐廳，30 天內可改為超市，之後每年可更換一次"}'::jsonb, 0,
  'Good to Excellent (670+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'bilt-palladium', 'Bilt', 'Bilt Palladium Card', 'Mastercard', 495,
  false, '開卡後 3 個月內消費滿 $4,000 可獲得 50,000 Bilt Points + 核卡即送 $300 Bilt Cash + Bilt Gold 身分',
  1600, 4000,
  3, '{"general":"2x Bilt Points（或 4% Bilt Cash）","rent":"最高 1.25x（依消費分級）","mortgage":"同 rent 規則"}'::jsonb, ARRAY['所有消費 2x Bilt Points', '$400 年度 Bilt Travel 飯店 credit（半年 $200）', '$200 年度 Bilt Cash credit', 'Priority Pass 會員 + 可帶 2 位來賓', '23 個轉點夥伴 1:1', 'World Legend Mastercard 保障（含手機保險）', '核卡送 $300 Bilt Cash + Bilt Gold 身分']::text[],
  '{"rule_name":"Bilt 規則","description":"三張 Bilt 卡的開卡禮為 lifetime 限制"}'::jsonb, 0,
  'Excellent (720+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'us-bank-altitude-reserve', 'US Bank', 'US Bank Altitude Reserve Visa Infinite Card', 'Visa', 400,
  false, '開卡後 3 個月內消費滿 $4,500 可獲得 50,000 點數',
  750, 4500,
  3, '{"mobile_wallet":"3x points（Apple Pay / Google Pay / Samsung Pay）","travel":"3x points","dining":"3x points","general":"1x points"}'::jsonb, ARRAY['行動支付（Apple Pay 等）消費 3x 回饋', '$325 旅行和餐廳 credit', 'Priority Pass Select 貴賓室', 'Global Entry / TSA PreCheck 報銷', 'Points 透過 Real-Time Mobile Rewards 即時折抵價值 1.5x']::text[],
  '{"rule_name":"US Bank 新客戶限制","description":"建議先有 US Bank 支票或儲蓄帳戶再申請，否則核卡機率較低"}'::jsonb, 0,
  'Excellent (720+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'us-bank-altitude-connect', 'US Bank', 'US Bank Altitude Connect Visa Signature Card', 'Visa', 95,
  true, '開卡後 3 個月內消費滿 $2,000 可獲得 50,000 點數',
  500, 2000,
  3, '{"travel_via_portal":"5x points","gas_ev_charging":"4x points","groceries":"4x points","dining":"2x points","streaming":"2x points","general":"1x points"}'::jsonb, ARRAY['首年免年費', '加油和超市 4x 回饋', '每年 $30 streaming credit', '2 次 lounge visit/年', '無外幣交易手續費']::text[],
  '{"rule_name":"US Bank 新客戶限制","description":"建議先有 US Bank 帳戶再申請"}'::jsonb, 0,
  'Good to Excellent (670+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'wells-fargo-autograph', 'Wells Fargo', 'Wells Fargo Autograph Card', 'Visa', 0,
  false, '開卡後 3 個月內消費滿 $1,500 可獲得 20,000 Rewards 點數',
  200, 1500,
  3, '{"dining":"3x points","travel":"3x points","gas":"3x points","transit":"3x points","streaming":"3x points","phone_plans":"3x points","general":"1x points"}'::jsonb, ARRAY['無年費', '6 大類別 3x 回饋', '手機保護計劃', '0% APR 前 12 個月', '搭配 Autograph Journey 可轉點到航空夥伴']::text[],
  '{"rule_name":"Wells Fargo 限制","description":"無特殊限制規則，但 Wells Fargo 對新客戶審核較嚴"}'::jsonb, 3,
  'Good (670+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'wells-fargo-autograph-journey', 'Wells Fargo', 'Wells Fargo Autograph Journey Card', 'Visa', 95,
  false, '開卡後 3 個月內消費滿 $4,000 可獲得 60,000 Rewards 點數',
  600, 4000,
  3, '{"flights":"5x points","hotels":"4x points","dining":"3x points","general":"1x points"}'::jsonb, ARRAY['航班 5x、飯店 4x 回饋', '可轉點到航空夥伴（Air France/British Airways 等）', '每年 $50 flight credit', '無外幣交易手續費', '旅行延誤保險']::text[],
  '{"rule_name":"Wells Fargo 限制","description":"無特殊限制規則"}'::jsonb, 0,
  'Good to Excellent (670+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'wells-fargo-active-cash', 'Wells Fargo', 'Wells Fargo Active Cash Card', 'Visa', 0,
  false, '開卡後 3 個月內消費滿 $500 可獲得 $200 現金回饋',
  200, 500,
  3, '{"general":"2% cash back"}'::jsonb, ARRAY['無年費，所有消費 2% 回饋', '0% APR 前 12 個月', '手機保護計劃', '與 Citi Double Cash 並列最佳無年費 2% 現金回饋卡']::text[],
  '{"rule_name":"Wells Fargo 限制","description":"無特殊限制規則"}'::jsonb, 3,
  'Good (670+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'bofa-premium-rewards', 'Bank of America', 'Bank of America Premium Rewards Card', 'Visa', 95,
  false, '開卡後 3 個月內消費滿 $3,000 可獲得 60,000 點數',
  600, 3000,
  3, '{"dining":"3.5x points","travel":"3.5x points","general":"2.625x points（Preferred Rewards Platinum Honors 加成後）"}'::jsonb, ARRAY['Preferred Rewards Platinum Honors 會員可大幅加成回饋', '每年 $100 航空或 TSA PreCheck credit', '無外幣交易手續費', '旅行延誤保險', 'BofA 客戶有 Preferred Rewards 加成最高 75%']::text[],
  '{"rule_name":"BofA 2/3/4 Rule","description":"2 個月內最多 1 張 BofA 卡，3 個月內最多 2 張，12 個月內最多 3-4 張"}'::jsonb, 0,
  'Good to Excellent (670+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'bofa-customized-cash-rewards', 'Bank of America', 'Bank of America Customized Cash Rewards Credit Card', 'Visa', 0,
  false, '開卡後 3 個月內消費滿 $1,000 可獲得 $200 現金回饋',
  200, 1000,
  3, '{"choice_category":"3% cash back（自選 1 個類別：加油/網購/餐廳/旅行/藥局/居家裝修，每季 $2,500 上限）","groceries_wholesale":"2% cash back（每季 $2,500 上限）","general":"1% cash back"}'::jsonb, ARRAY['無年費', '自選類別 3% 回饋', '超市/量販 2% 回饋', 'Preferred Rewards 會員可加成回饋最高 75%（最高達 5.25%）', '0% APR 前 15 個月']::text[],
  '{"rule_name":"BofA 2/3/4 Rule","description":"2 個月內最多 1 張 BofA 卡，3 個月內最多 2 張，12 個月內最多 3-4 張"}'::jsonb, 3,
  'Good (670+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'barclays-aadvantage-aviator-red', 'Barclays', 'Barclays AAdvantage Aviator Red World Elite Mastercard', 'Mastercard', 99,
  false, '核卡後只要完成第一筆消費並繳年費即可獲得 60,000 AAdvantage miles',
  750, 0,
  3, '{"american_airlines_purchases":"2x AA miles","general":"1x AA miles"}'::jsonb, ARRAY['幾乎無消費門檻的開卡禮（只需 1 筆消費）', '免費託運第一件行李', '優先登機', '25% 機上消費折扣', '每年消費滿 $20,000 贈送 Companion Certificate']::text[],
  '{"rule_name":"Barclays 6/24 Rule","description":"過去 24 個月內新開超過 6 張任何銀行的信用卡，Barclays 可能拒絕申請"}'::jsonb, 0,
  'Good to Excellent (670+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'apple-card', 'Apple / Goldman Sachs', 'Apple Card', 'Mastercard', 0,
  false, '無固定開卡禮',
  0, 0,
  0, '{"apple_purchases":"3% Daily Cash","apple_pay":"2% Daily Cash（使用 Apple Pay 付款）","general":"1% Daily Cash"}'::jsonb, ARRAY['無年費', 'Apple 購物 3% 回饋', 'Apple Pay 付款 2% 回饋', 'Daily Cash 每日結算直接入帳', '無手續費、無逾期費、無外幣交易手續費', 'iPhone 上精美的消費追蹤和管理介面', '分期購買 Apple 產品 0% 利率']::text[],
  '{"rule_name":"Apple Card 規則","description":"需有 iPhone 才能申請，透過 Wallet app 申請"}'::jsonb, 0,
  'Fair to Good (600+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'boa-alaska-atmos-ascent', 'Bank of America', 'Atmos Rewards Ascent Visa Signature', 'Visa', 95,
  false, '開卡後 90 天內消費滿 $3,000 可獲得 70,000 Atmos Rewards 點數 + $99 Companion Fare',
  1050, 3000,
  3, '{"alaska_hawaiian":"3x Atmos Points","gas_ev_charging":"2x Atmos Points","streaming_cable":"2x Atmos Points","transit_rideshare":"2x Atmos Points","general":"1x Atmos Points"}'::jsonb, ARRAY['持卡人及同一訂位最多 6 位同行者免費託運第一件行李', '優先登機', '$100 折扣 Alaska Lounge+ 年費', '$99 Companion Fare（每年續卡後獲得）', 'Bank of America 帳戶持有者額外 10% 點數加成', '無海外交易手續費']::text[],
  '{"rule_name":"Bank of America 規則","description":"Bank of America 在 2 個月內最多核准 2-3 張信用卡，建議間隔 3-6 個月再申請"}'::jsonb, 0,
  'Good to Excellent (670+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

INSERT INTO credit_cards (
  slug, issuer, card_name, card_network, annual_fee,
  annual_fee_waived_first_year, signup_bonus_description,
  signup_bonus_value_estimate, signup_bonus_spend_requirement,
  signup_bonus_time_limit_months, earning_rates, key_benefits,
  application_rules, foreign_transaction_fee,
  credit_score_recommended, is_active
) VALUES (
  'boa-alaska-atmos-summit', 'Bank of America', 'Atmos Rewards Summit Visa Infinite', 'Visa', 395,
  false, '開卡後 90 天內消費滿 $4,000 可獲得 80,000 Atmos Rewards 點數 + 25,000 點 Global Companion Award',
  1575, 4000,
  3, '{"alaska_hawaiian":"3x Atmos Points","dining":"3x Atmos Points","international":"3x Atmos Points","general":"1x Atmos Points"}'::jsonb, ARRAY['持卡人及最多 6 位同行者免費託運行李 + 優先登機', '每年 25,000 點 Global Companion Award（價值約 $375）', '年消費 $60,000 以上可獲額外 100,000 點 Global Companion Award', '每年 8 張 Alaska Lounge 通行證（每季 2 張）', '每 4 年 $120 Global Entry/TSA PreCheck credit', '航班取消或延誤超過 2 小時可獲 $50 voucher', '消費 $1 賺 1 status point，$20K=Silver，$60K=Gold', '每年續卡送 10,000 status points', 'Bank of America 帳戶額外 10% 點數加成', '無海外交易手續費', 'Visa Infinite concierge 服務']::text[],
  '{"rule_name":"Bank of America 規則","description":"Bank of America 在 2 個月內最多核准 2-3 張信用卡"}'::jsonb, 0,
  'Excellent (720+)', true
) ON CONFLICT (slug) DO UPDATE SET
  issuer = EXCLUDED.issuer,
  card_name = EXCLUDED.card_name,
  card_network = EXCLUDED.card_network,
  annual_fee = EXCLUDED.annual_fee,
  annual_fee_waived_first_year = EXCLUDED.annual_fee_waived_first_year,
  signup_bonus_description = EXCLUDED.signup_bonus_description,
  signup_bonus_value_estimate = EXCLUDED.signup_bonus_value_estimate,
  signup_bonus_spend_requirement = EXCLUDED.signup_bonus_spend_requirement,
  signup_bonus_time_limit_months = EXCLUDED.signup_bonus_time_limit_months,
  earning_rates = EXCLUDED.earning_rates,
  key_benefits = EXCLUDED.key_benefits,
  application_rules = EXCLUDED.application_rules,
  foreign_transaction_fee = EXCLUDED.foreign_transaction_fee,
  credit_score_recommended = EXCLUDED.credit_score_recommended,
  is_active = EXCLUDED.is_active,
  updated_at = now();

-- ============================================================
-- 2. INSERT CARD BENEFITS
-- ============================================================
-- Delete existing benefits first for idempotency
DELETE FROM card_benefits WHERE card_id IN (SELECT id FROM credit_cards);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'chase-sapphire-preferred'),
  'travel', 'UR Portal 加值', '透過 Chase Travel Portal 訂旅行，UR 點數價值提升 25%（1 UR = 1.25 cents）',
  0, 'multiplier', '訂機票和飯店記得用 Chase Travel Portal', 'none', '所有旅行預訂都透過 portal 以獲得最大價值'
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'chase-sapphire-preferred'),
  'travel', '旅行延誤保險', '航班延誤超過 6 小時或需要過夜，可報銷最高 $500 的住宿和餐飲費用',
  500, 'insurance', NULL, 'per_occurrence', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'chase-sapphire-preferred'),
  'dining', 'DoorDash DashPass', '免費 DoorDash DashPass 會員，享有免運費和折扣優惠',
  96, 'membership', NULL, 'annual', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'chase-sapphire-preferred'),
  'hotel_credit', '$50 Chase Travel Hotel Credit', '每年 $50 Chase Travel 飯店預訂 credit',
  50, 'credit', NULL, 'cardmember_year', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'chase-sapphire-preferred'),
  'rideshare', '5x Lyft', '使用 CSP 搭 Lyft 可獲得 5x UR 點數',
  0, 'multiplier', NULL, 'ongoing', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'chase-sapphire-preferred'),
  'other', '5x Peloton', 'Peloton 消費可獲得 5x UR 點數',
  0, 'multiplier', NULL, 'ongoing', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'chase-sapphire-reserve'),
  'travel_credit', '$300 旅行 Credit', '每年自動折抵最高 $300 的旅行消費（機票、飯店、租車、Uber 等）',
  300, 'credit', '從持卡週年日起算，一年內用完', 'cardmember_year', '刷任何旅行消費即自動折抵，不需額外操作'
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'chase-sapphire-reserve'),
  'hotel_credit', '$500 The Edit 飯店 Credit', '透過 The Edit 預訂飯店，每次預訂最高 $250 credit',
  500, 'credit', NULL, 'cardmember_year', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'chase-sapphire-reserve'),
  'hotel_credit', '$250 Chase Travel 飯店 Credit', '透過 Chase Travel 預訂指定連鎖飯店可獲 $250 credit（至 12/31/26）',
  250, 'credit', NULL, 'cardmember_year', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'chase-sapphire-reserve'),
  'dining_credit', '$300 餐飲 Credit', 'Sapphire Exclusive Tables 餐飲 credit，每半年 $150',
  300, 'credit', NULL, 'semi_annual', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'chase-sapphire-reserve'),
  'entertainment', '$288 Apple TV + Music', 'Apple TV+ 和 Apple Music 訂閱 credit',
  288, 'credit', NULL, 'monthly', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'chase-sapphire-reserve'),
  'dining_credit', '$120 DashPass + 每月 Promo', 'DoorDash DashPass 會員資格 + 每月促銷優惠',
  120, 'credit', NULL, 'monthly', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'chase-sapphire-reserve'),
  'entertainment', '$300 StubHub Credit', 'StubHub 購票 credit，每半年 $150',
  300, 'credit', NULL, 'semi_annual', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'chase-sapphire-reserve'),
  'rideshare', '$120 Lyft Credit + 5x', '每年 $120 Lyft credit 加上 Lyft 消費 5x UR',
  120, 'credit', NULL, 'annual', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'chase-sapphire-reserve'),
  'other', '$120 Peloton Credit + 10x', '每年 $120 Peloton credit 加上 Peloton 消費 10x UR',
  120, 'credit', NULL, 'annual', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'chase-sapphire-reserve'),
  'lounge', 'Chase Sapphire Lounge + Priority Pass', 'Chase Sapphire Lounge 和 Priority Pass Select 會員，可使用全球 1,300+ 機場貴賓室',
  500, 'membership', NULL, 'annual', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'chase-sapphire-reserve'),
  'travel', 'Global Entry / TSA PreCheck', '報銷 Global Entry 或 TSA PreCheck 申請費用，每 4 年 $120',
  120, 'credit', NULL, 'every_4_years', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'chase-sapphire-reserve'),
  'hotel', 'IHG Platinum Elite Status', '自動獲得 IHG Platinum Elite 會員資格',
  0, 'status', NULL, 'annual', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'chase-sapphire-reserve'),
  'travel', '旅行延誤保險', '航班延誤超過 2 小時即可報銷最高 $500 的住宿和餐飲費用',
  500, 'insurance', NULL, 'per_occurrence', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'chase-sapphire-reserve'),
  'travel', 'UR Portal 加值', '透過 Chase Travel Portal 訂旅行，UR 點數價值提升 50%（1 UR = 1.5 cents）',
  0, 'multiplier', NULL, 'none', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'chase-freedom-flex'),
  'insurance', '手機保護計劃', '用此卡支付每月手機帳單，手機損壞或被盜可獲最高 $800 理賠（$50 自付額）',
  800, 'insurance', NULL, 'per_occurrence', '每月用這張卡自動繳手機帳單'
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'chase-ink-business-preferred'),
  'insurance', '手機保護計劃', '用此卡支付每月手機帳單，手機損壞或被盜可獲最高 $1,000 理賠',
  1000, 'insurance', NULL, 'per_occurrence', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'chase-united-explorer'),
  'airline', '免費託運行李', '持卡人及同一訂位的一位旅伴可免費託運第一件行李',
  70, 'waiver', NULL, 'per_flight', '用此卡購買 United 機票即可享有'
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'chase-united-quest'),
  'travel_credit', '$125 United 旅行 Credit', '每年自動折抵最高 $125 的 United 航空消費',
  125, 'credit', NULL, 'cardmember_year', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'chase-united-club-infinite'),
  'lounge', 'United Club 貴賓室', '持卡人可無限次使用全球 United Club 貴賓室',
  650, 'membership', NULL, 'annual', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'chase-world-of-hyatt'),
  'hotel', '年度 Free Night Award', '每年持卡週年自動獲得 1 晚 Category 1-4 Free Night Award',
  150, 'free_night', 'Free Night 會在週年日後幾週發放，有效期通常為一年', 'cardmember_year', '用在 Category 4 飯店以獲得最大價值'
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'chase-marriott-bonvoy-boundless'),
  'hotel', '年度 Free Night Award', '每年持卡週年自動獲得 1 晚 Free Night Award（最高可用於 35,000 點的飯店）',
  150, 'free_night', NULL, 'cardmember_year', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'chase-ihg-one-rewards-premier'),
  'hotel', '年度 Free Night Award', '每年持卡週年自動獲得 1 晚 Free Night Award（最高可用於 40,000 點的飯店）',
  200, 'free_night', NULL, 'cardmember_year', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'chase-southwest-priority'),
  'travel_credit', '$75 Southwest Credit', '每年自動折抵最高 $75 的 Southwest 航空消費',
  75, 'credit', NULL, 'cardmember_year', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'amex-platinum'),
  'hotel_credit', '$600 Hotel Credit', '透過 Amex Travel 訂 FHR 或 THC 飯店，每半年 $300 credit（1-6月 / 7-12月）',
  600, 'credit', '每半年 $300，未使用不累計', 'semi_annual', '訂 Fine Hotels + Resorts 同時享受升等和早餐'
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'amex-platinum'),
  'airline_credit', '$200 Airline Fee Credit', '每年選定一家航空公司，可報銷最高 $200 的附加費用（行李費、座位選擇等，不含機票）',
  200, 'credit', '每年 1 月需重新選擇航空公司，全年有效', 'calendar_year', '選擇你最常搭的航空公司，用來折抵行李費或購買 gift card'
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'amex-platinum'),
  'rideshare', '$200 Uber Credit', '每月 $15 Uber credit（12 月額外 $20），自動加入 Uber Cash',
  200, 'credit', '每月 credit 不用即過期，記得每月用完', 'monthly', '用 Uber Eats 點餐或叫車都可以'
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'amex-platinum'),
  'entertainment', '$300 Entertainment Credit', '每月最高 $25 折抵指定娛樂串流服務',
  300, 'credit', '每月 $25，需用 Platinum 卡訂閱', 'monthly', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'amex-platinum'),
  'travel', '$209 CLEAR+ Credit', '報銷 CLEAR+ 會員費用，享快速通關',
  209, 'credit', NULL, 'annual', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'amex-platinum'),
  'dining_credit', '$400 Resy Dining Credit', '透過 Resy 預訂指定餐廳的 dining credit',
  400, 'credit', NULL, 'cardmember_year', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'amex-platinum'),
  'shopping', '$300 lululemon Credit', '每季 $75 lululemon 消費 credit',
  300, 'credit', '每季 $75，記得每季使用', 'quarterly', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'amex-platinum'),
  'travel', 'Global Entry / TSA PreCheck', '報銷 Global Entry ($100) 或 TSA PreCheck ($78) 申請費用，每 4 年一次',
  100, 'credit', NULL, 'every_4_years', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'amex-platinum'),
  'lounge', 'Centurion Lounge', '免費使用全美 Centurion Lounge，可帶 2 位同行旅客（或無限同行若消費滿 $75K）',
  500, 'membership', NULL, 'annual', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'amex-platinum'),
  'lounge', 'Priority Pass Select', '免費 Priority Pass Select 會員，可使用全球 1,400+ 機場貴賓室',
  429, 'membership', NULL, 'annual', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'amex-platinum'),
  'hotel', 'Hilton Gold / Marriott Gold Elite', '自動獲得 Hilton Gold 和 Marriott Gold Elite 會員資格，享房型升等和免費早餐',
  0, 'status', NULL, 'annual', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'amex-gold'),
  'dining_credit', '$120 Dining Credit', '每月 $10 dining credit，可用於 Grubhub、The Cheesecake Factory、Goldbelly、Wine.com、Milk Bar 及其他指定餐廳',
  120, 'credit', '每月 $10 不累計，記得每月使用', 'monthly', '最簡單的方式是每月用 Grubhub 點一次餐'
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'amex-gold'),
  'rideshare', '$120 Uber Credit', '每月 $10 Uber Credit，自動加入 Uber Cash，可用於 Uber 或 Uber Eats',
  120, 'credit', '每月 $10 不用即過期', 'monthly', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'amex-gold'),
  'dining_credit', '$84 Dunkin'' Credit', '每月 $7 Dunkin'' Credit，自動折抵 Dunkin'' 消費',
  84, 'credit', '每月 $7 不累計', 'monthly', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'amex-gold'),
  'dining_credit', '$100 Resy Credit', '每半年 $50 透過 Resy 預訂指定餐廳的 dining credit',
  100, 'credit', '每半年 $50，記得在半年結束前使用', 'semi_annual', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'amex-green'),
  'travel', '$189 CLEAR Plus Credit', '報銷 CLEAR Plus 會員費用，享快速通關',
  189, 'credit', NULL, 'annual', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'amex-blue-cash-preferred'),
  'streaming', '$120 Disney+/Hulu/ESPN+ Credit', '每月 $10 Disney+、Hulu 或 ESPN+ 訂閱 credit',
  120, 'credit', '每月 $10 不累計，需用此卡訂閱', 'monthly', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'amex-hilton-surpass'),
  'hotel_credit', '$200 Hilton Credit', '每季 $50 Hilton 消費 credit',
  200, 'credit', '每季 $50，記得每季使用', 'quarterly', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'amex-hilton-surpass'),
  'hotel', 'Free Night Award', '每年消費滿 $15,000 贈送 1 晚 Hilton Free Night（無 category 限制）',
  300, 'free_night', NULL, 'cardmember_year', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'amex-hilton-aspire'),
  'hotel', '年度 Free Night Award', '每年持卡週年自動獲得 1 晚 Hilton Free Night Award（無 category 限制，可用在任何 Hilton 飯店）',
  500, 'free_night', NULL, 'cardmember_year', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'amex-hilton-aspire'),
  'hotel_credit', '$400 Hilton Resort Credit', '每半年 $200 可用於 Hilton 旗下度假村消費（餐飲/水療/活動等）',
  400, 'credit', NULL, 'semi_annual', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'amex-hilton-aspire'),
  'airline_credit', '$200 Airline Fee Credit', '每季 $50 航空附加費用報銷（行李費/機上消費/座位升級等）',
  200, 'credit', NULL, 'quarterly', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'amex-hilton-aspire'),
  'travel', '$209 CLEAR+ Credit', '報銷 CLEAR+ 會員費用，享快速通關',
  209, 'credit', NULL, 'annual', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'amex-hilton-aspire'),
  'hotel', 'Hilton Diamond Status', '自動獲得 Hilton Diamond 會員資格：免費早餐、房型升等至套房、額外點數等',
  0, 'status', NULL, 'annual', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'amex-marriott-bonvoy-brilliant'),
  'hotel', '年度 Free Night Award', '每年持卡週年自動獲得 1 晚 Free Night Award（最高可用於 85,000 點的 Marriott 飯店）',
  600, 'free_night', NULL, 'cardmember_year', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'amex-marriott-bonvoy-brilliant'),
  'hotel_credit', '$300 Marriott Credit', '每年 $300 可用於 Marriott 旗下飯店消費',
  300, 'credit', NULL, 'cardmember_year', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'amex-marriott-bonvoy-brilliant'),
  'hotel', 'Platinum Elite Status', '自動獲得 Marriott Platinum Elite 會員：房型升等至套房、行政酒廊、額外點數等',
  0, 'status', NULL, 'annual', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'amex-delta-skymiles-gold'),
  'airline', '免費託運行李', '持卡人及同一訂位最多 8 名旅伴可免費託運第一件行李',
  120, 'waiver', NULL, 'per_flight', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'amex-delta-skymiles-platinum'),
  'airline', 'Companion Certificate', '每年持卡週年獲得一張同行票，同行者搭乘國內來回航班只需付稅金和費用',
  400, 'certificate', '每年更新後發放，有效期一年', 'cardmember_year', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'amex-delta-skymiles-reserve'),
  'lounge', 'Delta Sky Club', '搭乘 Delta 航班時可免費使用 Delta Sky Club 貴賓室，可帶 2 位同行旅客',
  800, 'membership', NULL, 'annual', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'amex-delta-skymiles-reserve'),
  'airline', 'Companion Certificate', '每年持卡週年獲得一張同行票，同行者搭乘國內頭等/商務艙來回只需付稅金',
  600, 'certificate', NULL, 'cardmember_year', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'amex-business-platinum'),
  'airline_credit', '$200 Airline Fee Credit', '每年選定一家航空公司，報銷最高 $200 的附加費用',
  200, 'credit', NULL, 'calendar_year', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'amex-business-platinum'),
  'lounge', 'Centurion Lounge + Priority Pass', '免費使用 Centurion Lounge 和 Priority Pass Select 貴賓室',
  700, 'membership', NULL, 'annual', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'amex-business-gold'),
  'rideshare', '$240 Uber Credit', '每月 $20 Uber Credit，自動加入 Uber Cash',
  240, 'credit', NULL, 'monthly', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'citi-strata-premier'),
  'hotel_credit', '$100 Hotel Credit', '每年透過 thankyou.com 訂飯店可獲得 $100 credit',
  100, 'credit', NULL, 'cardmember_year', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'citi-aadvantage-platinum-select'),
  'airline', '免費託運行李', '持卡人及同一訂位最多 4 名旅伴可免費託運第一件行李',
  70, 'waiver', NULL, 'per_flight', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'citi-aadvantage-executive'),
  'lounge', 'Admirals Club', '持卡人可免費使用全球 Admirals Club 貴賓室，可帶 2 位同行旅客或直系親屬',
  650, 'membership', NULL, 'annual', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'capital-one-venture-x'),
  'travel_credit', '$300 Travel Credit', '每年透過 Capital One Travel 預訂旅行可獲得 $300 credit',
  300, 'credit', NULL, 'cardmember_year', '用 Capital One Travel 訂機票或飯店即可自動折抵'
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'capital-one-venture-x'),
  'miles', '10,000 Anniversary Miles', '每年持卡週年自動獲得 10,000 Capital One miles',
  100, 'bonus_miles', NULL, 'cardmember_year', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'capital-one-venture-x'),
  'lounge', 'Capital One Lounge', '免費使用 Capital One Lounge（達拉斯 DFW、華盛頓 DCA、丹佛 DEN）和 Plaza Premium Lounge。2026/2/1 起來賓需付 $45/人，授權使用者需付 $125/年才有貴賓室權限',
  500, 'membership', NULL, 'annual', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'bilt-obsidian'),
  'hotel_credit', '$100 Bilt Travel 飯店 Credit', '每年可在 Bilt Travel 預訂飯店時使用 $100 credit',
  100, 'credit', NULL, 'cardmember_year', '搭配 Bilt Travel 訂飯店，可抵銷年費'
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'bilt-palladium'),
  'hotel_credit', '$400 Bilt Travel 飯店 Credit', '每年 $400（半年 $200）在 Bilt Travel 預訂飯店的 statement credit',
  400, 'credit', NULL, 'semi_annual', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'bilt-palladium'),
  'other', '$200 Bilt Cash Credit', '每年 $200 Bilt Cash',
  200, 'credit', NULL, 'cardmember_year', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'bilt-palladium'),
  'lounge', 'Priority Pass 機場貴賓室', 'Priority Pass 會員資格，可帶 2 位來賓免費進入',
  429, 'access', NULL, 'ongoing', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'us-bank-altitude-reserve'),
  'travel_credit', '$325 Travel & Dining Credit', '每年 $325 可用於旅行和餐廳消費折抵',
  325, 'credit', NULL, 'cardmember_year', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'wells-fargo-autograph-journey'),
  'travel_credit', '$50 Flight Credit', '每年 $50 航空消費 credit',
  50, 'credit', NULL, 'cardmember_year', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'bofa-premium-rewards'),
  'travel_credit', '$100 Airline/TSA Credit', '每年 $100 可用於航空附加費或 TSA PreCheck/Global Entry 報銷',
  100, 'credit', NULL, 'cardmember_year', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'barclays-aadvantage-aviator-red'),
  'airline', '免費託運行李', '持卡人及同一訂位旅伴可免費託運第一件行李',
  70, 'waiver', NULL, 'per_flight', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'boa-alaska-atmos-ascent'),
  '航空', '免費託運行李', '持卡人及同一訂位最多 6 位同行者在 Alaska Airlines 和 Hawaiian Airlines 航班免費託運第一件行李',
  35, 'waiver', NULL, 'per_trip', '訂票時確保用此卡付款，同行者需在同一訂位才享有免費行李'
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'boa-alaska-atmos-ascent'),
  '航空', '$99 Companion Fare', '每年續卡後獲得 Companion Fare，可用 $99（+稅）購買同行者機票',
  200, 'fare', NULL, 'cardmember_year', '搭配長途航線使用價值最高，例如西岸到夏威夷的航線'
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'boa-alaska-atmos-summit'),
  '航空', '免費託運行李 + 優先登機', '持卡人及同一訂位最多 6 位同行者免費託運第一件行李，並享有優先登機',
  35, 'waiver', NULL, 'per_trip', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'boa-alaska-atmos-summit'),
  '航空', '25,000 點 Global Companion Award', '每年續卡後獲得 25,000 點 Global Companion Award，可用於兌換同行者機票',
  375, 'award', NULL, 'cardmember_year', '搭配長途國際航線使用價值最高'
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'boa-alaska-atmos-summit'),
  '貴賓室', 'Alaska Lounge 通行證', '每年 8 張 Alaska Lounge 通行證，每季發放 2 張，需搭乘當日 Alaska/Hawaiian/Oneworld 或夥伴航空航班',
  400, 'access', NULL, 'quarterly', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'boa-alaska-atmos-summit'),
  '旅行', 'Global Entry/TSA PreCheck Credit', '每 4 年最高 $120 的 Global Entry 或 TSA PreCheck 申請費 credit',
  30, 'credit', NULL, 'every_4_years', NULL
);

INSERT INTO card_benefits (
  card_id, benefit_category, benefit_name, benefit_description,
  benefit_value, benefit_type, usage_reminder, reset_date_type, recommended_usage
) VALUES (
  (SELECT id FROM credit_cards WHERE slug = 'boa-alaska-atmos-summit'),
  '航空', '航班延誤補償', 'Alaska Airlines 航班取消或延誤超過 2 小時，自動獲得 $50 voucher',
  50, 'voucher', NULL, 'per_incident', NULL
);

-- ============================================================
-- 3. INSERT POINTS PROGRAMS AND TRANSFER PARTNERS
-- ============================================================
-- Delete existing transfer partners and programs for idempotency
DELETE FROM transfer_partners;
DELETE FROM points_programs;

INSERT INTO points_programs (
  program_name, currency_name, base_value_cpp, best_value_cpp, earning_cards
) VALUES (
  'Chase Ultimate Rewards', 'Ultimate Rewards Points', 1, 2, ARRAY['chase-sapphire-preferred', 'chase-sapphire-reserve', 'chase-freedom-unlimited', 'chase-freedom-flex', 'chase-ink-business-preferred', 'chase-ink-business-cash', 'chase-ink-business-unlimited']::text[]
);

INSERT INTO points_programs (
  program_name, currency_name, base_value_cpp, best_value_cpp, earning_cards
) VALUES (
  'Amex Membership Rewards', 'Membership Rewards Points', 1, 2, ARRAY['amex-platinum', 'amex-gold', 'amex-green', 'amex-business-platinum', 'amex-business-gold']::text[]
);

INSERT INTO points_programs (
  program_name, currency_name, base_value_cpp, best_value_cpp, earning_cards
) VALUES (
  'Citi ThankYou Points', 'ThankYou Points', 1, 2, ARRAY['citi-strata-premier', 'citi-double-cash', 'citi-custom-cash']::text[]
);

INSERT INTO points_programs (
  program_name, currency_name, base_value_cpp, best_value_cpp, earning_cards
) VALUES (
  'Capital One Miles', 'Capital One Miles', 1, 1.8, ARRAY['capital-one-venture-x', 'capital-one-venture', 'capital-one-ventureone']::text[]
);

INSERT INTO points_programs (
  program_name, currency_name, base_value_cpp, best_value_cpp, earning_cards
) VALUES (
  'Bilt Points', 'Bilt Points', 1, 2, ARRAY['bilt-blue', 'bilt-obsidian', 'bilt-palladium']::text[]
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Chase Ultimate Rewards'),
  'United Airlines', 'airline',
  1, 1,
  '即時', true, '[{"route":"美國國內經濟艙","points":12500,"value":"$200-400"},{"route":"Excursionist Perk 免費停留","points":0,"value":"$200-500"}]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Chase Ultimate Rewards'),
  'Southwest Airlines', 'airline',
  1, 1,
  '即時', true, '[{"route":"Companion Pass 搭配","points":0,"value":"同行者免費"}]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Chase Ultimate Rewards'),
  'JetBlue', 'airline',
  1, 1,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Chase Ultimate Rewards'),
  'British Airways (Avios)', 'airline',
  1, 1,
  '即時', true, '[{"route":"短途 off-peak 經濟","points":6000,"value":"$100-200"},{"route":"AA 國內短途兌換","points":7500,"value":"$150-300"}]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Chase Ultimate Rewards'),
  'Air France / KLM (Flying Blue)', 'airline',
  1, 1,
  '即時', true, '[{"route":"Promo Rewards 折扣兌換","points":0,"value":"不定期促銷"}]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Chase Ultimate Rewards'),
  'Singapore Airlines (KrisFlyer)', 'airline',
  1, 1,
  '即時', true, '[{"route":"新航商務艙美國到亞洲","points":92000,"value":"$5,000+"}]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Chase Ultimate Rewards'),
  'Virgin Atlantic (Flying Club)', 'airline',
  1, 1,
  '即時', true, '[{"route":"ANA 商務艙單程美日","points":60000,"value":"$3,000-5,000"},{"route":"Delta 國內頭等","points":32500,"value":"$500-800"}]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Chase Ultimate Rewards'),
  'Emirates (Skywards)', 'airline',
  1, 1,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Chase Ultimate Rewards'),
  'Iberia (Avios)', 'airline',
  1, 1,
  '即時', true, '[{"route":"馬德里到歐洲短途商務","points":17000,"value":"$400-800"}]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Chase Ultimate Rewards'),
  'Aer Lingus (Avios)', 'airline',
  1, 1,
  '即時', true, '[{"route":"美國東岸到都柏林 off-peak 經濟","points":13000,"value":"$300-600"}]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Chase Ultimate Rewards'),
  'World of Hyatt', 'hotel',
  1, 1,
  '即時', true, '[{"route":"Cat 1 免費住宿","points":5000,"value":"$100-200"},{"route":"Cat 1-4 免費住宿","points":25000,"value":"$300-500+"},{"route":"All-inclusive resort","points":25000,"value":"$500-1,000"}]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Chase Ultimate Rewards'),
  'Marriott Bonvoy', 'hotel',
  1, 1,
  '1-2 天', false, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Chase Ultimate Rewards'),
  'IHG One Rewards', 'hotel',
  1, 1,
  '即時', true, '[{"route":"IHG 4th Night Free 搭配","points":0,"value":"第四晚免費"}]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Amex Membership Rewards'),
  'Delta SkyMiles', 'airline',
  1, 1,
  '即時', true, '[{"route":"Delta Flash Sales","points":0,"value":"不定期促銷"}]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Amex Membership Rewards'),
  'ANA Mileage Club', 'airline',
  1, 1,
  '2-3 天', false, '[{"route":"商務艙來回日本（淡季）","points":75000,"value":"$5,000+"},{"route":"商務艙來回日本（旺季）","points":90000,"value":"$5,000+"},{"route":"Round the World Ticket","points":145000,"value":"$15,000+"}]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Amex Membership Rewards'),
  'Singapore Airlines (KrisFlyer)', 'airline',
  1, 1,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Amex Membership Rewards'),
  'Virgin Atlantic (Flying Club)', 'airline',
  1, 1,
  '即時', true, '[{"route":"ANA 商務艙單程美日","points":60000,"value":"$3,000-5,000"},{"route":"Delta 國內頭等","points":32500,"value":"$500-800"}]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Amex Membership Rewards'),
  'British Airways (Avios)', 'airline',
  1, 1,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Amex Membership Rewards'),
  'Air France / KLM (Flying Blue)', 'airline',
  1, 1,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Amex Membership Rewards'),
  'Emirates (Skywards)', 'airline',
  1, 1,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Amex Membership Rewards'),
  'Etihad (Guest)', 'airline',
  1, 1,
  '即時', true, '[{"route":"ANA 商務艙美日（替代路線）","points":88000,"value":"$5,000+"}]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Amex Membership Rewards'),
  'JetBlue', 'airline',
  1000, 800,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Amex Membership Rewards'),
  'Cathay Pacific (Asia Miles)', 'airline',
  1, 1,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Amex Membership Rewards'),
  'Hilton Honors', 'hotel',
  1, 2,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Amex Membership Rewards'),
  'Marriott Bonvoy', 'hotel',
  1, 1,
  '1-2 天', false, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Amex Membership Rewards'),
  'Choice Hotels', 'hotel',
  1, 1,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Citi ThankYou Points'),
  'Turkish Airlines (Miles&Smiles)', 'airline',
  1, 1,
  '即時', true, '[{"route":"美國國內經濟艙（Star Alliance）","points":7500,"value":"$150-400"},{"route":"美國到歐洲商務艙","points":45000,"value":"$3,000-6,000"}]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Citi ThankYou Points'),
  'Singapore Airlines (KrisFlyer)', 'airline',
  1, 1,
  '12-24 小時', false, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Citi ThankYou Points'),
  'Virgin Atlantic (Flying Club)', 'airline',
  1, 1,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Citi ThankYou Points'),
  'Air France / KLM (Flying Blue)', 'airline',
  1, 1,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Citi ThankYou Points'),
  'Qatar Airways (Privilege Club)', 'airline',
  1, 1,
  '即時', true, '[{"route":"Qsuite 商務艙美國到中東","points":70000,"value":"$5,000-8,000"}]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Citi ThankYou Points'),
  'Cathay Pacific (Asia Miles)', 'airline',
  1, 1,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Citi ThankYou Points'),
  'JetBlue', 'airline',
  1, 1,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Citi ThankYou Points'),
  'Etihad (Guest)', 'airline',
  1, 1,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Citi ThankYou Points'),
  'Wyndham Rewards', 'hotel',
  1, 1,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Citi ThankYou Points'),
  'Choice Hotels', 'hotel',
  1, 1,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Citi ThankYou Points'),
  'Accor Live Limitless', 'hotel',
  1, 2,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Capital One Miles'),
  'Turkish Airlines (Miles&Smiles)', 'airline',
  1, 1,
  '即時', true, '[{"route":"美國國內經濟艙","points":7500,"value":"$150-400"}]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Capital One Miles'),
  'Air Canada (Aeroplan)', 'airline',
  1, 1,
  '即時', true, '[{"route":"北美到歐洲商務","points":70000,"value":"$3,000-5,000"},{"route":"北美到亞洲商務","points":75000,"value":"$4,000-7,000"}]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Capital One Miles'),
  'Avianca LifeMiles', 'airline',
  1, 1,
  '即時', true, '[{"route":"Star Alliance 商務艙兌換","points":63000,"value":"$3,000-5,000"}]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Capital One Miles'),
  'British Airways (Avios)', 'airline',
  1, 1,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Capital One Miles'),
  'Singapore Airlines (KrisFlyer)', 'airline',
  1, 1,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Capital One Miles'),
  'Cathay Pacific (Asia Miles)', 'airline',
  1, 1,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Capital One Miles'),
  'Finnair (Avios)', 'airline',
  1, 1,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Capital One Miles'),
  'Air France / KLM (Flying Blue)', 'airline',
  1, 1,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Capital One Miles'),
  'TAP Air Portugal', 'airline',
  1, 1,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Capital One Miles'),
  'Emirates (Skywards)', 'airline',
  1, 1,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Capital One Miles'),
  'Etihad (Guest)', 'airline',
  1, 1,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Capital One Miles'),
  'Qantas (Frequent Flyer)', 'airline',
  1, 1,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Capital One Miles'),
  'Wyndham Rewards', 'hotel',
  1, 1,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Capital One Miles'),
  'Accor Live Limitless', 'hotel',
  1, 1,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Capital One Miles'),
  'Choice Hotels', 'hotel',
  1, 1,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Bilt Points'),
  'Air Canada (Aeroplan)', 'airline',
  1, 1,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Bilt Points'),
  'Air France / KLM (Flying Blue)', 'airline',
  1, 1,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Bilt Points'),
  'Alaska Airlines (Atmos Rewards)', 'airline',
  1, 1,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Bilt Points'),
  'Avianca LifeMiles', 'airline',
  1, 1,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Bilt Points'),
  'British Airways (Avios)', 'airline',
  1, 1,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Bilt Points'),
  'Cathay Pacific (Asia Miles)', 'airline',
  1, 1,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Bilt Points'),
  'Emirates (Skywards)', 'airline',
  1, 1,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Bilt Points'),
  'Etihad (Guest)', 'airline',
  1, 1,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Bilt Points'),
  'Iberia (Avios)', 'airline',
  1, 1,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Bilt Points'),
  'JAL Mileage Bank', 'airline',
  1, 1,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Bilt Points'),
  'Qatar Airways (Avios)', 'airline',
  1, 1,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Bilt Points'),
  'Southwest Rapid Rewards', 'airline',
  1, 1,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Bilt Points'),
  'Spirit Free Spirit', 'airline',
  1, 1,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Bilt Points'),
  'TAP Air Portugal', 'airline',
  1, 1,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Bilt Points'),
  'Turkish Airlines (Miles&Smiles)', 'airline',
  1, 1,
  '即時', true, '[{"route":"美國國內經濟艙","points":7500,"value":"$150-400"}]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Bilt Points'),
  'United Airlines (MileagePlus)', 'airline',
  1, 1,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Bilt Points'),
  'Virgin Atlantic (Flying Club)', 'airline',
  1, 1,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Bilt Points'),
  'Accor Live Limitless', 'hotel',
  3, 2,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Bilt Points'),
  'Hilton Honors', 'hotel',
  1, 2,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Bilt Points'),
  'IHG One Rewards', 'hotel',
  1, 1,
  '即時', true, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Bilt Points'),
  'Marriott Bonvoy', 'hotel',
  1, 1,
  '1-2 天', false, '[]'::jsonb
);

INSERT INTO transfer_partners (
  points_program_id, partner_name, partner_type,
  transfer_ratio_from, transfer_ratio_to,
  transfer_time_estimate, is_instant, sweet_spots
) VALUES (
  (SELECT id FROM points_programs WHERE program_name = 'Bilt Points'),
  'World of Hyatt', 'hotel',
  1, 1,
  '即時', true, '[{"route":"Cat 1-4 免費住宿","points":25000,"value":"$300-500+"}]'::jsonb
);

-- ============================================================
-- 4. INSERT SPENDING CATEGORIES
-- ============================================================
DELETE FROM spending_categories;

INSERT INTO spending_categories (
  category_name, category_name_zh, best_card_id, earning_rate,
  runner_up_card_id, runner_up_earning_rate, notes
) VALUES (
  'dining', '餐廳',
  (SELECT id FROM credit_cards WHERE slug = 'amex-gold'),
  '4x MR',
  (SELECT id FROM credit_cards WHERE slug = 'chase-sapphire-reserve'),
  '3x UR', 'Amex Gold 的 4x MR 是餐廳類別最高回饋（年上限 $50,000）。Chase Sapphire Reserve 的 3x UR 搭配 1.5x portal 加值也很強。'
);

INSERT INTO spending_categories (
  category_name, category_name_zh, best_card_id, earning_rate,
  runner_up_card_id, runner_up_earning_rate, notes
) VALUES (
  'groceries', '超市',
  (SELECT id FROM credit_cards WHERE slug = 'amex-blue-cash-preferred'),
  '6% cash back（每年首 $6,000）',
  (SELECT id FROM credit_cards WHERE slug = 'amex-gold'),
  '4x MR（每年首 $25,000）', '如果超市消費不超過 $6,000/年，Blue Cash Preferred 的 6% 最划算。超過 $6,000 或想要轉點彈性，Amex Gold 的 4x MR 更好。'
);

INSERT INTO spending_categories (
  category_name, category_name_zh, best_card_id, earning_rate,
  runner_up_card_id, runner_up_earning_rate, notes
) VALUES (
  'gas', '加油',
  (SELECT id FROM credit_cards WHERE slug = 'citi-custom-cash'),
  '5% cash back / 5x TYP（每月消費最高類別，每週期 $500 上限）',
  (SELECT id FROM credit_cards WHERE slug = 'chase-freedom-flex'),
  '5x UR（季度輪轉，加油季度時）', 'Citi Custom Cash 只要加油是你每月消費最高類別就自動 5%。Freedom Flex 需等到加油的季度輪轉才有 5x。'
);

INSERT INTO spending_categories (
  category_name, category_name_zh, best_card_id, earning_rate,
  runner_up_card_id, runner_up_earning_rate, notes
) VALUES (
  'travel', '旅行',
  (SELECT id FROM credit_cards WHERE slug = 'chase-sapphire-reserve'),
  '4x UR（直接向航空公司/飯店）或 8x UR（透過 Chase Travel）+ $300 旅行 credit + 1.5x portal 加值',
  (SELECT id FROM credit_cards WHERE slug = 'capital-one-venture-x'),
  '2x miles（+ $300 travel credit + 10K anniversary miles）', 'CSR 的 4x UR（直接購票）或 8x UR（透過 Chase Travel）+ 1.5x portal 加值是旅行最強組合。Venture X 的等效年費更低（$395 - $300 credit - $100 anniversary = -$5）。'
);

INSERT INTO spending_categories (
  category_name, category_name_zh, best_card_id, earning_rate,
  runner_up_card_id, runner_up_earning_rate, notes
) VALUES (
  'online_shopping', '網購',
  (SELECT id FROM credit_cards WHERE slug = 'chase-amazon-prime-visa'),
  '5% cash back（Amazon + Whole Foods，需 Prime 會員）',
  (SELECT id FROM credit_cards WHERE slug = 'chase-freedom-flex'),
  '5x UR（季度輪轉，網購季度時）', 'Amazon Prime Visa 專攻 Amazon 購物。其他網購平台可等 Freedom Flex 的季度輪轉或用 BofA Customized Cash（自選網購 3%）。'
);

INSERT INTO spending_categories (
  category_name, category_name_zh, best_card_id, earning_rate,
  runner_up_card_id, runner_up_earning_rate, notes
) VALUES (
  'streaming', '串流訂閱',
  (SELECT id FROM credit_cards WHERE slug = 'amex-gold'),
  '4x MR',
  (SELECT id FROM credit_cards WHERE slug = 'chase-sapphire-preferred'),
  '3x UR', 'Amex Gold 和 CSP 都將串流服務列為高回饋類別。Amex Platinum 另有 $240 entertainment credit 可直接折抵。'
);

INSERT INTO spending_categories (
  category_name, category_name_zh, best_card_id, earning_rate,
  runner_up_card_id, runner_up_earning_rate, notes
) VALUES (
  'drugstores', '藥局',
  (SELECT id FROM credit_cards WHERE slug = 'chase-freedom-unlimited'),
  '3x UR',
  (SELECT id FROM credit_cards WHERE slug = 'chase-freedom-flex'),
  '3x UR', 'Chase Freedom 系列都提供藥局 3x UR。搭配 Sapphire 卡可提升 UR 價值到 1.25-1.5 cents/point。'
);

INSERT INTO spending_categories (
  category_name, category_name_zh, best_card_id, earning_rate,
  runner_up_card_id, runner_up_earning_rate, notes
) VALUES (
  'rent', '房租',
  (SELECT id FROM credit_cards WHERE slug = 'bilt-blue'),
  '最高 1.25x Bilt Points（無手續費，依每月非房租消費分級）',
  (SELECT id FROM credit_cards WHERE slug = 'bilt-palladium'),
  '最高 1.25x Bilt Points + 所有消費 2x', 'Bilt 是唯一可以用信用卡付房租和房貸且不收手續費的卡系列。Bilt Blue 無年費適合入門，Bilt Palladium $495 年費但所有消費 2x 且附帶大量 credit。房租點數依每月非房租消費比例分級。'
);

INSERT INTO spending_categories (
  category_name, category_name_zh, best_card_id, earning_rate,
  runner_up_card_id, runner_up_earning_rate, notes
) VALUES (
  'general', '一般消費',
  (SELECT id FROM credit_cards WHERE slug = 'citi-double-cash'),
  '2% cash back / 2x TYP',
  (SELECT id FROM credit_cards WHERE slug = 'wells-fargo-active-cash'),
  '2% cash back', 'Citi Double Cash 和 Wells Fargo Active Cash 都是 2% 無年費現金回饋卡。Double Cash 可轉為 TYP 搭配 Strata Premier 轉點，價值更高。'
);

-- ============================================================
-- 5. INSERT CARD COMBOS
-- ============================================================
DELETE FROM card_combos;

INSERT INTO card_combos (
  combo_name, description, card_ids, total_annual_fee,
  estimated_annual_value, target_audience, pros, cons
) VALUES (
  'Chase Trifecta（旗艦版）', 'Chase Sapphire Reserve + Freedom Unlimited + Freedom Flex 的經典三卡組合。CSR 提供 3x 旅行餐廳和 1.5x portal 加值，CFU 負責一般消費 1.5x，CFF 負責季度輪轉 5x。所有 UR 點數集中到 CSR 後轉點或加值。',
  (SELECT ARRAY_AGG(id ORDER BY array_position(ARRAY['chase-sapphire-reserve', 'chase-freedom-unlimited', 'chase-freedom-flex']::text[], slug)) FROM credit_cards WHERE slug = ANY(ARRAY['chase-sapphire-reserve', 'chase-freedom-unlimited', 'chase-freedom-flex']::text[])),
  795, 1500, '中高消費旅行者，年消費 $30,000+ 且經常旅行',
  ARRAY['所有消費都有高回饋覆蓋', 'UR 點數可轉到 Hyatt/United 等夥伴，價值 1.5-2 cpp', '$300 旅行 credit 降低實際年費', 'Priority Pass 貴賓室', '旅行保險完善（延誤 2 小時即觸發）', 'CFU 和 CFF 無年費，只有 CSR 有年費']::text[], ARRAY['CSR 年費 $795 較高', '需要有 Chase 銀行關係或較高收入', '受 Chase 5/24 限制']::text[]
);

INSERT INTO card_combos (
  combo_name, description, card_ids, total_annual_fee,
  estimated_annual_value, target_audience, pros, cons
) VALUES (
  'Chase Trifecta（小資版）', 'Chase Sapphire Preferred + Freedom Unlimited + Freedom Flex。和旗艦版相同邏輯，但用 CSP 取代 CSR 大幅降低年費。CSP 提供 1.25x portal 加值和轉點能力。',
  (SELECT ARRAY_AGG(id ORDER BY array_position(ARRAY['chase-sapphire-preferred', 'chase-freedom-unlimited', 'chase-freedom-flex']::text[], slug)) FROM credit_cards WHERE slug = ANY(ARRAY['chase-sapphire-preferred', 'chase-freedom-unlimited', 'chase-freedom-flex']::text[])),
  95, 1000, '中等消費者，想要點數彈性但不想付高年費',
  ARRAY['年費只有 $95，入門門檻低', '依然享有 UR 轉點能力', 'CSP 開卡禮 60K UR 價值 $750+', '餐廳/超市 3x、季度輪轉 5x', '適合初入點數世界的新手']::text[], ARRAY['CSP 的 portal 加值只有 1.25x（CSR 是 1.5x）', '沒有貴賓室、旅行 credit', '旅行延誤保險門檻是 6 小時（CSR 是 2 小時）']::text[]
);

INSERT INTO card_combos (
  combo_name, description, card_ids, total_annual_fee,
  estimated_annual_value, target_audience, pros, cons
) VALUES (
  'Amex 雙持（Platinum + Gold）', 'Amex Platinum 負責航班 5x 和各種 credit 回收，Amex Gold 負責餐廳超市 4x。兩張 Charge Card 不受 5 credit card limit 限制。搭配轉點到 ANA/Virgin Atlantic 等夥伴。',
  (SELECT ARRAY_AGG(id ORDER BY array_position(ARRAY['amex-platinum', 'amex-gold']::text[], slug)) FROM credit_cards WHERE slug = ANY(ARRAY['amex-platinum', 'amex-gold']::text[])),
  1220, 2500, '高消費旅行者，年消費 $50,000+，善用 credit 回收',
  ARRAY['餐廳超市 4x MR 是市場最高', '航班 5x MR', 'Platinum 大量 credit 回收：$600 hotel + $200 airline + $200 Uber + $300 entertainment + $209 CLEAR+ + $400 Resy + $300 lululemon', 'Gold 的 $120 dining + $120 Uber + $84 Dunkin'' + $100 Resy credit', 'Centurion Lounge + Priority Pass', 'MR 轉 ANA 可兌換超值商務艙機票']::text[], ARRAY['年費合計 $1,220 很高', '需要認真使用所有 credit 才能回本', 'Amex 在部分商店不被接受', 'Pop-up 風險可能拿不到開卡禮']::text[]
);

INSERT INTO card_combos (
  combo_name, description, card_ids, total_annual_fee,
  estimated_annual_value, target_audience, pros, cons
) VALUES (
  '旅行極大化組合', 'Chase Sapphire Reserve + Amex Gold + Capital One Venture X 三大體系全覆蓋。CSR 負責旅行和 UR 轉點，Amex Gold 負責餐廳超市和 MR 轉點，Venture X 提供 2x 一般消費和 Capital One 轉點。三套點數體系覆蓋所有夥伴。',
  (SELECT ARRAY_AGG(id ORDER BY array_position(ARRAY['chase-sapphire-reserve', 'amex-gold', 'capital-one-venture-x']::text[], slug)) FROM credit_cards WHERE slug = ANY(ARRAY['chase-sapphire-reserve', 'amex-gold', 'capital-one-venture-x']::text[])),
  1515, 3000, '點數玩家、頻繁旅行者，年消費 $60,000+',
  ARRAY['三大點數體系完整覆蓋：UR + MR + Capital One Miles', '幾乎所有航空和飯店夥伴都能轉到', '每個消費類別都有最佳回饋卡', '三個貴賓室體系：Priority Pass + Centurion + Capital One Lounge', 'Venture X 等效年費接近 $0']::text[], ARRAY['名目年費合計 $1,515', '需要管理三個點數帳戶', '需要很高的消費量才能回本', '同時管理多張卡較複雜']::text[]
);

INSERT INTO card_combos (
  combo_name, description, card_ids, total_annual_fee,
  estimated_annual_value, target_audience, pros, cons
) VALUES (
  '無年費超值組合', 'Chase Freedom Unlimited + Chase Freedom Flex + Citi Double Cash + Bilt Blue Card。完全無年費，覆蓋所有主要消費類別。CFU 一般消費 1.5%，CFF 季度輪轉 5x，Double Cash 備用 2%，Bilt Blue 付房租。',
  (SELECT ARRAY_AGG(id ORDER BY array_position(ARRAY['chase-freedom-unlimited', 'chase-freedom-flex', 'citi-double-cash', 'bilt-blue']::text[], slug)) FROM credit_cards WHERE slug = ANY(ARRAY['chase-freedom-unlimited', 'chase-freedom-flex', 'citi-double-cash', 'bilt-blue']::text[])),
  0, 600, '不想付年費的實用主義者、學生或新手',
  ARRAY['完全無年費', '季度輪轉 5x + 餐廳藥局 3x + 一般 1.5-2%', 'Bilt 付房租賺點數', '日後升級 Sapphire 卡即可解鎖 UR 轉點', 'Citi Double Cash 可搭配 Strata Premier 轉 TYP', '適合建立信用歷史']::text[], ARRAY['沒有轉點能力（除非加辦 Sapphire 或 Strata Premier）', '沒有旅行保險和貴賓室', 'CFU/CFF 有 3% 外幣交易手續費', '回饋以現金為主，較難獲得超高價值兌換']::text[]
);

INSERT INTO card_combos (
  combo_name, description, card_ids, total_annual_fee,
  estimated_annual_value, target_audience, pros, cons
) VALUES (
  '飯店控終極組合', 'World of Hyatt + Hilton Aspire + Marriott Bonvoy Brilliant 三大飯店體系全覆蓋。每張卡都有年度 Free Night，加上頂級會員身份。適合每年住飯店 30+ 晚的旅客。',
  (SELECT ARRAY_AGG(id ORDER BY array_position(ARRAY['chase-world-of-hyatt', 'amex-hilton-aspire', 'amex-marriott-bonvoy-brilliant']::text[], slug)) FROM credit_cards WHERE slug = ANY(ARRAY['chase-world-of-hyatt', 'amex-hilton-aspire', 'amex-marriott-bonvoy-brilliant']::text[])),
  1295, 3000, '飯店愛好者、經常出差住飯店、追求升等和頂級體驗',
  ARRAY['三大飯店體系頂級會員：Hyatt Discoverist + Hilton Diamond + Marriott Platinum Elite', '每年至少 3 晚 Free Night（Hyatt Cat 1-4 + Hilton 無限制 + Marriott 85K）', 'Hilton Diamond 和 Marriott Platinum 享免費早餐和房型升等', 'Hilton Aspire $250 resort credit + $250 airline credit', 'Marriott Brilliant $300 Marriott credit', '飯店消費超高回饋：Hyatt 4x、Hilton 14x、Marriott 6x']::text[], ARRAY['年費合計 $1,295 非常高', '兩張 Amex 卡佔用 5 card limit 中的 2 個名額', '需要大量飯店消費才能回本', '如果不常住飯店，Free Night 可能用不完']::text[]
);

COMMIT;
