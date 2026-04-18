import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "Best Cards by Category | US Card Guide",
  description:
    "Find the best credit card for every spending category: dining, groceries, gas, travel, online shopping, streaming, and more.",
};

export default function BestCardsLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return children;
}
