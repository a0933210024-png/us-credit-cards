import { createClient } from "@supabase/supabase-js";
import * as fs from "fs";
import * as path from "path";

// ============================================================
// Configuration
// ============================================================

const SUPABASE_URL = process.env.SUPABASE_URL;
const SUPABASE_SERVICE_ROLE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!SUPABASE_URL || !SUPABASE_SERVICE_ROLE_KEY) {
  console.error(
    "Error: SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY environment variables are required."
  );
  console.error("Usage: SUPABASE_URL=... SUPABASE_SERVICE_ROLE_KEY=... npx tsx src/scripts/seed.ts");
  process.exit(1);
}

const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY);

// ============================================================
// Types for seed data
// ============================================================

/* eslint-disable @typescript-eslint/no-explicit-any */
type SeedCard = Record<string, any>;
type SeedBenefit = Record<string, any>;
type SeedProgram = Record<string, any>;
type SeedCategory = Record<string, any>;
type SeedCombo = Record<string, any>;
/* eslint-enable @typescript-eslint/no-explicit-any */

// ============================================================
// Helper Functions
// ============================================================

function readJSON<T>(filename: string): T {
  const filePath = path.join(__dirname, "..", "data", filename);
  const raw = fs.readFileSync(filePath, "utf-8");
  return JSON.parse(raw) as T;
}

async function upsertCards(cards: SeedCard[]) {
  const allBenefits: SeedBenefit[] = [];

  for (const card of cards) {
    const benefits = card.benefits || [];
    delete card.benefits;

    // Upsert the card
    const { data, error } = await supabase
      .from("credit_cards")
      .upsert(card, { onConflict: "slug" })
      .select("id, slug")
      .single();

    if (error) {
      console.error(`Error upserting card ${card.slug}:`, error.message);
      continue;
    }

    console.log(`  ✓ ${card.card_name} (${data.id})`);

    // Collect benefits with card_id
    for (const benefit of benefits) {
      allBenefits.push({
        ...benefit,
        card_id: data.id,
      });
    }
  }

  return allBenefits;
}

// ============================================================
// Seed Functions
// ============================================================

async function seedCreditCards() {
  console.log("\n--- Seeding Credit Cards ---");

  const chaseCards = readJSON<SeedCard[]>("chase-cards.json");
  const amexCards = readJSON<SeedCard[]>("amex-cards.json");
  const citiCards = readJSON<SeedCard[]>("citi-cards.json");
  const capitalOneCards = readJSON<SeedCard[]>("capital-one-cards.json");
  const otherCards = readJSON<SeedCard[]>("other-cards.json");

  console.log("\nChase Cards:");
  const chaseBenefits = await upsertCards(chaseCards);

  console.log("\nAmex Cards:");
  const amexBenefits = await upsertCards(amexCards);

  console.log("\nCiti Cards:");
  const citiBenefits = await upsertCards(citiCards);

  console.log("\nCapital One Cards:");
  const capitalOneBenefits = await upsertCards(capitalOneCards);

  console.log("\nOther Cards:");
  const otherBenefits = await upsertCards(otherCards);

  const allBenefits = [
    ...chaseBenefits,
    ...amexBenefits,
    ...citiBenefits,
    ...capitalOneBenefits,
    ...otherBenefits,
  ];

  return allBenefits;
}

async function seedCardBenefits(benefits: SeedBenefit[]) {
  console.log("\n--- Seeding Card Benefits ---");

  if (benefits.length === 0) {
    console.log("  No benefits to seed.");
    return;
  }

  // Delete existing benefits first (to avoid duplicates on re-seed)
  const { error: deleteError } = await supabase
    .from("card_benefits")
    .delete()
    .neq("id", "00000000-0000-0000-0000-000000000000"); // delete all

  if (deleteError) {
    console.error("Error clearing existing benefits:", deleteError.message);
  }

  // Insert all benefits
  const { error } = await supabase.from("card_benefits").insert(benefits);

  if (error) {
    console.error("Error inserting benefits:", error.message);
  } else {
    console.log(`  ✓ Inserted ${benefits.length} benefits`);
  }
}

