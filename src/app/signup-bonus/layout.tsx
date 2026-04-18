import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "Sign-up Bonus Rankings | US Card Guide",
  description:
    "Best credit card sign-up bonus offers ranked by estimated value. Includes Chase 5/24 checker and application restriction guides.",
};

export default function SignupBonusLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return children;
}
