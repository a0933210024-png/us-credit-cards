"use client";

import type { CardBenefit } from "@/lib/types";
import { BENEFIT_CATEGORIES } from "@/lib/constants";
import BenefitCard from "./BenefitCard";
import { useLanguage } from "@/lib/i18n";

interface BenefitListProps {
  benefits: CardBenefit[];
  groupBy?: "category" | "none";
}

export default function BenefitList({
  benefits,
  groupBy = "category",
}: BenefitListProps) {
  const { t } = useLanguage();

  if (benefits.length === 0) {
    return (
      <div className="py-8 text-center text-muted-foreground">
        {t("benefits", "noBenefits")}
      </div>
    );
  }

  if (groupBy === "none") {
    return (
      <div className="space-y-3">
        {benefits.map((benefit, i) => (
          <BenefitCard key={benefit.id || i} benefit={benefit} />
        ))}
      </div>
    );
  }

  // Group by category
  const grouped: Record<string, CardBenefit[]> = {};
  benefits.forEach((benefit) => {
    const cat = benefit.benefit_category || "other";
    if (!grouped[cat]) grouped[cat] = [];
    grouped[cat].push(benefit);
  });

  return (
    <div className="space-y-8">
      {BENEFIT_CATEGORIES.filter((cat) => grouped[cat.key]).map((cat) => (
        <div key={cat.key}>
          <h3 className="mb-3 text-lg font-semibold">
            {t("benefitCategories", cat.key)}
          </h3>
          <div className="space-y-3">
            {grouped[cat.key].map((benefit, i) => (
              <BenefitCard key={benefit.id || i} benefit={benefit} />
            ))}
          </div>
        </div>
      ))}
      {/* Show uncategorized */}
      {Object.keys(grouped)
        .filter((k) => !BENEFIT_CATEGORIES.some((c) => c.key === k))
        .map((key) => (
          <div key={key}>
            <h3 className="mb-3 text-lg font-semibold capitalize">{key}</h3>
            <div className="space-y-3">
              {grouped[key].map((benefit, i) => (
                <BenefitCard key={benefit.id || i} benefit={benefit} />
              ))}
            </div>
          </div>
        ))}
    </div>
  );
}
