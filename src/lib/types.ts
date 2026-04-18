// ============================================================
// Database Table Types
// ============================================================

export interface CreditCard {
  id: string;
  slug: string;
  issuer: string;
  card_name: string;
  card_network: string;
  annual_fee: number;
  annual_fee_waived_first_year: boolean;
  signup_bonus_description: string;
  signup_bonus_value_estimate: number;
  signup_bonus_spend_requirement: number;
  signup_bonus_time_limit_months: number;
  earning_rates: Record<string, string>;
  key_benefits: string[];
  application_rules: ApplicationRules;
  foreign_transaction_fee: number;
  credit_score_recommended: string;
  card_image_url?: string;
  apply_url?: string;
  is_active: boolean;
  // Product status — more granular than is_active
  // "active"             : open to new applicants
  // "closed_to_new"      : existing holders keep card, no new apps accepted
  // "discontinued"       : fully ended / auto-converted
  // "issuer_transition"  : e.g. Apple Card moving Goldman → Chase
  status?: "active" | "closed_to_new" | "discontinued" | "issuer_transition";
  status_note?: string;
  // Freshness tracking — enables staleness checks and automated refresh
  last_verified_at?: string; // ISO date, e.g. "2026-04-17"
  offer_expires_at?: string; // ISO date when current signup bonus expires
  issuer_url?: string;       // canonical product page, used for re-fetch
  created_at?: string;
  updated_at?: string;
  // Joined data
  benefits?: CardBenefit[];
}

export interface ApplicationRules {
  rule_name: string;
  description: string;
  [key: string]: string;
}

export interface CardBenefit {
  id?: string;
  card_id?: string;
  benefit_category: string;
  benefit_name: string;
  benefit_description: string;
  benefit_value: number;
  benefit_type: string;
  usage_reminder?: string;
  reset_date_type?: string;
  recommended_usage?: string;
}

export interface PointsProgram {
  id: string;
  program_name: string;
  currency_name: string;
  base_value_cpp: number;
  best_value_cpp: number;
  earning_cards: string[];
}

export interface TransferPartner {
  id?: string;
  points_program_id?: string;
  points_program?: string;
  partner_name: string;
  partner_type: string;
  transfer_ratio_from: number;
  transfer_ratio_to: number;
  transfer_time_estimate: string;
  is_instant: boolean;
  sweet_spots?: SweetSpotRef[];
}

export interface SweetSpotRef {
  route: string;
  points: number;
  value: string;
}

export interface SweetSpot {
  id?: string;
  points_program: string;
  transfer_to: string;
  route_name: string;
  points_required: number;
  estimated_cash_value: number;
  cpp_value: number;
  description: string;
  best_for: string;
  difficulty: "easy" | "medium" | "hard";
  tips: string;
}

export interface SpendingCategory {
  id?: string;
  category_name: string;
  category_name_zh: string;
  best_card_slug: string;
  best_card_name: string;
  earning_rate: string;
  runner_up_card_slug?: string;
  runner_up_card_name?: string;
  runner_up_earning_rate?: string;
  notes?: string;
}

export interface NewsUpdate {
  id: string;
  title: string;
  summary: string;
  source_url?: string;
  source_name?: string;
  category: string;
  related_card_ids?: string[];
  published_at: string;
  created_at?: string;
}

export interface CardCombo {
  id?: string;
  combo_name: string;
  description: string;
  card_slugs: string[];
  card_names: string[];
  total_annual_fee: number;
  estimated_annual_value: number;
  target_audience: string;
  pros: string[];
  cons: string[];
}

// ============================================================
// Filter & UI Types
// ============================================================

export type CardType = "all" | "personal" | "business";

export interface CardFilters {
  issuers: string[];
  networks: string[];
  maxAnnualFee: number;
  searchQuery: string;
  hasNoAnnualFee?: boolean;
  cardType: CardType;
}

export type SortOption =
  | "annual_fee_asc"
  | "annual_fee_desc"
  | "signup_bonus_desc"
  | "card_name_asc";

export interface CardSortConfig {
  field: SortOption;
  label: string;
}
