import { supabase, isSupabaseConfigured } from "@/lib/supabase";
import type { PointsProgram, TransferPartner, SweetSpot } from "@/lib/types";
import fs from "fs";
import path from "path";

const DATA_DIR = path.join(process.cwd(), "src", "data");

function loadJSON<T>(filename: string): T[] {
  const filePath = path.join(DATA_DIR, filename);
  try {
    if (fs.existsSync(filePath)) {
      const raw = fs.readFileSync(filePath, "utf-8");
      return JSON.parse(raw) as T[];
    }
  } catch {
    // Skip
  }
  return [];
}

export async function getAllPrograms(): Promise<PointsProgram[]> {
  if (isSupabaseConfigured && supabase) {
    const { data, error } = await supabase
      .from("points_programs")
      .select("*")
      .order("program_name");
    if (!error && data) return data as PointsProgram[];
  }

  // No dedicated programs JSON - derive from transfer-partners if available
  return [];
}

export async function getTransferPartners(): Promise<TransferPartner[]> {
  if (isSupabaseConfigured && supabase) {
    const { data, error } = await supabase
      .from("transfer_partners")
      .select("*, points_programs(program_name)")
      .order("partner_name");
    if (!error && data) {
      return data.map((d) => ({
        ...d,
        points_program: (d.points_programs as { program_name: string } | null)
          ?.program_name,
      })) as TransferPartner[];
    }
  }

  return loadJSON<TransferPartner>("transfer-partners.json");
}

export async function getSweetSpots(): Promise<SweetSpot[]> {
  if (isSupabaseConfigured && supabase) {
    const { data, error } = await supabase
      .from("sweet_spots")
      .select("*")
      .order("cpp_value", { ascending: false });
    if (!error && data) return data as SweetSpot[];
  }

  return loadJSON<SweetSpot>("sweet-spots.json");
}