async function seedPointsPrograms() {
  console.log("\n--- Seeding Points Programs & Transfer Partners ---");

  const data = readJSON<{ programs: SeedProgram[] }>("transfer-partners.json");

  for (const program of data.programs) {
    const partners = program.partners || [];
    delete program.partners;

    // Upsert the program
    const { data: progData, error: progError } = await supabase
      .from("points_programs")
      .upsert(program, { onConflict: "program_name" })
      .select("id, program_name")
      .single();

    if (progError) {
      console.error(
        `Error upserting program ${program.program_name}:`,
        progError.message
      );
      continue;
    }

    console.log(`\n  ✓ Program: ${progData.program_name}`);

    // Delete existing partners for this program
    await supabase
      .from("transfer_partners")
      .delete()
      .eq("points_program_id", progData.id);

    // Insert partners
    const partnersWithProgramId = partners.map((p: SeedProgram) => ({
      ...p,
      points_program_id: progData.id,
    }));

    if (partnersWithProgramId.length > 0) {
      const { error: partnerError } = await supabase
        .from("transfer_partners")
        .insert(partnersWithProgramId);

      if (partnerError) {
        console.error(
          `  Error inserting partners for ${program.program_name}:`,
          partnerError.message
        );
      } else {
        console.log(
          `    ✓ Inserted ${partnersWithProgramId.length} transfer partners`
        );
      }
    }
  }
}

async function seedSpendingCategories() {
  console.log("\n--- Seeding Spending Categories ---");

  const categories = readJSON<SeedCategory[]>("spending-categories.json");

  for (const cat of categories) {
    // Look up card IDs by slug
    let best_card_id = null;
    let runner_up_card_id = null;

    if (cat.best_card_slug) {
      const { data } = await supabase
        .from("credit_cards")
        .select("id")
        .eq("slug", cat.best_card_slug)
        .single();
      best_card_id = data?.id || null;
    }

    if (cat.runner_up_card_slug) {
      const { data } = await supabase
        .from("credit_cards")
        .select("id")
        .eq("slug", cat.runner_up_card_slug)
        .single();
      runner_up_card_id = data?.id || null;
    }

    const row = {
      category_name: cat.category_name,
      category_name_zh: cat.category_name_zh,
      best_card_id,
      earning_rate: cat.earning_rate,
      runner_up_card_id,
      runner_up_earning_rate: cat.runner_up_earning_rate || null,
      notes: cat.notes || null,
    };

    const { error } = await supabase
      .from("spending_categories")
      .upsert(row, { onConflict: "category_name" })
      .select()
      .single();

    if (error) {
      // If upsert with onConflict fails (no unique constraint), try delete + insert
      await supabase
        .from("spending_categories")
        .delete()
        .eq("category_name", cat.category_name);
      const { error: insertError } = await supabase
        .from("spending_categories")
        .insert(row);
      if (insertError) {
        console.error(
          `  Error seeding category ${cat.category_name}:`,
          insertError.message
        );
        continue;
      }
    }

    console.log(`  ✓ ${cat.category_name_zh} (${cat.category_name})`);
  }
}

async function seedCardCombos() {
  console.log("\n--- Seeding Card Combos ---");

  const combos = readJSON<SeedCombo[]>("card-combos.json");

  // Delete existing combos
  await supabase
    .from("card_combos")
    .delete()
    .neq("id", "00000000-0000-0000-0000-000000000000");

  for (const combo of combos) {
    // Look up card IDs by slugs
    const cardIds: string[] = [];
    for (const slug of combo.card_slugs) {
      const { data } = await supabase
        .from("credit_cards")
        .select("id")
        .eq("slug", slug)
        .single();
      if (data) cardIds.push(data.id);
    }

    const row = {
      combo_name: combo.combo_name,
      description: combo.description,
      card_ids: cardIds,
      total_annual_fee: combo.total_annual_fee,
      estimated_annual_value: combo.estimated_annual_value,
      target_audience: combo.target_audience,
      pros: combo.pros,
      cons: combo.cons,
    };

    const { error } = await supabase.from("card_combos").insert(row);

    if (error) {
      console.error(
        `  Error seeding combo ${combo.combo_name}:`,
        error.message
      );
      continue;
    }

    console.log(`  ✓ ${combo.combo_name}`);
  }
}

// ============================================================
// Main
// ============================================================

async function main() {
  console.log("==============================================");
  console.log("  US Credit Cards - Database Seed Script");
  console.log("==============================================");
  console.log(`Supabase URL: ${SUPABASE_URL}`);

  try {
    // 1. Seed credit cards and collect benefits
    const allBenefits = await seedCreditCards();

    // 2. Seed card benefits
    await seedCardBenefits(allBenefits);

    // 3. Seed points programs and transfer partners
    await seedPointsPrograms();

    // 4. Seed spending categories (depends on credit_cards)
    await seedSpendingCategories();

    // 5. Seed card combos (depends on credit_cards)
    await seedCardCombos();

    console.log("\n==============================================");
    console.log("  Seed completed successfully!");
    console.log("==============================================\n");
  } catch (err) {
    console.error("\nSeed failed with error:", err);
    process.exit(1);
  }
}

main();
