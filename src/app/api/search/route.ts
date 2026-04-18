import { NextRequest, NextResponse } from "next/server";
import { searchCards } from "@/lib/queries/cards";

export async function GET(request: NextRequest) {
  const q = request.nextUrl.searchParams.get("q") || "";
  if (q.length < 2) {
    return NextResponse.json([]);
  }

  const cards = await searchCards(q);
  const results = cards.slice(0, 20).map((c) => ({
    slug: c.slug,
    card_name: c.card_name,
    issuer: c.issuer,
  }));

  return NextResponse.json(results);
}
