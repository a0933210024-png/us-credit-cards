/**
 * check-freshness.ts
 *
 * Reports which cards need a data refresh.
 *
 * Flags three classes of issues:
 *   1. STALE      — last_verified_at older than STALE_DAYS (default 30)
 *   2. VERY_STALE — last_verified_at older than VERY_STALE_DAYS (default 90)
 *   3. EXPIRED    — offer_expires_at is in the past
 *   4. MISSING    — no last_verified_at at all
 *
 * Usage:
 *   npx tsx src/scripts/check-freshness.ts
 *   npx tsx src/scripts/check-freshness.ts --json   # machine-readable output
 */

import * as fs from "fs";
import * as path from "path";

interface CardRecord {
  slug: string;
  card_name: string;
  issuer: string;
  is_active?: boolean;
  status?: string;
  last_verified_at?: string;
  offer_expires_at?: string;
  issuer_url?: string;
}

const DATA_DIR = path.join(process.cwd(), "src", "data");
const CARD_FILES = [
  "chase-cards.json",
  "amex-cards.json",
  "citi-cards.json",
  "capital-one-cards.json",
  "other-cards.json",
];

const STALE_DAYS = 30;
const VERY_STALE_DAYS = 90;

function daysSince(isoDate: string): number {
  const diff = Date.now() - new Date(isoDate).getTime();
  return Math.floor(diff / (1000 * 60 * 60 * 24));
}

function loadAllCards(): CardRecord[] {
  const all: CardRecord[] = [];
  for (const file of CARD_FILES) {
    const p = path.join(DATA_DIR, file);
    if (!fs.existsSync(p)) continue;
    const cards = JSON.parse(fs.readFileSync(p, "utf-8")) as CardRecord[];
    all.push(...cards);
  }
  return all;
}

interface Finding {
  slug: string;
  card_name: string;
  issuer: string;
  severity: "expired" | "very_stale" | "stale" | "missing";
  reason: string;
  issuer_url?: string;
}

function analyse(cards: CardRecord[]): Finding[] {
  const findings: Finding[] = [];
  const today = new Date().toISOString().slice(0, 10);

  for (const c of cards) {
    if (c.is_active === false) continue;

    if (c.offer_expires_at && c.offer_expires_at < today) {
      findings.push({
        slug: c.slug,
        card_name: c.card_name,
        issuer: c.issuer,
        severity: "expired",
        reason: `開卡禮 offer 已於 ${c.offer_expires_at} 到期`,
        issuer_url: c.issuer_url,
      });
    }

    if (!c.last_verified_at) {
      findings.push({
        slug: c.slug,
        card_name: c.card_name,
        issuer: c.issuer,
        severity: "missing",
        reason: "從未驗證（缺 last_verified_at）",
        issuer_url: c.issuer_url,
      });
      continue;
    }

    const age = daysSince(c.last_verified_at);
    if (age > VERY_STALE_DAYS) {
      findings.push({
        slug: c.slug,
        card_name: c.card_name,
        issuer: c.issuer,
        severity: "very_stale",
        reason: `${age} 天未驗證（上次 ${c.last_verified_at}）`,
        issuer_url: c.issuer_url,
      });
    } else if (age > STALE_DAYS) {
      findings.push({
        slug: c.slug,
        card_name: c.card_name,
        issuer: c.issuer,
        severity: "stale",
        reason: `${age} 天未驗證（上次 ${c.last_verified_at}）`,
        issuer_url: c.issuer_url,
      });
    }
  }

  const order: Record<Finding["severity"], number> = {
    expired: 0,
    very_stale: 1,
    stale: 2,
    missing: 3,
  };
  findings.sort((a, b) => order[a.severity] - order[b.severity]);
  return findings;
}

function printHuman(cards: CardRecord[], findings: Finding[]): void {
  const active = cards.filter((c) => c.is_active !== false);
  console.log(`\n📊 Card Data Freshness Report`);
  console.log(`   Total cards: ${cards.length} (${active.length} active)`);
  console.log(`   Thresholds: stale=${STALE_DAYS}d, very_stale=${VERY_STALE_DAYS}d\n`);

  if (findings.length === 0) {
    console.log(`   ✅ All active cards are fresh. Nothing to do.\n`);
    return;
  }

  const byIssuer = new Map<string, Finding[]>();
  for (const f of findings) {
    const list = byIssuer.get(f.issuer) ?? [];
    list.push(f);
    byIssuer.set(f.issuer, list);
  }

  const icon = { expired: "🔴", very_stale: "🟠", stale: "🟡", missing: "⚪" };
  for (const [issuer, list] of byIssuer) {
    console.log(`▸ ${issuer} (${list.length})`);
    for (const f of list) {
      console.log(`   ${icon[f.severity]} ${f.slug} — ${f.reason}`);
      if (f.issuer_url) console.log(`      ${f.issuer_url}`);
    }
    console.log();
  }

  const counts = findings.reduce<Record<string, number>>((acc, f) => {
    acc[f.severity] = (acc[f.severity] ?? 0) + 1;
    return acc;
  }, {});
  console.log(
    `Summary: ${counts.expired ?? 0} expired · ${counts.very_stale ?? 0} very stale · ${counts.stale ?? 0} stale · ${counts.missing ?? 0} missing\n`
  );
}

function main(): void {
  const cards = loadAllCards();
  const findings = analyse(cards);

  if (process.argv.includes("--json")) {
    console.log(JSON.stringify({ total: cards.length, findings }, null, 2));
    return;
  }

  printHuman(cards, findings);
  process.exitCode = findings.some((f) => f.severity === "expired") ? 1 : 0;
}

main();
