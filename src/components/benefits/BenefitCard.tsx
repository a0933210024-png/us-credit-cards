"use client";

import {
  Plane,
  Utensils,
  ShoppingBag,
  Tv,
  Hotel,
  Shield,
  Gift,
} from "lucide-react";
import type { CardBenefit } from "@/lib/types";
import { formatCurrency } from "@/lib/utils";
import { Badge } from "@/components/ui/badge";
import { useLanguage } from "@/lib/i18n";

interface BenefitCardProps {
  benefit: CardBenefit;
}

const CATEGORY_ICONS: Record<string, React.ElementType> = {
  travel: Plane,
  dining: Utensils,
  shopping: ShoppingBag,
  streaming: Tv,
  hotel: Hotel,
  airline: Plane,
  insurance: Shield,
  other: Gift,
};

export default function BenefitCard({ benefit }: BenefitCardProps) {
  const Icon = CATEGORY_ICONS[benefit.benefit_category] || Gift;
  const { t } = useLanguage();

  return (
    <div className="rounded-xl border bg-card p-4 transition-all hover:shadow-md">
      <div className="flex items-start gap-3">
        <div className="flex size-10 shrink-0 items-center justify-center rounded-lg bg-brand-primary/10 dark:bg-brand-accent/10">
          <Icon className="size-5 text-brand-primary dark:text-brand-accent" />
        </div>
        <div className="flex-1 space-y-1">
          <div className="flex items-start justify-between gap-2">
            <h4 className="font-medium leading-tight">
              {benefit.benefit_name}
            </h4>
            {benefit.benefit_value > 0 && (
              <span className="shrink-0 text-sm font-semibold text-brand-accent-text dark:text-brand-accent">
                {formatCurrency(benefit.benefit_value)}
              </span>
            )}
          </div>
          <p className="text-sm text-muted-foreground">
            {benefit.benefit_description}
          </p>
          <div className="flex flex-wrap items-center gap-2 pt-1">
            <Badge variant="secondary" className="text-xs capitalize">
              {benefit.benefit_type}
            </Badge>
            {benefit.reset_date_type && (
              <Badge variant="outline" className="text-xs">
                {t("benefits", "reset")}: {benefit.reset_date_type}
              </Badge>
            )}
          </div>
          {benefit.recommended_usage && (
            <p className="pt-1 text-xs text-brand-accent-text dark:text-brand-accent-light">
              {t("benefits", "recommendedUsage")}: {benefit.recommended_usage}
            </p>
          )}
        </div>
      </div>
    </div>
  );
}
