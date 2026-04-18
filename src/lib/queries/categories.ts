import { supabase, isSupabaseConfigured } from "@/lib/supabase";
import type { SpendingCategory } from "@/lib/types";
import fs from "fs";
import path from "path";

const DATA_DIR = path.join(process.cwd(), "src", "data");

export async function getAllSpendingCategories(): Promise<SpendingCategory[]> {
  if (isSupabaseConfigured && supabase) {
    const { data, error } = await supabase
      .from("spending_categories")
      .select("*")
      .order("category_name");
    if (!error && data) return data as SpendingCategory[];
  }

  const filePath = path.join(DATA_DIR, "spending-categories.json");
  try {
    if (fs.existsSync(filePath)) {
      const raw = fs.readFileSync(filePath, "utf-8");
      return JSON.parse(raw) as SpendingCategory[];
    }
  } catch {
    // Skip
  }

  return [];
}
