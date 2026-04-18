"use client";

import Link from "next/link";
import { CreditCard, TrendingUp, Gift } from "lucide-react";
import { Button } from "@/components/ui/button";
import { useLanguage } from "@/lib/i18n";

export default function HeroSection() {
  const { t } = useLanguage();

  return (
    <section className="relative overflow-hidden bg-gradient-to-br from-brand-primary via-brand-primary-light to-brand-primary-light">
      {/* Background decoration */}
      <div className="absolute inset-0 bg-[radial-gradient(circle_at_30%_50%,rgba(201,168,76,0.1),transparent_50%)]" />

      <div className="relative mx-auto max-w-7xl px-4 py-16 sm:px-6 sm:py-24">
        <div className="mx-auto max-w-2xl text-center">
          <h1 className="text-3xl font-bold text-white sm:text-4xl lg:text-5xl">
            {t("home", "heroTitle")}
          </h1>
          <p className="mt-4 text-lg text-white/80">
            {t("home", "heroSubtitle")}
          </p>

          {/* Quick entry buttons */}
          <div className="mt-8 flex flex-col gap-3 sm:flex-row sm:justify-center">
            <Link href="/cards">
              <Button
                size="lg"
                className="w-full bg-white text-brand-primary hover:bg-white/90 sm:w-auto"
              >
                <CreditCard className="mr-2 size-4" />
                {t("home", "browseCards")}
              </Button>
            </Link>
            <Link href="/signup-bonus">
              <Button
                size="lg"
                variant="outline"
                className="w-full border-white/30 text-white hover:bg-white/10 sm:w-auto"
              >
                <Gift className="mr-2 size-4" />
                {t("home", "signupBonuses")}
              </Button>
            </Link>
            <Link href="/points">
              <Button
                size="lg"
                variant="outline"
                className="w-full border-white/30 text-white hover:bg-white/10 sm:w-auto"
              >
                <TrendingUp className="mr-2 size-4" />
                {t("home", "pointsGuide")}
              </Button>
            </Link>
          </div>
        </div>
      </div>
    </section>
  );
}
