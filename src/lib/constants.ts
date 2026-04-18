export const ISSUERS = [
  "Chase",
  "American Express",
  "Citi",
  "Capital One",
  "US Bank",
  "Wells Fargo",
  "Barclays",
  "Bank of America",
  "Bilt",
  "Apple / Goldman Sachs",
] as const;

export const CARD_NETWORKS = ["Visa", "Mastercard", "American Express"] as const;

export const BENEFIT_CATEGORIES = [
  { key: "travel", label: "Travel" },
  { key: "travel_credit", label: "Travel Credit" },
  { key: "airline", label: "Airline" },
  { key: "airline_credit", label: "Airline Credit" },
  { key: "hotel", label: "Hotel" },
  { key: "hotel_credit", label: "Hotel Credit" },
  { key: "lounge", label: "Lounge" },
  { key: "dining", label: "Dining" },
  { key: "dining_credit", label: "Dining Credit" },
  { key: "rideshare", label: "Rideshare" },
  { key: "shopping", label: "Shopping" },
  { key: "entertainment", label: "Entertainment" },
  { key: "streaming", label: "Streaming" },
  { key: "membership", label: "Membership" },
  { key: "insurance", label: "Insurance" },
  { key: "miles", label: "Miles" },
  { key: "other", label: "Other" },
] as const;

export const SPENDING_CATEGORIES = [
  { key: "dining", label: "餐廳" },
  { key: "groceries", label: "超市" },
  { key: "gas", label: "加油" },
  { key: "travel", label: "旅行" },
  { key: "online_shopping", label: "網購" },
  { key: "streaming", label: "串流" },
  { key: "pharmacy", label: "藥局" },
  { key: "rent", label: "房租" },
  { key: "general", label: "一般消費" },
] as const;

export const POINTS_PROGRAMS = [
  {
    key: "chase_ur",
    name: "Chase Ultimate Rewards",
    short: "Chase UR",
    currency: "Ultimate Rewards",
  },
  {
    key: "amex_mr",
    name: "Amex Membership Rewards",
    short: "Amex MR",
    currency: "Membership Rewards",
  },
  {
    key: "citi_typ",
    name: "Citi ThankYou Points",
    short: "Citi TYP",
    currency: "ThankYou Points",
  },
  {
    key: "capital_one",
    name: "Capital One Miles",
    short: "C1 Miles",
    currency: "Miles",
  },
  {
    key: "bilt",
    name: "Bilt Rewards",
    short: "Bilt Points",
    currency: "Bilt Points",
  },
] as const;

export const NEWS_CATEGORIES = [
  { key: "signup_bonus_change", label: "開卡禮變動" },
  { key: "new_card", label: "新卡發行" },
  { key: "benefit_change", label: "福利變動" },
  { key: "devaluation", label: "點數貶值" },
  { key: "limited_offer", label: "限時優惠" },
] as const;

export const COLORS = {
  primary: "#1a365d",
  accent: "#c9a84c",
  primaryLight: "#2a4a7f",
  primaryDark: "#0f2341",
  accentLight: "#d4b76a",
  background: "#ffffff",
  backgroundDark: "#0f172a",
} as const;

export const ISSUER_COLORS: Record<string, string> = {
  Chase: "#0f4c81",
  "American Express": "#006fcf",
  Amex: "#006fcf",
  Citi: "#003b70",
  "Capital One": "#d03027",
  "US Bank": "#c62828",
  "Wells Fargo": "#c81632",
  Barclays: "#00aeef",
  "Bank of America": "#e31837",
  "Apple / Goldman Sachs": "#333333",
  Apple: "#333333",
  Bilt: "#000000",
};

export const CPP_THRESHOLDS = {
  excellent: 2.0,
  good: 1.5,
  fair: 1.0,
} as const;
