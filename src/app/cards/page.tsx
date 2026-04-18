"use client";

import { useState, useEffect, useMemo } from "react";
import CardFilter from "@/components/cards/CardFilter";
import CardGrid from "@/components/cards/CardGrid";
import CardCompare from "@/components/cards/CardCompare";
import type { CreditCard, CardFilters, SortOption } from "@/lib/types";
import { useLanguage } from "@/lib/i18n";

export default function CardsPage() {
  const { t } = useLanguage();
  const [cards, setCards] = useState<CreditCard[]>([]);
  const [loading, setLoading] = useState(true);
  const [filters, setFilters] = useState<CardFilters>({
    issuers: [],
    networks: [],
    maxAnnualFee: 1000,
    searchQuery: "",
    cardType: "all",
  });
  const [sortBy, setSortBy] = useState<SortOption>("signup_bonus_desc");
  const [compareCards, setCompareCards] = useState<CreditCard[]>([]);

  useEffect(() => {
    const loadCards = async () => {
      try {
        const files = [
          import("@/data/chase-cards.json"),
          import("@/data/amex-cards.json"),
          import("@/data/citi-cards.json"),
          import("@/data/capital-one-cards.json"),
          import("@/data/other-cards.json"),
        ];
        const results = await Promise.all(files);
        const allCards: CreditCard[] = results.flatMap((mod, fi) =>
          (mod.default as unknown as CreditCard[]).map((c, i) => ({
            ...c,
            id: c.id || `file-${fi}-${i}`,
            is_active: c.is_active ?? true,
          }))
        );
        setCards(allCards.filter((c) => c.is_active !== false));
      } catch {
        // fallback: empty
      } finally {
        setLoading(false);
      }
    };
    loadCards();
  }, []);

  const filteredCards = useMemo(() => {
    let result = cards;

    // Filter by card type (personal vs business)
    if (filters.cardType === "personal") {
      result = result.filter(
        (c) =>
          !c.card_name.toLowerCase().includes("business") &&
          !c.card_name.toLowerCase().includes("ink ")
      );
    } else if (filters.cardType === "business") {
      result = result.filter(
        (c) =>
          c.card_name.toLowerCase().includes("business") ||
          c.card_name.toLowerCase().includes("ink ")
      );
    }

    // Filter by issuers
    if (filters.issuers.length > 0) {
      result = result.filter((c) => filters.issuers.includes(c.issuer));
    }

    // Filter by networks
    if (filters.networks.length > 0) {
      result = result.filter((c) => filters.networks.includes(c.card_network));
    }

    // Filter by max annual fee
    result = result.filter((c) => c.annual_fee <= filters.maxAnnualFee);

    // Search query
    if (filters.searchQuery) {
      const q = filters.searchQuery.toLowerCase();
      result = result.filter(
        (c) =>
          c.card_name.toLowerCase().includes(q) ||
          c.issuer.toLowerCase().includes(q)
      );
    }

    // Sort
    switch (sortBy) {
      case "annual_fee_asc":
        result = [...result].sort((a, b) => a.annual_fee - b.annual_fee);
        break;
      case "annual_fee_desc":
        result = [...result].sort((a, b) => b.annual_fee - a.annual_fee);
        break;
      case "signup_bonus_desc":
        result = [...result].sort(
          (a, b) =>
            (b.signup_bonus_value_estimate ?? 0) -
            (a.signup_bonus_value_estimate ?? 0)
        );
        break;
      case "card_name_asc":
        result = [...result].sort((a, b) =>
          a.card_name.localeCompare(b.card_name)
        );
        break;
    }

    return result;
  }, [cards, filters, sortBy]);

  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  const handleToggleCompare = (card: CreditCard) => {
    setCompareCards((prev) => {
      const exists = prev.find((c) => c.id === card.id);
      if (exists) return prev.filter((c) => c.id !== card.id);
      if (prev.length >= 3) return prev;
      return [...prev, card];
    });
  };

  const handleRemoveCompare = (cardId: string) => {
    setCompareCards((prev) => prev.filter((c) => c.id !== cardId));
  };

  return (
    <div className="mx-auto max-w-7xl px-4 py-8 sm:px-6">
      <div className="mb-8">
        <h1 className="text-2xl font-bold sm:text-3xl">{t("cards", "database")}</h1>
        <p className="mt-2 text-muted-foreground">
          {t("cards", "databaseSubtitle")}
        </p>
      </div>

      {/* Sort controls */}
      <div className="mb-6 flex items-center justify-between">
        <p className="text-sm text-muted-foreground">
          {filteredCards.length} {t("cards", "cardsFound")}
        </p>
        <select
          value={sortBy}
          onChange={(e) => setSortBy(e.target.value as SortOption)}
          className="rounded-md border bg-background px-3 py-1.5 text-sm"
        >
          <option value="signup_bonus_desc">{t("cards", "sortSignupBonusDesc")}</option>
          <option value="annual_fee_asc">{t("cards", "sortAnnualFeeAsc")}</option>
          <option value="annual_fee_desc">{t("cards", "sortAnnualFeeDesc")}</option>
          <option value="card_name_asc">{t("cards", "sortNameAsc")}</option>
        </select>
      </div>

      <div className="flex gap-8">
        <CardFilter filters={filters} onFilterChange={setFilters} />
        <div className="flex-1">
          <CardGrid cards={filteredCards} loading={loading} />
        </div>
      </div>

      {/* Compare bar */}
      <CardCompare cards={compareCards} onRemove={handleRemoveCompare} />
    </div>
  );
}
