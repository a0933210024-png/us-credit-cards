"use client";

import Link from "next/link";
import {
  CreditCard,
  TrendingUp,
  Gift,
  Star,
  ArrowRightLeft,
  Newspaper,
} from "lucide-react";
import { useLanguage } from "@/lib/i18n";

const LINKS = [
  {
    href: "/cards",
    icon: CreditCard,
    titleKey: "cardDatabase",
    descKey: "cardDatabaseDesc",
  },
  {
    href: "/best-cards",
    icon: Star,
    titleKey: "bestCards",
    descKey: "bestCardsDesc",
  },
  {
    href: "/benefits",
    icon: Gift,
    titleKey: "benefitsTracker",
    descKey: "benefitsTrackerDesc",
  },
  {
    href: "/points",
    icon: ArrowRightLeft,
    titleKey: "pointsGuide",
    descKey: "pointsGuideDesc",
  },
  {
    href: "/signup-bonus",
    icon: TrendingUp,
    titleKey: "signupBonuses",
    descKey: "signupBonusesDesc",
  },
  {
    href: "/news",
    icon: Newspaper,
    titleKey: "newsUpdates",
    descKey: "newsUpdatesDesc",
  },
] as const;

export default function QuickLinks() {
  const { t } = useLanguage();

  return (
    <section className="mx-auto max-w-7xl px-4 py-12 sm:px-6">
      <div className="mb-8 text-center">
        <h2 className="text-2xl font-bold sm:text-3xl">{t("home", "explore")}</h2>
        <p className="mt-2 text-muted-foreground">
          {t("home", "exploreSubtitle")}
        </p>
      </div>

      <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
        {LINKS.map((link) => (
          <Link
            key={link.href}
            href={link.href}
            className="group rounded-xl border bg-card p-5 transition-all hover:-translate-y-0.5 hover:shadow-md"
          >
            <div className="flex items-start gap-4">
              <div className="flex size-10 shrink-0 items-center justify-center rounded-lg bg-brand-primary/10 transition-colors group-hover:bg-brand-primary/20 dark:bg-brand-accent/10 dark:group-hover:bg-brand-accent/20">
                <link.icon className="size-5 text-brand-primary dark:text-brand-accent" />
              </div>
              <div>
                <h3 className="font-semibold">{t("quickLinks", link.titleKey)}</h3>
                <p className="mt-1 text-sm text-muted-foreground">
                  {t("quickLinks", link.descKey)}
                </p>
              </div>
            </div>
          </Link>
        ))}
      </div>
    </section>
  );
}
