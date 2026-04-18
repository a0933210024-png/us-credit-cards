import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "Credit Card Database | US Card Guide",
  description:
    "Browse and compare all major US credit cards. Filter by issuer, annual fee, card network, and sort by sign-up bonus value.",
};

export default function CardsLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return children;
}
