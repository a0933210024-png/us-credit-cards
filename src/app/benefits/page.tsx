"use client";

import { useState, useEffect, useMemo } from "react";
import { Tabs, TabsList, TabsTrigger, TabsContent } from "@/components/ui/tabs";
import BenefitList from "@/components/benefits/BenefitList";
import UsageTip from "@/components/benefits/UsageTip";
import type { CreditCard, CardBenefit } from "@/lib/types";
import { ISSUERS, BENEFIT_CATEGORIES } from "@/lib/constants";
import { useLanguage } from "@/lib/i18n";

interface BenefitWithCard extends CardBenefit {
  card_name?: string;
  issuer?: string;
}

export default function BenefitsPage() {
  const { t } = useLanguage();
  const [benefits, setBenefits] = useState<BenefitWithCard[]>([]);
  const [loading, setLoading] = useState(true);
  const [viewMode, setViewMode] = useState<string>("issuer");

  const USAGE_TIPS = [
    {
      title: t("benefitsTips", "tip1Title"),
      description: t("benefitsTips", "tip1Desc"),
    },
    {
      title: t("benefitsTips", "tip2Title"),
      description: t("benefitsTips", "tip2Desc"),
    },
    {
      title: t("benefitsTips", "tip3Title"),
      description: t("benefitsTips", "tip3Desc"),
    },
  ];

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
        const allCards: CreditCard[] = results.flatMap((mod) =>
          mod.default as unknown as CreditCard[]
        );

        // Extract benefits from card data
        const allBenefits: BenefitWithCard[] = [];
        allCards.forEach((card) => {
          if (card.benefits && Array.isArray(card.benefits)) {
            card.benefits.forEach((b) => {
              allBenefits.push({
                ...b,
                card_name: card.card_name,
                issuer: card.issuer,
              });
            });
          }
        });

        setBenefits(allBenefits);
      } catch {
        // fallback
      } finally {
        setLoading(false);
      }
    };
    loadData();
  }, []);

  // Group by issuer
  const benefitsByIssuer = useMemo(() => {
    const grouped: Record<string, BenefitWithCard[]> = {};
    benefits.forEach((b) => {
      const issuer = b.issuer || "Other";
      if (!grouped[issuer]) grouped[issuer] = [];
      grouped[issuer].push(b);
    });
    return grouped;
  }, [benefits]);

  // Group by category
  const benefitsByCategory = useMemo(() => {
    const grouped: Record<string, BenefitWithCard[]> = {};
    benefits.forEach((b) => {
      const cat = b.benefit_category || "other";
      if (!grouped[cat]) grouped[cat] = [];
      grouped[cat].push(b);
    });
    return grouped;
  }, [benefits]);

  if (loading) {
    return (
      <div className="mx-auto max-w-7xl px-4 py-8 sm:px-6">
        <div className="animate-pulse space-y-6">
          <div className="h-8 w-48 rounded bg-muted" />
          <div className="h-4 w-80 rounded bg-muted" />
          <div className="space-y-4">
            {Array.from({ length: 4 }).map((_, i) => (
              <div key={i} className="h-24 rounded-xl bg-muted" />
            ))}
          </div>
        </div>
      </div>
    );
  }

  return (
    <div className="mx-auto max-w-7xl px-4 py-8 sm:px-6">
      <div className="mb-8">
        <h1 className="text-2xl font-bold sm:text-3xl">{t("benefits", "pageTitle")}</h1>
        <p className="mt-2 text-muted-foreground">
          {t("benefits", "pageSubtitle")}
        </p>
      </div>

      {/* Usage Tips */}
      <section className="mb-10">
        <h2 className="mb-4 text-lg font-semibold">{t("benefits", "featuredTips")}</h2>
        <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
          {USAGE_TIPS.map((tip) => (
            <UsageTip
              key={tip.title}
              title={tip.title}
              description={tip.description}
            />
          ))}
        </div>
      </section>

      {/* Tab view */}
      <Tabs value={viewMode} onValueChange={(val) => { if (val) setViewMode(val); }}>
        <TabsList>
          <TabsTrigger value="issuer">{t("benefits", "byIssuer")}</TabsTrigger>
          <TabsTrigger value="category">{t("benefits", "byCategory")}</TabsTrigger>
        </TabsList>

        <TabsContent value="issuer">
          <div className="mt-6 space-y-10">
            {ISSUERS.filter((issuer) => benefitsByIssuer[issuer]).map(
              (issuer) => (
                <div key={issuer}>
                  <h3 className="mb-4 text-xl font-bold">{issuer}</h3>
                  <BenefitList
                    benefits={benefitsByIssuer[issuer]}
                    groupBy="none"
                  />
                </div>
              )
            )}
            {/* Show issuers not in ISSUERS constant */}
            {Object.keys(benefitsByIssuer)
              .filter((k) => !ISSUERS.includes(k as typeof ISSUERS[number]))
              .map((issuer) => (
                <div key={issuer}>
                  <h3 className="mb-4 text-xl font-bold">{issuer}</h3>
                  <BenefitList
                    benefits={benefitsByIssuer[issuer]}
                    groupBy="none"
                  />
                </div>
              ))}
          </div>
        </TabsContent>

        <TabsContent value="category">
          <div className="mt-6 space-y-10">
            {BENEFIT_CATEGORIES.filter(
              (cat) => benefitsByCategory[cat.key]
            ).map((cat) => (
              <div key={cat.key}>
                <h3 className="mb-4 text-xl font-bold">
                  {t("benefitCategories", cat.key)}
                </h3>
                <BenefitList
                  benefits={benefitsByCategory[cat.key]}
                  groupBy="none"
                />
              </div>
            ))}
            {/* Show categories not in BENEFIT_CATEGORIES */}
            {Object.keys(benefitsByCategory)
              .filter(
                (k) => !BENEFIT_CATEGORIES.some((c) => c.key === k)
              )
              .map((cat) => (
                <div key={cat}>
                  <h3 className="mb-4 text-xl font-bold capitalize">{cat}</h3>
                  <BenefitList
                    benefits={benefitsByCategory[cat]}
                    groupBy="none"
                  />
                </div>
              ))}
          </div>
        </TabsContent>
      </Tabs>
    </div>
  );
}
