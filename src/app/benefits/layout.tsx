import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "Benefits Tracker | US Card Guide",
  description:
    "Track and maximize your credit card benefits. View all card benefits by issuer or category, and never miss a valuable perk.",
};

export default function BenefitsLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return children;
}
