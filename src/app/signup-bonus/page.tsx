"use client";

import { useState, useEffect, useMemo } from "react";
import Link from "next/link";
import { Gift, AlertTriangle, ShieldCheck, Info } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import {
  Card,
  CardContent,
  CardHeader,
  CardTitle,
} from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import CardBadge from "@/components/cards/CardBadge";
import type { CreditCard } from "@/lib/types";
import { formatCurrency } from "@/lib/utils";
import { ISSUER_COLORS } from "@/lib/constants";
import { useLanguage } from "@/lib/i18n";

export default function SignupBonusPage() {
  const { t } = useLanguage();
  const [cards, setCards] = useState<CreditCard[]>([]);
  const [loading, setLoading] = useState(true);
  const [recentCards, setRecentCards] = useState<number>(0);
  const [showChecker, setShowChecker] = useState(false);

  useEffect(() => {
    const loadData = async () => {
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
        setCards(
          allCards.filter(
            (c) => c.is_active !== false && c.signup_bonus_value_estimate > 0
          )
        );
      } catch {
        // fallback
      } finally {
        setLoading(false);
      }
    };
    loadData();
  }, []);

  // Sort by signup bonus value
  const rankedCards = useMemo(() => {
    return [...cards].sort(
      (a, b) =>
        (b.signup_bonus_value_estimate ?? 0) -
        (a.signup_bonus_value_estimate ?? 0)
    );
  }, [cards]);

  const is524Safe = recentCards <= 4;

  if (loading) {
    return (
      <div className="mx-auto max-w-7xl px-4 py-8 sm:px-6">
        <div className="animate-pulse space-y-6">
          <div className="h-8 w-64 rounded bg-muted" />
          <div className="h-4 w-96 rounded bg-muted" />
          <div className="space-y-4">
            {Array.from({ length: 5 }).map((_, i) => (
              <div key={i} className="h-32 rounded-xl bg-muted" />
            ))}
          </div>
        </div>
      </div>
    );
  }

  return (
    <div className="mx-auto max-w-7xl px-4 py-8 sm:px-6">
      <div className="mb-8">
        <h1 className="text-2xl font-bold sm:text-3xl">{t("signupBonus", "pageTitle")}</h1>
        <p className="mt-2 text-muted-foreground">
          {t("signupBonus", "pageSubtitle")}
        </p>
      </div>

      {/* 5/24 Checker */}
      <section className="mb-8">
        <Button
          variant="outline"
          onClick={() => setShowChecker(!showChecker)}
          className="mb-4"
        >
          <ShieldCheck className="mr-2 size-4" />
          {t("signupBonus", "chase524Checker")}
        </Button>

        {showChecker && (
          <Card className="mb-6">
            <CardHeader>
              <CardTitle className="flex items-center gap-2">
                <ShieldCheck className="size-5" />
                {t("signupBonus", "chase524Rule")}
              </CardTitle>
              <p className="text-sm text-muted-foreground">
                {t("signupBonus", "chase524Desc")}
              </p>
            </CardHeader>
            <CardContent className="space-y-4">
              <div className="space-y-2">
                <Label>
                  {t("signupBonus", "recentCardsQuestion")}
                </Label>
                <Input
                  type="number"
                  min={0}
                  max={20}
                  value={recentCards}
                  onChange={(e) =>
                    setRecentCards(parseInt(e.target.value) || 0)
                  }
                  className="max-w-32"
                />
              </div>

              <div
                className={`rounded-lg p-4 ${
                  is524Safe
                    ? "border-green-300 bg-green-50 dark:border-green-800 dark:bg-green-950/30"
                    : "border-red-300 bg-red-50 dark:border-red-800 dark:bg-red-950/30"
                } border`}
              >
                {is524Safe ? (
                  <div className="flex items-center gap-2">
                    <ShieldCheck className="size-5 text-green-600 dark:text-green-400" />
                    <div>
                      <p className="font-medium text-green-800 dark:text-green-300">
                        {t("signupBonus", "under524")} ({recentCards}/5)
                      </p>
                      <p className="text-sm text-green-700 dark:text-green-400">
                        {t("signupBonus", "under524Desc")}
                      </p>
                    </div>
                  </div>
                ) : (
                  <div className="flex items-center gap-2">
                    <AlertTriangle className="size-5 text-red-600 dark:text-red-400" />
                    <div>
                      <p className="font-medium text-red-800 dark:text-red-300">
                        {t("signupBonus", "over524")} ({recentCards}/5)
                      </p>
                      <p className="text-sm text-red-700 dark:text-red-400">
                        {t("signupBonus", "over524Desc")}
                      </p>
                    </div>
                  </div>
                )}
              </div>
            </CardContent>
          </Card>
        )}
      </section>

      {/* Amex Pop-up Warning */}
      <Card className="mb-8 border-yellow-300 dark:border-yellow-800">
        <CardContent className="flex items-start gap-3 py-4">
          <AlertTriangle className="mt-0.5 size-5 shrink-0 text-yellow-600 dark:text-yellow-400" />
          <div>
            <h3 className="font-medium">{t("signupBonus", "amexPopup")}</h3>
            <p className="mt-1 text-sm text-muted-foreground">
              {t("signupBonus", "amexPopupDesc")}
            </p>
          </div>
        </CardContent>
      </Card>

      {/* Ranked list */}
      <div className="space-y-4">
        {rankedCards.map((card, index) => {
          const issuerColor = ISSUER_COLORS[card.issuer] || "#1a365d";
          return (
            <Link
              key={card.id || card.slug}
              href={`/cards/${card.slug}`}
              className="group block"
            >
              <div className="flex overflow-hidden rounded-xl border bg-card transition-all hover:-translate-y-0.5 hover:shadow-md">
                {/* Rank badge */}
                <div
                  className="flex w-16 shrink-0 flex-col items-center justify-center"
                  style={{ backgroundColor: issuerColor }}
                >
                  <span className="text-xs text-white/70">#{index + 1}</span>
                  <Gift className="size-5 text-white" />
                </div>

                {/* Card info */}
                <div className="flex flex-1 flex-col justify-center gap-2 p-4 sm:flex-row sm:items-center sm:justify-between">
                  <div>
                    <div className="flex flex-wrap items-center gap-2">
                      <h3 className="font-semibold">{card.card_name}</h3>
                      <CardBadge type="annual-fee" value={card.annual_fee} />
                    </div>
                    <p className="mt-1 text-sm text-muted-foreground line-clamp-1">
                      {card.signup_bonus_description}
                    </p>
                    <div className="mt-1 flex items-center gap-3 text-xs text-muted-foreground">
                      <span>
                        {t("signupBonus", "spend")} {formatCurrency(card.signup_bonus_spend_requirement)} {t("signupBonus", "in")}{" "}
                        {card.signup_bonus_time_limit_months} {t("cards", "months")}
                      </span>
                      {card.application_rules?.rule_name && (
                        <Badge variant="outline" className="text-xs">
                          <Info className="mr-1 size-3" />
                          {card.application_rules.rule_name}
                        </Badge>
                      )}
                    </div>
                  </div>
                  <div className="text-right">
                    <p className="text-2xl font-bold text-brand-accent-text dark:text-brand-accent">
                      {formatCurrency(card.signup_bonus_value_estimate)}
                    </p>
                    <p className="text-xs text-muted-foreground">
                      {t("signupBonus", "estimatedValue")}
                    </p>
                  </div>
                </div>
              </div>
            </Link>
          );
        })}
      </div>

      {rankedCards.length === 0 && (
        <div className="py-12 text-center text-muted-foreground">
          {t("signupBonus", "noData")}
        </div>
      )}
    </div>
  );
}
