"use client";

import { useState } from "react";
import { Calculator } from "lucide-react";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import {
  Select,
  SelectTrigger,
  SelectValue,
  SelectContent,
  SelectItem,
} from "@/components/ui/select";
import {
  Card,
  CardContent,
  CardHeader,
  CardTitle,
} from "@/components/ui/card";
import { POINTS_PROGRAMS } from "@/lib/constants";
import { formatCurrency, formatPoints } from "@/lib/utils";
import { useLanguage } from "@/lib/i18n";

// Base CPP values for estimation
const BASE_CPP: Record<string, { base: number; best: number }> = {
  chase_ur: { base: 1.25, best: 2.0 },
  amex_mr: { base: 1.0, best: 2.0 },
  citi_typ: { base: 1.0, best: 1.7 },
  capital_one: { base: 1.0, best: 1.5 },
  bilt: { base: 1.25, best: 2.0 },
};

export default function PointsCalculator() {
  const [program, setProgram] = useState<string>(POINTS_PROGRAMS[0].key);
  const [points, setPoints] = useState<number>(50000);
  const { t } = useLanguage();

  const cpp = BASE_CPP[program] || { base: 1.0, best: 1.5 };
  const baseValue = (points * cpp.base) / 100;
  const bestValue = (points * cpp.best) / 100;

  const selectedProgram = POINTS_PROGRAMS.find((p) => p.key === program);

  return (
    <Card>
      <CardHeader>
        <CardTitle className="flex items-center gap-2">
          <Calculator className="size-5" />
          {t("points", "calculator")}
        </CardTitle>
      </CardHeader>
      <CardContent className="space-y-4">
        {/* Program select */}
        <div className="space-y-2">
          <Label>{t("points", "pointsProgram")}</Label>
          <Select value={program} onValueChange={(val) => { if (val) setProgram(val); }}>
            <SelectTrigger>
              <SelectValue />
            </SelectTrigger>
            <SelectContent>
              {POINTS_PROGRAMS.map((p) => (
                <SelectItem key={p.key} value={p.key}>
                  {p.name}
                </SelectItem>
              ))}
            </SelectContent>
          </Select>
        </div>

        {/* Points input */}
        <div className="space-y-2">
          <Label>{t("points", "numberOfPoints")}</Label>
          <Input
            type="number"
            value={points}
            onChange={(e) => setPoints(parseInt(e.target.value) || 0)}
            min={0}
            step={1000}
          />
        </div>

        {/* Results */}
        <div className="rounded-lg bg-muted/50 p-4">
          <p className="text-sm font-medium text-muted-foreground">
            {selectedProgram?.name} - {formatPoints(points)} points
          </p>
          <div className="mt-3 grid grid-cols-2 gap-4">
            <div>
              <p className="text-xs text-muted-foreground">{t("points", "baseValue")} ({cpp.base} cpp)</p>
              <p className="text-xl font-bold">{formatCurrency(baseValue)}</p>
            </div>
            <div>
              <p className="text-xs text-muted-foreground">
                {t("points", "bestValue")} ({cpp.best} cpp)
              </p>
              <p className="text-xl font-bold text-brand-accent-text dark:text-brand-accent">
                {formatCurrency(bestValue)}
              </p>
            </div>
          </div>
        </div>
      </CardContent>
    </Card>
  );
}
