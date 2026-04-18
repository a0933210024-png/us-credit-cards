import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "News & Updates | US Card Guide",
  description:
    "Latest credit card news, sign-up bonus changes, new card launches, benefit updates, and limited-time offers.",
};

export default function NewsLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return children;
}
