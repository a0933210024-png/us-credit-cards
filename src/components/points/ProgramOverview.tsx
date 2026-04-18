"use client";

import { Award, ArrowRight } from "lucide-react";
import type { PointsProgram } from "@/lib/types";
import {
  Card,
  CardContent,
  CardHeader,
  CardTitle,
} from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { useLanguage } from "@/lib/i18n";

interface ProgramOverviewProps {
  program: PointsProgram;
  partnerCount?: number;
}

export default function ProgramOverview({
  program,
  partnerCount,
}: ProgramOverviewProps) {
  const { t } = useLanguage();

  return (
    <Card className="transition-all hover:shadow-md">
      <CardHeader>
        <CardTitle className="flex items-center gap-2">
          <Award className="size-5 text-brand-accent" />
          {program.program_name}
        </CardTitle>
      </CardHeader>
      <CardContent className="space-y-4">
        {/* Value info */}
        <div className="grid grid-cols-2 gap-3">
          <div className="rounded-lg bg-muted/50 p-3 text-center">
            <p className="text-xs text-muted-foreground">{t("points", "baseValue")}</p>
            <p className="text-lg font-bold">{program.base_value_cpp} cpp</p>
          </div>
          <div className="rounded-lg bg-brand-accent/10 p-3 text-center">
            <p className="text-xs text-muted-foreground">{t("points", "bestValue")}</p>
            <p className="text-lg font-bold text-brand-accent-text dark:text-brand-accent">
              {program.best_value_cpp} cpp
            </p>
          </div>
        </div>

        {/* Currency */}
        <div className="text-sm">
          <span className="text-muted-foreground">{t("points", "currency")}: </span>
          <span className="font-medium">{program.currency_name}</span>
        </div>

        {/* Transfer partners count */}
        {partnerCount !== undefined && (
          <div className="flex items-center gap-2 text-sm">
            <ArrowRight className="size-4 text-muted-foreground" />
            <span>{partnerCount} {t("points", "transferPartnersCount")}</span>
          </div>
        )}

        {/* Earning cards */}
        {program.earning_cards && program.earning_cards.length > 0 && (
          <div>
            <p className="mb-2 text-xs text-muted-foreground">{t("points", "earningCards")}</p>
            <div className="flex flex-wrap gap-1">
              {program.earning_cards.map((card) => (
                <Badge key={card} variant="outline" className="text-xs">
                  {card}
                </Badge>
              ))}
            </div>
          </div>
        )}
      </CardContent>
    </Card>
  );
}
