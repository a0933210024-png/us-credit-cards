import { supabase, isSupabaseConfigured } from "@/lib/supabase";
import type { CardBenefit } from "@/lib/types";

export async function getBenefitsByCardId(
  cardId: string
): Promise<CardBenefit[]> {
  if (isSupabaseConfigured && supabase) {
    const { data, error } = await supabase
      .from("card_benefits")
      .select("*")
      .eq("card_id", cardId)
      .order("benefit_category");
    if (!error && data) return data as CardBenefit[];
  }

  // JSON fallback: benefits are embedded in card data, no separate file
  return [];
}

export async function getAllBenefits(): Promise<CardBenefit[]> {
  if (isSupabaseConfigured && supabase) {
    const { data, error } = await supabase
      .from("card_benefits")
      .select("*")
      .order("benefit_category");
    if (!error && data) return data as CardBenefit[];
  }

  return [];
}

export async function getBenefitsByCategory(
  category: string
): Promise<CardBenefit[]> {
  if (isSupabaseConfigured && supabase) {
    const { data, error } = await supabase
      .from("card_benefits")
      .select("*")
      .eq("benefit_category", category)
      .order("benefit_name");
    if (!error && data) return data as CardBenefit[];
  }

  return [];
}
