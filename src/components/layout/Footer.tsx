"use client";

import Link from "next/link";
import { useLanguage } from "@/lib/i18n";

const QUICK_LINK_KEYS = [
  { href: "/cards", key: "cards" },
  { href: "/best-cards", key: "bestCards" },
  { href: "/benefits", key: "benefits" },
  { href: "/points", key: "points" },
  { href: "/signup-bonus", key: "signupBonus" },
  { href: "/news", key: "news" },
] as const;

export default function Footer() {
  const { t } = useLanguage();

  const ABOUT_LINKS = [
    { href: "/about", label: t("common", "aboutUs") },
    { href: "/privacy", label: t("common", "privacyPolicy") },
    { href: "/terms", label: t("common", "termsOfService") },
  ];

  return (
    <footer className="border-t bg-muted/30">
      <div className="mx-auto max-w-7xl px-4 py-10 sm:px-6">
        <div className="grid gap-8 sm:grid-cols-2 lg:grid-cols-3">
          {/* Quick Links */}
          <div>
            <h3 className="mb-3 text-sm font-semibold">
              {t("common", "quickLinks")}
            </h3>
            <ul className="space-y-2">
              {QUICK_LINK_KEYS.map((link) => (
                <li key={link.href}>
                  <Link
                    href={link.href}
                    className="text-sm text-muted-foreground transition-colors hover:text-foreground"
                  >
                    {t("nav", link.key)}
                  </Link>
                </li>
              ))}
            </ul>
          </div>

          {/* About */}
          <div>
            <h3 className="mb-3 text-sm font-semibold">
              {t("common", "about")}
            </h3>
            <ul className="space-y-2">
              {ABOUT_LINKS.map((link) => (
                <li key={link.href}>
                  <Link
                    href={link.href}
                    className="text-sm text-muted-foreground transition-colors hover:text-foreground"
                  >
                    {link.label}
                  </Link>
                </li>
              ))}
            </ul>
          </div>

          {/* Disclaimer */}
          <div>
            <h3 className="mb-3 text-sm font-semibold">
              {t("common", "disclaimer")}
            </h3>
            <p className="text-xs leading-relaxed text-muted-foreground">
              {t("common", "disclaimerText")}
            </p>
          </div>
        </div>

        <div className="mt-8 border-t pt-6 text-center text-xs text-muted-foreground">
          &copy; 2026 US Card Guide. {t("common", "allRightsReserved")}
        </div>
      </div>
    </footer>
  );
}
