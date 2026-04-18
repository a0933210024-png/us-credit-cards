"use client";

import Link from "next/link";
import type { CreditCard } from "@/lib/types";
import { formatCurrency } from "@/lib/utils";
import { ISSUER_COLORS } from "@/lib/constants";
import CardBadge from "./CardBadge";
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

// Per-card gradient overrides for visual distinction within the same issuer
const CARD_GRADIENTS: Record<string, string> = {
  "amex-platinum": "linear-gradient(135deg, #4a4a4a 0%, #7c7c7c 40%, #b0b0b0 70%, #8a8a8a 100%)", // Signature silver/platinum
  "amex-gold": "linear-gradient(135deg, #8b6914 0%, #c9a84c 40%, #e6c65c 70%, #a07c1c 100%)", // Gold
  "amex-green": "linear-gradient(135deg, #1a5c2a 0%, #2e8b3e 50%, #4caf50 100%)", // Green
  "chase-sapphire-reserve": "linear-gradient(135deg, #0a1628 0%, #162d50 40%, #1e3a5f 70%, #0f2341 100%)", // Dark navy
  "chase-sapphire-preferred": "linear-gradient(135deg, #0f3460 0%, #1a5276 50%, #2980b9 100%)", // Sapphire blue
  "amex-hilton-aspire": "linear-gradient(135deg, #1a1a2e 0%, #2d2d5e 50%, #4a4a8a 100%)", // Dark purple
  "amex-hilton-surpass": "linear-gradient(135deg, #2c1810 0%, #5c3a28 50%, #8b5e3c 100%)", // Bronze
  "amex-delta-reserve": "linear-gradient(135deg, #1a0a2e 0%, #3d1f6d 50%, #5e35b1 100%)", // Deep purple
  "amex-marriott-brilliant": "linear-gradient(135deg, #2c0a0a 0%, #6d1f1f 50%, #b71c1c 100%)", // Deep red
  "capital-one-venture-x": "linear-gradient(135deg, #1a1a1a 0%, #3d0000 40%, #6d1010 70%, #2a0505 100%)", // Dark premium
  "bilt-palladium": "linear-gradient(135deg, #0a0a0a 0%, #2a2a2a 30%, #4a4a4a 60%, #1a1a1a 100%)", // Dark premium
  "bilt-obsidian": "linear-gradient(135deg, #0f0f0f 0%, #1a1a2e 50%, #252540 100%)", // Obsidian dark blue-black
};

function CardNetworkLogo({ network }: { network: string }) {
  if (network === "Visa") {
    return <span className="text-sm font-bold italic text-white tracking-wider">VISA</span>;
  }
  if (network === "Mastercard") {
    return (
      <span className="flex items-center gap-[-4px]">
        <span className="inline-block h-4 w-4 rounded-full bg-red-500 opacity-90" />
        <span className="inline-block h-4 w-4 rounded-full bg-yellow-500 opacity-90 -ml-2" />
      </span>
    );
  }
  if (network === "American Express") {
    return <span className="text-[10px] font-bold text-white tracking-widest">AMEX</span>;
  }
  return <span className="text-xs font-semibold text-white/80">{network}</span>;
}

interface CardItemProps {
  card: CreditCard;
}

function getOfferDaysLeft(offerExpiresAt?: string): number | null {
  if (!offerExpiresAt) return null;
  const diff = new Date(offerExpiresAt).getTime() - Date.now();
  return Math.ceil(diff / (1000 * 60 * 60 * 24));
}

export default function CardItem({ card }: CardItemProps) {
  const issuerColor = ISSUER_COLORS[card.issuer] || "#1a365d";
  const gradient = CARD_GRADIENTS[card.slug] || ISSUER_GRADIENTS[card.issuer] || `linear-gradient(135deg, ${issuerColor} 0%, ${issuerColor}99 50%, ${issuerColor}66 100%)`;
  const { t } = useLanguage();

  const statusLabel =
    card.status === "discontinued"
      ? t("cards", "statusDiscontinued")
      : card.status === "closed_to_new"
        ? t("cards", "statusClosedToNew")
        : card.status === "issuer_transition"
          ? t("cards", "statusIssuerTransition")
          : null;

  const daysLeft = getOfferDaysLeft(card.offer_expires_at);
  const isDeprioritized = card.status === "discontinued" || card.status === "closed_to_new";

  return (
    <Link href={`/cards/${card.slug}`} className="group block">
      <div className={`overflow-hidden rounded-xl border bg-card text-card-foreground shadow-sm transition-all duration-200 hover:-translate-y-1 hover:shadow-lg ${isDeprioritized ? "opacity-75" : ""}`}>
        {/* Credit card face */}
        <div
          className="relative w-full aspect-[1.586]"
          style={{ background: gradient }}
        >
          {statusLabel && (
            <span className="absolute right-2 top-2 rounded-md bg-black/70 px-2 py-0.5 text-[10px] font-semibold text-white backdrop-blur-sm">
              {statusLabel}
            </span>
          )}
          <div className="flex h-full flex-col justify-between p-4">
            {/* Top: chip */}
            <div>
              <div className="w-8 h-6 rounded-sm bg-gradient-to-br from-yellow-300 to-amber-400 shadow-sm border border-yellow-500/30" />
            </div>
            {/* Middle: card name and issuer */}
            <div className="flex-1 flex flex-col justify-center">
              <p className="text-[10px] font-medium text-white/60 uppercase tracking-wider">{card.issuer}</p>
              <h3 className="text-sm font-bold text-white line-clamp-2 mt-0.5 leading-tight">
                {card.card_name}
              </h3>
            </div>
            {/* Bottom: network logo */}
            <div className="flex justify-end items-end">
              <CardNetworkLogo network={card.card_network} />
            </div>
          </div>
        </div>

        {/* Card info */}
        <div className="space-y-3 p-4">
          <div className="flex flex-wrap items-center gap-1.5">
            <CardBadge type="annual-fee" value={card.annual_fee} />
            <CardBadge type="network" value={card.card_network} />
          </div>

          {/* Key selling points */}
          {card.key_benefits && card.key_benefits.length > 0 && (
            <ul className="space-y-1">
              {card.key_benefits.slice(0, 2).map((benefit, i) => (
                <li
                  key={i}
                  className="text-xs text-muted-foreground line-clamp-1"
                >
                  {benefit}
                </li>
              ))}
            </ul>
          )}

          {/* Sign-up bonus */}
          {card.signup_bonus_description && (
            <div className="rounded-md bg-brand-accent/10 px-3 py-2">
              <p className="text-xs font-medium text-brand-accent-text dark:text-brand-accent-light line-clamp-2">
                {t("cards", "signupBonus")}: {formatCurrency(card.signup_bonus_value_estimate)} {t("signupBonus", "estimatedValue")}
              </p>
              {daysLeft !== null && daysLeft > 0 && daysLeft <= 30 && (
                <p className="mt-1 text-[10px] font-medium text-orange-600 dark:text-orange-400">
                  ⏰ {t("cards", "offerExpiresSoon")} {daysLeft} {t("cards", "days")}
                </p>
              )}
              {daysLeft !== null && daysLeft <= 0 && (
                <p className="mt-1 text-[10px] font-medium text-red-600 dark:text-red-400">
                  {t("cards", "offerExpired")}
                </p>
              )}
            </div>
          )}
        </div>
      </div>
    </Link>
  );
}
