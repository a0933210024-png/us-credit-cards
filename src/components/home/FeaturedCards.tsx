"use client";

import type { CreditCard } from "@/lib/types";
import CardItem from "@/components/cards/CardItem";
import { useLanguage } from "@/lib/i18n";

interface FeaturedCardsProps {
  cards: CreditCard[];
}

export default function FeaturedCards({ cards }: FeaturedCardsProps) {
  const { t } = useLanguage();

  if (cards.length === 0) return null;

  return (
    <section className="mx-auto max-w-7xl px-4 py-12 sm:px-6">
      <div className="mb-8 text-center">
        <h2 className="text-2xl font-bold sm:text-3xl">{t("home", "featuredBonuses")}</h2>
        <p className="mt-2 text-muted-foreground">
          {t("home", "featuredBonusesSubtitle")}
        </p>
      </div>

      <div className="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
        {cards.slice(0, 6).map((card) => (
          <CardItem key={card.id} card={card} />
        ))}
      </div>
    </section>
  );
}
