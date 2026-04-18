import { supabase, isSupabaseConfigured } from "@/lib/supabase";
import type { NewsUpdate } from "@/lib/types";

export async function getAllNews(): Promise<NewsUpdate[]> {
  if (isSupabaseConfigured && supabase) {
    const { data, error } = await supabase
      .from("news_updates")
      .select("*")
      .order("published_at", { ascending: false });
    if (!error && data) return data as NewsUpdate[];
  }

  // No news JSON file by default
  return [];
}

export async function getNewsByCategory(
  category: string
): Promise<NewsUpdate[]> {
  if (isSupabaseConfigured && supabase) {
    const { data, error } = await supabase
      .from("news_updates")
      .select("*")
      .eq("category", category)
      .order("published_at", { ascending: false });
    if (!error && data) return data as NewsUpdate[];
  }

  return [];
}
