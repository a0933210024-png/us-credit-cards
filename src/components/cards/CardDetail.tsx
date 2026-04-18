"use client";

import type { CreditCard } from "@/lib/types";
import { formatCurrency } from "@/lib/utils";
import { ISSUER_COLORS } from "@/lib/constants";
import CardBadge from "./CardBadge";
import {
  Card,
  CardContent,
  CardHeader,
  CardTitle,
} from "@/components/ui/card";
import { Separator } from "@/components/ui/separator";
import { useLanguage } from "@/lib/i18n";

const ISSUER_GRADIENTS: Record<string, string> = {
  Chase: "linear-gradient(135deg, #0f4c81 0%, #1a6eb5 50%, #2196f3 100%)",
  "American Express": "linear-gradient(135deg, #003f8a 0%, #006fcf 50%, #4da3ff 100%)",
  Amex: "linear-gradient(135deg, #003f8a 0%, #006fcf 50%, #4da3ff 100%)",
  Citi: "linear-gradient(135deg, #001f3f 0%, #003b70 50%, #0066b2 100%)",
  "Capital One": "linear-gradient(135deg, #8b0000 0%, #d03027 50%, #e85d4a 100%)",
  "US Bank": "linear-gradient(135deg, #7b1a2d 0%, #c62828 50%, #9c27b0 100%)",
  "Wells Fargo": "linear-gradient(135deg, #c81632 0%, #e03020 50%, #d4a017 100%)",
  Barclays: "linear-gradient(135deg, #003d6b 0%, #00aeef 50%, #87ceeb 100%)",
  "Bank of America": "linear-gradient(135deg, #b71c1c 0%, #e31837 50%, #c62828 100%)",
  "Apple / Goldman Sachs": "linear-gradient(135deg, #2c2c2c 0%, #555555 50%, #888888 100%)",
  Apple: "linear-gradient(135deg, #2c2c2c 0%, #555555 50%, #888888 100%)",
  Bilt: "linear-gradient(135deg, #000000 0%, #1a1a1a 50%, #333333 100%)",
};

const CARD_GRADIENTS: Record<string, string> = {
  "amex-platinum": "linear-gradient(135deg, #4a4a4a 0%, #7c7c7c 40%, #b0b0b0 70%, #8a8a8a 100%)",
  "amex-gold": "linear-gradient(135deg, #8b6914 0%, #c9a84c 40%, #e6c65c 70%, #a07c1c 100%)",
  "amex-green": "linear-gradient(135deg, #1a5c2a 0%, #2e8b3e 50%, #4caf50 100%)",
  "chase-sapphire-reserve": "linear-gradient(135deg, #0a1628 0%, #162d50 40%, #1e3a5f 70%, #0f2341 100%)",
  "chase-sapphire-preferred": "linear-gradient(135deg, #0f3460 0%, #1a5276 50%, #2980b9 100%)",
  "amex-hilton-aspire": "linear-gradient(135deg, #1a1a2e 0%, #2d2d5e 50%, #4a4a8a 100%)",
  "amex-hilton-surpass": "linear-gradient(135deg, #2c1810 0%, #5c3a28 50%, #8b5e3c 100%)",
  "amex-delta-reserve": "linear-gradient(135deg, #1a0a2e 0%, #3d1f6d 50%, #5e35b1 100%)",
  "amex-marriott-brilliant": "linear-gradient(135deg, #2c0a0a 0%, #6d1f1f 50%, #b71c1c 100%)",
  "capital-one-venture-x": "linear-gradient(135deg, #1a1a1a 0%, #3d0000 40%, #6d1010 70%, #2a0505 100%)",
  "bilt-palladium": "linear-gradient(135deg, #0a0a0a 0%, #2a2a2a 30%, #4a4a4a 60%, #1a1a1a 100%)",
  "bilt-obsidian": "linear-gradient(135deg, #0f0f0f 0%, #1a1a2e 50%, #252540 100%)",
};

