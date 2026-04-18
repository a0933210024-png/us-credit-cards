"use client";

import { useState, useMemo } from "react";
import { Newspaper, ExternalLink } from "lucide-react";
import { Tabs, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { Badge } from "@/components/ui/badge";
import type { NewsUpdate } from "@/lib/types";
import { NEWS_CATEGORIES } from "@/lib/constants";
import { useLanguage } from "@/lib/i18n";

// Sample news data for static fallback when no Supabase
const SAMPLE_NEWS: NewsUpdate[] = [
  {
    id: "news-1",
    title: "Chase Sapphire Preferred 60K UR sign-up bonus available",
    summary:
      "Chase Sapphire Preferred is currently offering 60,000 Ultimate Rewards points after spending $4,000 in the first 3 months. This is one of the best ongoing offers for this card.",
    category: "signup_bonus_change",
    published_at: "2026-03-10T00:00:00Z",
    source_name: "Chase",
  },
  {
    id: "news-2",
    title: "Amex Gold Card adds new streaming credits",
    summary:
      "American Express Gold Card now includes up to $7/month in streaming service credits, applicable to services like Disney+, Hulu, and ESPN+.",
    category: "benefit_change",
    published_at: "2026-03-05T00:00:00Z",
    source_name: "American Express",
  },
  {
    id: "news-3",
    title: "Capital One opens new airport lounge at DFW",
    summary:
      "Capital One has opened a new Capital One Lounge at Dallas/Fort Worth International Airport, available to Venture X cardholders and their guests.",
    category: "new_card",
    published_at: "2026-02-28T00:00:00Z",
    source_name: "Capital One",
  },
  {
    id: "news-4",
    title: "Citi Strata Premier limited-time 75K TYP offer",
    summary:
      "Citi is offering a limited-time sign-up bonus of 75,000 ThankYou Points for the Strata Premier card, up from the standard 60,000 points.",
    category: "limited_offer",
    published_at: "2026-02-20T00:00:00Z",
    source_name: "Citi",
  },
  {
    id: "news-5",
    title: "Hyatt award chart changes coming in April",
    summary:
      "World of Hyatt is implementing dynamic pricing for award stays starting April 2026. Some properties may require more points during peak periods.",
    category: "devaluation",
    published_at: "2026-02-15T00:00:00Z",
    source_name: "World of Hyatt",
  },
];

export default function NewsPage() {
  const { t, language } = useLanguage();
  const news = SAMPLE_NEWS;
  const [activeCategory, setActiveCategory] = useState<string>("all");

  const filteredNews = useMemo(() => {
    if (activeCategory === "all") return news;
    return news.filter((n) => n.category === activeCategory);
  }, [news, activeCategory]);

  return (
    <div className="mx-auto max-w-4xl px-4 py-8 sm:px-6">
      <div className="mb-8">
        <h1 className="flex items-center gap-2 text-2xl font-bold sm:text-3xl">
          <Newspaper className="size-7" />
          {t("news", "pageTitle")}
        </h1>
        <p className="mt-2 text-muted-foreground">
          {t("news", "pageSubtitle")}
        </p>
      </div>

      {/* Category filter tabs */}
      <Tabs
        value={activeCategory}
        onValueChange={(val) => {
          if (val) setActiveCategory(val);
        }}
      >
        <TabsList className="mb-6 flex-wrap">
          <TabsTrigger value="all">{t("news", "all")}</TabsTrigger>
          {NEWS_CATEGORIES.map((cat) => (
            <TabsTrigger key={cat.key} value={cat.key}>
              {t("newsCategories", cat.key)}
            </TabsTrigger>
          ))}
        </TabsList>
      </Tabs>

      {/* News list */}
      <div className="space-y-4">
        {filteredNews.map((item) => {
          const catLabel = t("newsCategories", item.category);
          return (
            <article
              key={item.id}
              className="rounded-xl border bg-card p-5 transition-all hover:shadow-md"
            >
              <div className="flex items-start justify-between gap-4">
                <div className="flex-1">
                  <div className="mb-2 flex flex-wrap items-center gap-2">
                    <Badge
                      variant="secondary"
                      className="text-xs"
                    >
                      {catLabel !== item.category ? catLabel : item.category.replace(/_/g, " ")}
                    </Badge>
                    <time className="text-xs text-muted-foreground">
                      {new Date(item.published_at).toLocaleDateString(
                        language === "zh-TW" ? "zh-TW" : "en-US",
                        {
                          year: "numeric",
                          month: "long",
                          day: "numeric",
                        }
                      )}
                    </time>
                  </div>
                  <h2 className="text-lg font-semibold">{item.title}</h2>
                  <p className="mt-2 text-sm text-muted-foreground">
                    {item.summary}
                  </p>
                  {item.source_name && (
                    <p className="mt-2 text-xs text-muted-foreground">
                      {t("news", "source")}: {item.source_name}
                    </p>
                  )}
                </div>
                {item.source_url && (
                  <a
                    href={item.source_url}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="shrink-0 text-muted-foreground hover:text-foreground"
                  >
                    <ExternalLink className="size-4" />
                  </a>
                )}
              </div>
            </article>
          );
        })}

        {filteredNews.length === 0 && (
          <div className="py-12 text-center text-muted-foreground">
            {t("news", "noNews")}
          </div>
        )}
      </div>
    </div>
  );
}
