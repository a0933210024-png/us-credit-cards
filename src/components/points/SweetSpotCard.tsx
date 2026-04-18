"use client";

import { Plane, Star } from "lucide-react";
import type { SweetSpot } from "@/lib/types";
import { formatPoints, formatCurrency } from "@/lib/utils";
import { Badge } from "@/components/ui/badge";
import { cn } from "@/lib/utils";
import { useLanguage } from "@/lib/i18n";

interface SweetSpotCardProps {
  sweetSpot: SweetSpot;
}

function getCppColor(cpp: number): string {
  if (cpp >= 2) return "text-green-600 dark:text-green-400";
  if (cpp >= 1.5) return "text-yellow-600 dark:text-yellow-400";
  return "text-muted-foreground";
}

function getCppBg(cpp: number): string {
  if (cpp >= 2) return "bg-green-100 dark:bg-green-900/30";
  if (cpp >= 1.5) return "bg-yellow-100 dark:bg-yellow-900/30";
  return "bg-muted";
}

function getDifficultyVariant(
  difficulty: string
): "secondary" | "outline" | "destructive" {
  switch (difficulty) {
    case "easy":
      return "secondary";
    case "medium":
      return "outline";
    case "hard":
      return "destructive";
    default:
      return "outline";
  }
}

export default function SweetSpotCard({ sweetSpot }: SweetSpotCardProps) {
  const { t } = useLanguage();

  const difficultyLabel =
    sweetSpot.difficulty === "easy"
      ? t("points", "easy")
      : sweetSpot.difficulty === "medium"
      ? t("points", "medium")
      : t("points", "hard");

  return (
    <div className="overflow-hidden rounded-xl border bg-card transition-all hover:shadow-md">
      {/* Header */}
      <div className="flex items-start justify-between border-b px-4 py-3">
        <div className="flex items-center gap-2">
          <Plane className="size-4 text-brand-primary dark:text-brand-accent" />
          <h3 className="font-semibold">{sweetSpot.route_name}</h3>
        </div>
        <Badge variant={getDifficultyVariant(sweetSpot.difficulty)}>
          {difficultyLabel}
        </Badge>
      </div>

      {/* Body */}
      <div className="space-y-3 p-4">
        <div className="grid grid-cols-3 gap-3 text-center">
          <div>
            <p className="text-xs text-muted-foreground">{t("points", "pointsRequired")}</p>
            <p className="text-lg font-bold">
              {formatPoints(sweetSpot.points_required)}
            </p>
          </div>
          <div>
            <p className="text-xs text-muted-foreground">{t("points", "estimatedValue")}</p>
            <p className="text-lg font-bold">
              {formatCurrency(sweetSpot.estimated_cash_value)}
            </p>
          </div>
          <div>
            <p className="text-xs text-muted-foreground">CPP</p>
            <p
              className={cn(
                "text-lg font-bold",
                getCppColor(sweetSpot.cpp_value)
              )}
            >
              {sweetSpot.cpp_value.toFixed(1)}
            </p>
          </div>
        </div>

        {/* CPP indicator */}
        <div
          className={cn(
            "flex items-center gap-2 rounded-lg px-3 py-2",
            getCppBg(sweetSpot.cpp_value)
          )}
        >
          <Star
            className={cn(
              "size-4",
              sweetSpot.cpp_value >= 2
                ? "fill-green-500 text-green-500"
                : sweetSpot.cpp_value >= 1.5
                ? "fill-yellow-500 text-yellow-500"
                : "text-muted-foreground"
            )}
          />
          <span className={cn("text-xs font-medium", getCppColor(sweetSpot.cpp_value))}>
            {sweetSpot.cpp_value >= 2
              ? t("points", "excellentValue")
              : sweetSpot.cpp_value >= 1.5
              ? t("points", "goodValue")
              : t("points", "fairValue")}
          </span>
        </div>

        {/* Info */}
        <div className="space-y-2 text-sm">
          <div>
            <span className="text-muted-foreground">{t("points", "program")}: </span>
            <span>{sweetSpot.points_program}</span>
          </div>
          <div>
            <span className="text-muted-foreground">{t("points", "transferTo")}: </span>
            <span>{sweetSpot.transfer_to}</span>
          </div>
          <p className="text-muted-foreground">{sweetSpot.description}</p>
          {sweetSpot.tips && (
            <p className="text-xs text-brand-accent-text dark:text-brand-accent-light">
              {t("points", "tip")}: {sweetSpot.tips}
            </p>
          )}
        </div>
      </div>
    </div>
  );
}
