"use client";

import Link from "next/link";
import CardDetail from "@/components/cards/CardDetail";
import CardItem from "@/components/cards/CardItem";
import type { CreditCard } from "@/lib/types";
import { useLanguage } from "@/lib/i18n";

interface CardDetailPageContentProps {
  card: CreditCard;
  relatedCards: CreditCard[];
}

export default function CardDetailPageContent({
  card,
  relatedCards,
}: CardDetailPageContentProps) {
  const { t } = useLanguage();

  return (
    <div className="mx-auto max-w-4xl px-4 py-8 sm:px-6">
      {/* Breadcrumb */}
      <nav className="mb-6 text-sm text-muted-foreground">
        <Link href="/" className="hover:text-foreground">
          {t("common", "home")}
        </Link>
        <span className="mx-2">/</span>
        <Link href="/cards" className="hover:text-foreground">
          {t("common", "cards")}
        </Link>
        <span className="mx-2">/</span>
        <span className="text-foreground">{card.card_name}</span>
      </nav>

      <CardDetail card={card} />

      {/* Related cards */}
      {relatedCards.length > 0 && (
        <section className="mt-12">
          <h2 className="mb-6 text-xl font-bold">
            {t("cards", "moreFrom")} {card.issuer}
          </h2>
          <div className="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
            {relatedCards.map((related) => (
              <CardItem key={related.id || related.slug} card={related} />
            ))}
          </div>
        </section>
      )}
    </div>
  );
}
