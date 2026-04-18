"use client";

import { Badge } from "@/components/ui/badge";
import { cn } from "@/lib/utils";
import { useLanguage } from "@/lib/i18n";

interface CardBadgeProps {
  type: "annual-fee" | "issuer" | "hot" | "new" | "network";
  value: string | number;
  className?: string;
}

export default function CardBadge({ type, value, className }: CardBadgeProps) {
  const { t } = useLanguage();

  switch (type) {
    case "annual-fee": {
      const fee = typeof value === "number" ? value : parseInt(String(value), 10);
      const isNoFee = fee === 0;
      return (
        <Badge
          variant={isNoFee ? "secondary" : "outline"}
          className={cn(
            isNoFee && "bg-green-100 text-green-800 dark:bg-green-900/30 dark:text-green-400",
            className
          )}
        >
          {isNoFee ? t("cards", "noAnnualFee") : `$${fee}/yr`}
        </Badge>
      );
    }
    case "issuer":
      return (
        <Badge variant="outline" className={className}>
          {String(value)}
        </Badge>
      );
    case "hot":
      return (
        <Badge
          className={cn(
            "bg-red-500 text-white dark:bg-red-600",
            className
          )}
        >
          {t("cards", "hot")}
        </Badge>
      );
    case "new":
      return (
        <Badge
          className={cn(
            "bg-brand-accent-text text-white dark:bg-brand-accent-light dark:text-gray-900",
            className
          )}
        >
          {String(value)}
        </Badge>
      );
    case "network":
      return (
        <Badge variant="secondary" className={className}>
          {String(value)}
        </Badge>
      );
    default:
      return null;
  }
}
