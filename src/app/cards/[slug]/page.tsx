import type { Metadata } from "next";
import { notFound } from "next/navigation";
import CardDetailPageContent from "@/components/cards/CardDetailPageContent";
import { getCardBySlug, getRelatedCards } from "@/lib/queries/cards";

interface PageProps {
  params: Promise<{ slug: string }>;
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { slug } = await params;
  const card = await getCardBySlug(slug);

  if (!card) {
    return { title: "Card Not Found" };
  }

  return {
    title: `${card.card_name} | US Card Guide`,
    description: `${card.card_name} by ${card.issuer} - Annual fee $${card.annual_fee}, sign-up bonus worth $${card.signup_bonus_value_estimate}. ${card.key_benefits?.[0] || ""}`,
  };
}

export default async function CardDetailPage({ params }: PageProps) {
  const { slug } = await params;
  const card = await getCardBySlug(slug);

  if (!card) {
    notFound();
  }

  const relatedCards = await getRelatedCards(card.issuer, card.slug);

  return <CardDetailPageContent card={card} relatedCards={relatedCards} />;
}