function CardNetworkLogo({ network }: { network: string }) {
  if (network === "Visa") {
    return <span className="text-lg font-bold italic text-white tracking-wider">VISA</span>;
  }
  if (network === "Mastercard") {
    return (
      <span className="flex items-center">
        <span className="inline-block h-6 w-6 rounded-full bg-red-500 opacity-90" />
        <span className="inline-block h-6 w-6 rounded-full bg-yellow-500 opacity-90 -ml-3" />
      </span>
    );
  }
  if (network === "American Express") {
    return <span className="text-sm font-bold text-white tracking-widest">AMEX</span>;
  }
  return <span className="text-sm font-semibold text-white/80">{network}</span>;
}

interface CardDetailProps {
  card: CreditCard;
}

export default function CardDetail({ card }: CardDetailProps) {
  const issuerColor = ISSUER_COLORS[card.issuer] || "#1a365d";
  const gradient = CARD_GRADIENTS[card.slug] || ISSUER_GRADIENTS[card.issuer] || `linear-gradient(135deg, ${issuerColor} 0%, ${issuerColor}bb 100%)`;
  const { t } = useLanguage();

  return (
    <div className="space-y-6">
      {/* Hero section - credit card style */}
      <div className="flex flex-col gap-6 sm:flex-row sm:items-start">
        {/* Card face */}
        <div
          className="w-full sm:w-80 shrink-0 aspect-[1.586] rounded-xl shadow-lg"
          style={{ background: gradient }}
        >
          <div className="flex h-full flex-col justify-between p-5">
            {/* Top: chip */}
            <div>
              <div className="w-10 h-7 rounded-sm bg-gradient-to-br from-yellow-300 to-amber-400 shadow-sm border border-yellow-500/30" />
            </div>
            {/* Middle: card name and issuer */}
            <div>
              <p className="text-xs font-medium text-white/60 uppercase tracking-wider">{card.issuer}</p>
              <h1 className="text-lg font-bold text-white mt-1 leading-tight">
                {card.card_name}
              </h1>
            </div>
            {/* Bottom: network logo */}
            <div className="flex justify-end items-end">
              <CardNetworkLogo network={card.card_network} />
            </div>
          </div>
        </div>

        {/* Card info beside the card face */}
        <div className="flex flex-col justify-between gap-3">
          <div>
            <div className="flex flex-wrap gap-2">
              <CardBadge type="annual-fee" value={card.annual_fee} />
              <CardBadge type="network" value={card.card_network} />
              {card.annual_fee_waived_first_year && (
                <CardBadge type="new" value={t("cards", "firstYearWaived")} />
              )}
            </div>
          </div>
          {card.apply_url && (
            <a
              href={card.apply_url}
              target="_blank"
              rel="noopener noreferrer"
              className="inline-flex items-center rounded-lg bg-brand-primary px-6 py-2.5 text-sm font-semibold text-white shadow transition-colors hover:bg-brand-primary/90"
            >
              {t("cards", "applyNow")}
            </a>
          )}
        </div>
      </div>

      {/* Basic Info */}
      <Card>
        <CardHeader>
          <CardTitle>{t("cards", "basicInfo")}</CardTitle>
        </CardHeader>
        <CardContent>
          <dl className="grid gap-4 sm:grid-cols-2">
            <div>
              <dt className="text-sm text-muted-foreground">{t("cards", "annualFee")}</dt>
              <dd className="font-medium">
                {formatCurrency(card.annual_fee)}
                {card.annual_fee_waived_first_year && ` ${t("cards", "firstYearWaived")}`}
              </dd>
            </div>
            <div>
              <dt className="text-sm text-muted-foreground">{t("cards", "cardNetwork")}</dt>
              <dd className="font-medium">{card.card_network}</dd>
            </div>
            <div>
              <dt className="text-sm text-muted-foreground">
                {t("cards", "foreignTxFee")}
              </dt>
              <dd className="font-medium">
                {card.foreign_transaction_fee === 0
                  ? t("cards", "none")
                  : `${card.foreign_transaction_fee}%`}
              </dd>
            </div>
            <div>
              <dt className="text-sm text-muted-foreground">
                {t("cards", "creditScore")}
              </dt>
              <dd className="font-medium">{card.credit_score_recommended}</dd>
            </div>
          </dl>
        </CardContent>
      </Card>

      {/* Sign-up Bonus */}
      {card.signup_bonus_description && (
        <Card>
          <CardHeader>
            <CardTitle>{t("cards", "signupBonus")}</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="rounded-lg bg-brand-accent/10 p-4">
              <p className="font-medium">{card.signup_bonus_description}</p>
              <div className="mt-3 grid gap-2 text-sm sm:grid-cols-3">
                <div>
                  <span className="text-muted-foreground">{t("cards", "estimatedValue")}: </span>
                  <span className="font-semibold">
                    {formatCurrency(card.signup_bonus_value_estimate)}
                  </span>
                </div>
                <div>
                  <span className="text-muted-foreground">{t("cards", "spendRequirement")}: </span>
                  <span className="font-semibold">
                    {formatCurrency(card.signup_bonus_spend_requirement)}
                  </span>
                </div>
                <div>
                  <span className="text-muted-foreground">{t("cards", "timeLimit")}: </span>
                  <span className="font-semibold">
                    {card.signup_bonus_time_limit_months} {t("cards", "months")}
                  </span>
                </div>
              </div>
            </div>
          </CardContent>
        </Card>
      )}

      {/* Earning Rates */}
      {card.earning_rates && Object.keys(card.earning_rates).length > 0 && (
        <Card>
          <CardHeader>
            <CardTitle>{t("cards", "earningRates")}</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="grid gap-3 sm:grid-cols-2 lg:grid-cols-3">
              {Object.entries(card.earning_rates).map(([category, rate]) => (
                <div
                  key={category}
                  className="flex items-center justify-between rounded-lg border px-4 py-3"
                >
                  <span className="text-sm capitalize">
                    {category.replace(/_/g, " ")}
                  </span>
                  <span className="font-bold text-brand-primary dark:text-brand-accent-light">
                    {rate}
                  </span>
                </div>
              ))}
            </div>
          </CardContent>
        </Card>
      )}

      {/* Benefits */}
      {card.benefits && card.benefits.length > 0 && (
        <Card>
          <CardHeader>
            <CardTitle>{t("cards", "benefitsDetails")}</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="space-y-4">
              {card.benefits.map((benefit, i) => (
                <div key={benefit.id || i}>
                  {i > 0 && <Separator className="mb-4" />}
                  <div className="flex items-start justify-between gap-4">
                    <div>
                      <h4 className="font-medium">{benefit.benefit_name}</h4>
                      <p className="mt-1 text-sm text-muted-foreground">
                        {benefit.benefit_description}
                      </p>
                      {benefit.recommended_usage && (
                        <p className="mt-1 text-xs text-brand-accent-text dark:text-brand-accent">
                          {t("cards", "tip")}: {benefit.recommended_usage}
                        </p>
                      )}
                    </div>
                    {benefit.benefit_value > 0 && (
                      <span className="shrink-0 text-sm font-semibold">
                        {formatCurrency(benefit.benefit_value)}
                      </span>
                    )}
                  </div>
                </div>
              ))}
            </div>
          </CardContent>
        </Card>
      )}

      {/* Application Rules */}
      {card.application_rules && (
        <Card>
          <CardHeader>
            <CardTitle>{t("cards", "applicationRules")}</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="rounded-lg border-l-4 border-brand-accent bg-muted/50 p-4">
              <p className="font-medium">{card.application_rules.rule_name}</p>
              <p className="mt-1 text-sm text-muted-foreground">
                {card.application_rules.description}
              </p>
            </div>
          </CardContent>
        </Card>
      )}
    </div>
  );
}
