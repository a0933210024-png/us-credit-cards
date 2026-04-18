import { supabase, isSupabaseConfigured } from "@/lib/supabase";
import type { CardCombo } from "@/lib/types";
import fs from "fs";
import path from "path";

const DATA_DIR = path.join(process.cwd(), "src", "data");

export async function getAllCombos(): Promise<CardCombo[]> {
  if (isSupabaseConfigured && supabase) {
    const { data, error } = await supabase
      .from("card_combos")
      .select("*")
      .order("combo_name");
    if (!error && data) return data as CardCombo[];
  }

  const filePath = path.join(DATA_DIR, "card-combos.json");
  try {
    if (fs.existsSync(filePath)) {
      const raw = fs.readFileSync(filePath, "utf-8");
      return JSON.parse(raw) as CardCombo[];
    }
  } catch {
    // Skip
  }

  return [];
}
