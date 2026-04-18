"use client";

import type { CreditCard } from "@/lib/types";
import CardItem from "./CardItem";
import { useLanguage } from "@/lib/i18n";

interface CardGridProps {
  cards: CreditCard[];
  loading?: boolean;
}

export default function CardGrid({ cards, loading }: CardGridProps) {
  const { t } = useLanguage();

  if (loading) {
    return (
      <div className="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
        {Array.from({ length: 6 }).map((_, i) => (
          <div
            key={i}
            className="animate-pulse overflow-hidden rounded-xl border bg-card"
          >
            <div className="h-36 bg-muted" />
            <div className="space-y-3 p-4">
              <div className="flex gap-2">
                <div className="h-5 w-20 rounded-full bg-muted" />
                <div className="h-5 w-16 rounded-full bg-muted" />
              </div>
              <div className="h-4 w-full rounded bg-muted" />
              <div className="h-4 w-3/4 rounded bg-muted" />
              <div className="h-10 rounded-md bg-muted" />
            </div>
          </div>
        ))}
      </div>
    );
  }

  if (cards.length === 0) {
    return (
      <div className="py-12 text-center text-muted-foreground">
        {t("cards", "noCardsFound")}
      </div>
    );
  }

  return (
    <div className="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
      {cards.map((card) => (
        <CardItem key={card.id} card={card} />
      ))}
    </div>
  );
}
