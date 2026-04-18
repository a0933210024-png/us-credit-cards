"use client";

import { useState } from "react";
import { Filter, Search, X } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Checkbox } from "@/components/ui/checkbox";
import { Slider } from "@/components/ui/slider";
import {
  Sheet,
  SheetTrigger,
  SheetContent,
  SheetHeader,
  SheetTitle,
} from "@/components/ui/sheet";
import { ISSUERS, CARD_NETWORKS } from "@/lib/constants";
import type { CardFilters } from "@/lib/types";
import { useLanguage } from "@/lib/i18n";

interface CardFilterProps {
  filters: CardFilters;
  onFilterChange: (filters: CardFilters) => void;
}

function FilterContent({ filters, onFilterChange }: CardFilterProps) {
  const { t } = useLanguage();

  return (
    <div className="space-y-6">
      {/* Search */}
      <div>
        <label className="mb-2 block text-sm font-medium">{t("cards", "search")}</label>
        <div className="relative">
          <Search className="absolute left-2.5 top-1/2 size-4 -translate-y-1/2 text-muted-foreground" />
          <Input
            placeholder={t("cards", "searchCards")}
            value={filters.searchQuery}
            onChange={(e) =>
              onFilterChange({ ...filters, searchQuery: e.target.value })
            }
            className="pl-8"
          />
        </div>
      </div>

      {/* Card Type */}
      <div>
        <label className="mb-2 block text-sm font-medium">{t("cards", "cardType")}</label>
        <div className="flex gap-1">
          {(["all", "personal", "business"] as const).map((type) => (
            <button
              key={type}
              onClick={() => onFilterChange({ ...filters, cardType: type })}
              className={`rounded-md px-3 py-1.5 text-sm font-medium transition-colors ${
                filters.cardType === type
                  ? "bg-brand-primary text-white"
                  : "bg-muted text-muted-foreground hover:bg-muted/80"
              }`}
            >
              {t("cards", type === "all" ? "cardTypeAll" : type === "personal" ? "cardTypePersonal" : "cardTypeBusiness")}
            </button>
          ))}
        </div>
      </div>

      {/* Issuer */}
      <div>
        <label className="mb-2 block text-sm font-medium">{t("cards", "issuer")}</label>
        <div className="space-y-2">
          {ISSUERS.map((issuer) => (
            <label key={issuer} className="flex items-center gap-2 text-sm">
              <Checkbox
                checked={filters.issuers.includes(issuer)}
                onCheckedChange={(checked) => {
                  const next = checked
                    ? [...filters.issuers, issuer]
                    : filters.issuers.filter((i) => i !== issuer);
                  onFilterChange({ ...filters, issuers: next });
                }}
              />
              {issuer}
            </label>
          ))}
        </div>
      </div>

      {/* Annual Fee Range */}
      <div>
        <label className="mb-2 block text-sm font-medium">
          {t("cards", "maxAnnualFee")}: ${filters.maxAnnualFee}
        </label>
        <Slider
          value={[filters.maxAnnualFee]}
          onValueChange={(val) =>
            onFilterChange({
              ...filters,
              maxAnnualFee: Array.isArray(val) ? val[0] : val,
            })
          }
          min={0}
          max={1000}
          step={5}
        />
      </div>

      {/* Card Network */}
      <div>
        <label className="mb-2 block text-sm font-medium">{t("cards", "cardNetwork")}</label>
        <div className="space-y-2">
          {CARD_NETWORKS.map((network) => (
            <label key={network} className="flex items-center gap-2 text-sm">
              <Checkbox
                checked={filters.networks.includes(network)}
                onCheckedChange={(checked) => {
                  const next = checked
                    ? [...filters.networks, network]
                    : filters.networks.filter((n) => n !== network);
                  onFilterChange({ ...filters, networks: next });
                }}
              />
              {network}
            </label>
          ))}
        </div>
      </div>

      {/* Reset */}
      <Button
        variant="outline"
        className="w-full"
        onClick={() =>
          onFilterChange({
            issuers: [],
            networks: [],
            maxAnnualFee: 1000,
            searchQuery: "",
            cardType: "all",
          })
        }
      >
        <X className="mr-1 size-4" />
        {t("cards", "resetFilters")}
      </Button>
    </div>
  );
}

export default function CardFilter({ filters, onFilterChange }: CardFilterProps) {
  const [mobileOpen, setMobileOpen] = useState(false);
  const { t } = useLanguage();

  return (
    <>
      {/* Desktop filter sidebar */}
      <aside className="hidden w-64 shrink-0 lg:block">
        <div className="sticky top-20 rounded-xl border bg-card p-4">
          <h3 className="mb-4 text-sm font-semibold">{t("cards", "filters")}</h3>
          <FilterContent filters={filters} onFilterChange={onFilterChange} />
        </div>
      </aside>

      {/* Mobile filter button + sheet */}
      <div className="lg:hidden">
        <Sheet open={mobileOpen} onOpenChange={setMobileOpen}>
          <SheetTrigger
            render={
              <Button variant="outline" size="sm">
                <Filter className="mr-1 size-4" />
                {t("cards", "filters")}
              </Button>
            }
          />
          <SheetContent side="left" className="w-80 overflow-y-auto">
            <SheetHeader>
              <SheetTitle>{t("cards", "filters")}</SheetTitle>
            </SheetHeader>
            <div className="px-4 pb-6">
              <FilterContent filters={filters} onFilterChange={onFilterChange} />
            </div>
          </SheetContent>
        </Sheet>
      </div>
    </>
  );
}
