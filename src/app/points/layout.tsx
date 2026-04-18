import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "Points Transfer Guide | US Card Guide",
  description:
    "Explore the 5 major points programs, transfer partners, sweet spots, and a points value calculator. Master your credit card points strategy.",
};

export default function PointsLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return children;
}
