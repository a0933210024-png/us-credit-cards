import { supabase, isSupabaseConfigured } from "@/lib/supabase";
import type { CreditCard } from "@/lib/types";
import fs from "fs";
import path from "path";

const DATA_DIR = path.join(process.cwd(), "src", "data");

function loadAllCardsFromJSON(): CreditCard[] {
  const files = [
    "chase-cards.json",
    "amex-cards.json",
    "citi-cards.json",
    "capital-one-cards.json",
    "other-cards.json",
  ];

  const allCards: CreditCard[] = [];

  for (const file of files) {
    const filePath = path.join(DATA_DIR, file);
    try {
      if (fs.existsSync(filePath)) {
        const raw = fs.readFileSync(filePath, "utf-8");
        const cards: CreditCard[] = JSON.parse(raw);
        allCards.push(
          ...cards.map((c, i) => ({
            ...c,
            id: c.id || `${file}-${i}`,
            is_active: c.is_active ?? true,
          }))
        );
      }
    } catch {
      // Skip files that can't be read
    }
  }

  return allCards;
}

export async function getAllCards(): Promise<CreditCard[]> {
  if (isSupabaseConfigured && supabase) {
    const { data, error } = await supabase
      .from("credit_cards")
      .select("*")
      .eq("is_active", true)
      .order("card_name");
    if (!error && data) return data as CreditCard[];
  }

  return loadAllCardsFromJSON().filter((c) => c.is_active !== false);
}

export async function getCardBySlug(
  slug: string
): Promise<CreditCard | null> {
  if (isSupabaseConfigured && supabase) {
    const { data, error } = await supabase
      .from("credit_cards")
      .select("*, card_benefits(*)")
      .eq("slug", slug)
      .single();
    if (!error && data) {
      return { ...data, benefits: data.card_benefits } as CreditCard;
    }
  }

  const allCards = loadAllCardsFromJSON();
  return allCards.find((c) => c.slug === slug) || null;
}

export async function getCardsByIssuer(
  issuer: string
): Promise<CreditCard[]> {
  if (isSupabaseConfigured && supabase) {
    const { data, error } = await supabase
      .from("credit_cards")
      .select("*")
      .eq("issuer", issuer)
      .eq("is_active", true)
      .order("card_name");
    if (!error && data) return data as CreditCard[];
  }

  return loadAllCardsFromJSON().filter(
    (c) => c.issuer === issuer && c.is_active !== false
  );
}

export async function searchCards(query: string): Promise<CreditCard[]> {
  const q = query.toLowerCase();

  if (isSupabaseConfigured && supabase) {
    const { data, error } = await supabase
      .from("credit_cards")
      .select("*")
      .eq("is_active", true)
      .or(`card_name.ilike.%${q}%,issuer.ilike.%${q}%`)
      .order("card_name")
      .limit(20);
    if (!error && data) return data as CreditCard[];
  }

  const allCards = loadAllCardsFromJSON();
  return allCards.filter(
    (c) =>
      c.is_active !== false &&
      (c.card_name.toLowerCase().includes(q) ||
        c.issuer.toLowerCase().includes(q) ||
        c.key_benefits?.some((b) => b.toLowerCase().includes(q)))
  );
}

export async function getRelatedCards(
  issuer: string,
  excludeSlug: string
): Promise<CreditCard[]> {
  if (isSupabaseConfigured && supabase) {
    const { data, error } = await supabase
      .from("credit_cards")
      .select("*")
      .eq("issuer", issuer)
      .eq("is_active", true)
      .neq("slug", excludeSlug)
      .limit(3);
    if (!error && data) return data as CreditCard[];
  }

  return loadAllCardsFromJSON()
    .filter((c) => c.issuer === issuer && c.slug !== excludeSlug && c.is_active !== false)
    .slice(0, 3);
}
