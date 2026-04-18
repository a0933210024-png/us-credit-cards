"use client";

import { useState, useEffect } from "react";
import Link from "next/link";
import { Calculator, Star, Award } from "lucide-react";
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
import type { SpendingCategory } from "@/lib/types";
import { formatCurrency } from "@/lib/utils";
import { useLanguage } from "@/lib/i18n";

export default function BestCardsPage() {
  const { t } = useLanguage();
  const [categories, setCategories] = useState<SpendingCategory[]>([]);
  const [loading, setLoading] = useState(true);
  const [showCalculator, setShowCalculator] = useState(false);
  const [monthlySpend, setMonthlySpend] = useState<Record<string, number>>({});

  useEffect(() => {
    const loadData = async () => {
      try {
        const data = await import("@/data/spending-categories.json");
        setCategories(data.default as SpendingCategory[]);
      } catch {
        // fallback
      } finally {
        setLoading(false);
      }
    };
    loadData();
  }, []);

  // Parse earning rate to a percentage number (approximate)
  const parseRate = (rate: string): number => {
    const match = rate.match(/(\d+(?:\.\d+)?)/);
    return match ? parseFloat(match[1]) : 1;
  };

  const calculateAnnualReward = () => {
    let total = 0;
    categories.forEach((cat) => {
      const spend = monthlySpend[cat.category_name] || 0;
      const rate = parseRate(cat.earning_rate);
      total += spend * 12 * (rate / 100);
    });
    return total;
  };

  if (loading) {
    return (
      <div className="mx-auto max-w-7xl px-4 py-8 sm:px-6">
        <div className="animate-pulse space-y-6">
          <div className="h-8 w-64 rounded bg-muted" />
          <div className="h-4 w-96 rounded bg-muted" />
          <div className="grid gap-6 sm:grid-cols-2">
            {Array.from({ length: 6 }).map((_, i) => (
              <div key={i} className="h-48 rounded-xl bg-muted" />
            ))}
          </div>
        </div>
      </div>
    );
  }

  return (
    <div className="mx-auto max-w-7xl px-4 py-8 sm:px-6">
      <div className="mb-8">
        <h1 className="text-2xl font-bold sm:text-3xl">{t("bestCards", "pageTitle")}</h1>
        <p className="mt-2 text-muted-foreground">
          {t("bestCards", "pageSubtitle")}
        </p>
      </div>

      {/* Category sections */}
      <div className="grid gap-6 sm:grid-cols-2">
        {categories.map((cat) => {
          const label = t("categories", cat.category_name);
          const displayLabel = label !== cat.category_name ? label : (cat.category_name_zh || cat.category_name);

          return (
            <Card key={cat.category_name} className="transition-all hover:shadow-md">
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <Star className="size-5 text-brand-accent" />
                  {displayLabel}
                </CardTitle>
              </CardHeader>
              <CardContent className="space-y-4">
                {/* Best card */}
                <div className="rounded-lg bg-brand-accent/10 p-4">
                  <div className="flex items-center gap-2">
                    <Award className="size-4 text-brand-accent" />
                    <Badge className="bg-brand-accent-text text-white dark:bg-brand-accent dark:text-gray-900">
                      {t("bestCards", "bestCard")}
                    </Badge>
                  </div>
                  <Link
                    href={`/cards/${cat.best_card_slug}`}
                    className="mt-2 block text-lg font-semibold hover:text-brand-primary dark:hover:text-brand-accent"
                  >
                    {cat.best_card_name}
                  </Link>
                  <p className="mt-1 text-sm font-medium text-brand-accent-text dark:text-brand-accent">
                    {cat.earning_rate}
                  </p>
                </div>

                {/* Runner up */}
                {cat.runner_up_card_name && (
                  <div className="rounded-lg border p-4">
                    <Badge variant="secondary" className="text-xs">
                      {t("bestCards", "runnerUp")}
                    </Badge>
                    <Link
                      href={`/cards/${cat.runner_up_card_slug}`}
                      className="mt-2 block font-medium hover:text-brand-primary dark:hover:text-brand-accent"
                    >
                      {cat.runner_up_card_name}
                    </Link>
                    <p className="mt-1 text-sm text-muted-foreground">
                      {cat.runner_up_earning_rate}
                    </p>
                  </div>
                )}

                {/* Notes */}
                {cat.notes && (
                  <p className="text-xs text-muted-foreground">{cat.notes}</p>
                )}
              </CardContent>
            </Card>
          );
        })}
      </div>

      {/* Rewards Calculator */}
      <section className="mt-12">
        <Button
          variant="outline"
          className="mb-6"
          onClick={() => setShowCalculator(!showCalculator)}
        >
          <Calculator className="mr-2 size-4" />
          {showCalculator ? t("bestCards", "hideCalculator") : t("bestCards", "showCalculator")}
        </Button>

        {showCalculator && (
          <Card>
            <CardHeader>
              <CardTitle className="flex items-center gap-2">
                <Calculator className="size-5" />
                {t("bestCards", "calculator")}
              </CardTitle>
              <p className="text-sm text-muted-foreground">
                {t("bestCards", "monthlySpendSubtitle")}
              </p>
            </CardHeader>
            <CardContent className="space-y-4">
              <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
                {categories.map((cat) => {
                  const label = t("categories", cat.category_name);
                  const displayLabel = label !== cat.category_name ? label : (cat.category_name_zh || cat.category_name);

                  return (
                    <div key={cat.category_name} className="space-y-1">
                      <Label className="text-xs">
                        {displayLabel} ({cat.earning_rate})
                      </Label>
                      <Input
                        type="number"
                        placeholder="$0"
                        min={0}
                        value={monthlySpend[cat.category_name] || ""}
                        onChange={(e) =>
                          setMonthlySpend((prev) => ({
                            ...prev,
                            [cat.category_name]:
                              parseInt(e.target.value) || 0,
                          }))
                        }
                      />
                    </div>
                  );
                })}
              </div>

              <div className="rounded-lg bg-brand-accent/10 p-6 text-center">
                <p className="text-sm text-muted-foreground">
                  {t("bestCards", "estimatedAnnualRewards")}
                </p>
                <p className="text-3xl font-bold text-brand-accent-text dark:text-brand-accent">
                  {formatCurrency(calculateAnnualReward())}
                </p>
                <p className="mt-1 text-xs text-muted-foreground">
                  {t("bestCards", "estimateDisclaimer")}
                </p>
              </div>
            </CardContent>
          </Card>
        )}
      </section>
    </div>
  );
}
