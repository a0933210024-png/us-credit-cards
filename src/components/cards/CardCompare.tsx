"use client";

import { X } from "lucide-react";
import type { CreditCard } from "@/lib/types";
import { formatCurrency } from "@/lib/utils";
import { ISSUER_COLORS } from "@/lib/constants";
import { Button } from "@/components/ui/button";
import { useLanguage } from "@/lib/i18n";

interface CardCompareProps {
  cards: CreditCard[];
  onRemove: (cardId: string) => void;
}

export default function CardCompare({ cards, onRemove }: CardCompareProps) {
  const { t } = useLanguage();

  if (cards.length === 0) return null;

  const compareFields = [
    { label: t("cards", "issuer"), getValue: (c: CreditCard) => c.issuer },
    { label: t("cards", "annualFee"), getValue: (c: CreditCard) => formatCurrency(c.annual_fee) },
    { label: t("cards", "cardNetwork"), getValue: (c: CreditCard) => c.card_network },
    {
      label: t("cards", "signupBonusValue"),
      getValue: (c: CreditCard) => formatCurrency(c.signup_bonus_value_estimate),
    },
    {
      label: t("cards", "foreignTxFee"),
      getValue: (c: CreditCard) =>
        c.foreign_transaction_fee === 0 ? t("cards", "none") : `${c.foreign_transaction_fee}%`,
    },
    {
      label: t("cards", "creditScore"),
      getValue: (c: CreditCard) => c.credit_score_recommended,
    },
  ];

  // Collect all earning categories
  const allCategories = new Set<string>();
  cards.forEach((card) => {
    if (card.earning_rates) {
      Object.keys(card.earning_rates).forEach((k) => allCategories.add(k));
    }
  });

  // Collect key benefits
  const maxBenefits = Math.max(...cards.map((c) => c.key_benefits?.length || 0));

  return (
    <div className="space-y-6">
      {/* Compare table */}
      <div className="overflow-x-auto rounded-xl border">
        <table className="w-full text-sm">
          {/* Card headers */}
          <thead>
            <tr className="border-b">
              <th className="bg-muted/50 px-4 py-3 text-left font-medium w-40">
                {t("cards", "compare")}
              </th>
              {cards.map((card) => {
                const color = ISSUER_COLORS[card.issuer] || "#1a365d";
                return (
                  <th key={card.id} className="relative px-4 py-3 text-center min-w-48">
                    <div
                      className="absolute inset-x-0 top-0 h-1"
                      style={{ backgroundColor: color }}
                    />
                    <div className="flex items-center justify-center gap-1">
                      <span className="font-semibold">{card.card_name}</span>
                      <Button
                        variant="ghost"
                        size="icon-xs"
                        onClick={() => onRemove(card.id)}
                        aria-label={`Remove ${card.card_name}`}
                      >
                        <X className="size-3" />
                      </Button>
                    </div>
                    <p className="text-xs text-muted-foreground">{card.issuer}</p>
                  </th>
                );
              })}
            </tr>
          </thead>
          <tbody>
            {/* Basic fields */}
            {compareFields.map((field) => (
              <tr key={field.label} className="border-b">
                <td className="bg-muted/50 px-4 py-2.5 font-medium">
                  {field.label}
                </td>
                {cards.map((card) => (
                  <td key={card.id} className="px-4 py-2.5 text-center">
                    {field.getValue(card)}
                  </td>
                ))}
              </tr>
            ))}

            {/* Earning rates */}
            {Array.from(allCategories).map((cat) => (
              <tr key={cat} className="border-b">
                <td className="bg-muted/50 px-4 py-2.5 font-medium capitalize">
                  {cat.replace(/_/g, " ")} {t("cards", "rate")}
                </td>
                {cards.map((card) => (
                  <td key={card.id} className="px-4 py-2.5 text-center">
                    {card.earning_rates?.[cat] || "-"}
                  </td>
                ))}
              </tr>
            ))}

            {/* Key benefits */}
            {Array.from({ length: maxBenefits }).map((_, i) => (
              <tr key={`benefit-${i}`} className="border-b">
                <td className="bg-muted/50 px-4 py-2.5 font-medium">
                  {i === 0 ? t("cards", "keyBenefits") : ""}
                </td>
                {cards.map((card) => (
                  <td key={card.id} className="px-4 py-2.5 text-center text-xs">
                    {card.key_benefits?.[i] || "-"}
                  </td>
                ))}
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      {/* Floating compare bar */}
      <div className="fixed inset-x-0 bottom-0 z-30 border-t bg-background/95 px-4 py-3 shadow-lg backdrop-blur">
        <div className="mx-auto flex max-w-7xl items-center justify-between">
          <div className="flex items-center gap-3">
            <span className="text-sm font-medium">
              {t("cards", "comparing")} {cards.length}/3
            </span>
            <div className="flex gap-2">
              {cards.map((card) => (
                <div
                  key={card.id}
                  className="flex items-center gap-1 rounded-full border px-3 py-1 text-xs"
                >
                  <span className="max-w-24 truncate">{card.card_name}</span>
                  <button
                    onClick={() => onRemove(card.id)}
                    className="ml-1 text-muted-foreground hover:text-foreground"
                    aria-label={`Remove ${card.card_name}`}
                  >
                    <X className="size-3" />
                  </button>
                </div>
              ))}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
