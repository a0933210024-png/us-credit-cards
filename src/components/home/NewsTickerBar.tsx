"use client";

import Link from "next/link";
import { Newspaper, ArrowRight } from "lucide-react";
import type { NewsUpdate } from "@/lib/types";
import { Badge } from "@/components/ui/badge";
import { useLanguage } from "@/lib/i18n";

interface NewsTickerBarProps {
  news: NewsUpdate[];
}

export default function NewsTickerBar({ news }: NewsTickerBarProps) {
  const { t, language } = useLanguage();

  if (news.length === 0) return null;

  return (
    <section className="mx-auto max-w-7xl px-4 py-12 sm:px-6">
      <div className="mb-6 flex items-center justify-between">
        <h2 className="flex items-center gap-2 text-xl font-bold">
          <Newspaper className="size-5" />
          {t("home", "latestNews")}
        </h2>
        <Link
          href="/news"
          className="flex items-center gap-1 text-sm text-muted-foreground transition-colors hover:text-foreground"
        >
          {t("home", "viewAll")} <ArrowRight className="size-3" />
        </Link>
      </div>

      <div className="space-y-3">
        {news.slice(0, 5).map((item) => {
          const catLabel = t("newsCategories", item.category);
          return (
            <div
              key={item.id}
              className="flex items-start gap-3 rounded-lg border p-4 transition-colors hover:bg-muted/50"
            >
              <Badge variant="secondary" className="mt-0.5 shrink-0 text-xs">
                {catLabel !== item.category ? catLabel : item.category.replace(/_/g, " ")}
              </Badge>
              <div className="flex-1">
                <h3 className="text-sm font-medium">{item.title}</h3>
                <p className="mt-1 text-xs text-muted-foreground line-clamp-1">
                  {item.summary}
                </p>
              </div>
              <time className="shrink-0 text-xs text-muted-foreground">
                {new Date(item.published_at).toLocaleDateString(
                  language === "zh-TW" ? "zh-TW" : "en-US",
                  {
                    month: "short",
                    day: "numeric",
                  }
                )}
              </time>
            </div>
          );
        })}
      </div>
    </section>
  );
}
