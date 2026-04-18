import type { Metadata } from "next";
import HeroSection from "@/components/home/HeroSection";
import FeaturedCards from "@/components/home/FeaturedCards";
import NewsTickerBar from "@/components/home/NewsTickerBar";
import QuickLinks from "@/components/home/QuickLinks";
import { getAllCards } from "@/lib/queries/cards";
import { getAllNews } from "@/lib/queries/news";

export const metadata: Metadata = {
  title: "US Card Guide | Find Your Best Credit Card",
  description:
    "Compare US credit cards, maximize sign-up bonuses, and master points strategies. Your one-stop credit card guide.",
};

export default async function HomePage() {
  const [allCards, news] = await Promise.all([getAllCards(), getAllNews()]);

  // Featured cards: filter out business cards, sorted by signup bonus value desc, take top 6
  const featuredCards = [...allCards]
    .filter(
      (card) =>
        !card.card_name.includes("Business") && !card.card_name.includes("Ink")
    )
    .sort(
      (a, b) =>
        (b.signup_bonus_value_estimate ?? 0) -
        (a.signup_bonus_value_estimate ?? 0)
    )
    .slice(0, 6);

  return (
    <>
      <HeroSection />
      <FeaturedCards cards={featuredCards} />
      <QuickLinks />
      <NewsTickerBar news={news} />
    </>
  );
}
