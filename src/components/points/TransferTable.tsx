"use client";

import { useState } from "react";
import { Search, Star, Zap } from "lucide-react";
import { Input } from "@/components/ui/input";
import {
  Table,
  TableHeader,
  TableBody,
  TableHead,
  TableRow,
  TableCell,
} from "@/components/ui/table";
import { Badge } from "@/components/ui/badge";
import { Tabs, TabsList, TabsTrigger } from "@/components/ui/tabs";
import type { TransferPartner } from "@/lib/types";
import { useLanguage } from "@/lib/i18n";

interface TransferTableProps {
  partners: TransferPartner[];
}

export default function TransferTable({ partners }: TransferTableProps) {
  const [search, setSearch] = useState("");
  const [filterType, setFilterType] = useState<string>("all");
  const { t } = useLanguage();

  const filtered = partners.filter((p) => {
    const matchesSearch = p.partner_name
      .toLowerCase()
      .includes(search.toLowerCase());
    const matchesType =
      filterType === "all" || p.partner_type === filterType;
    return matchesSearch && matchesType;
  });

  return (
    <div className="space-y-4">
      {/* Controls */}
      <div className="flex flex-col gap-3 sm:flex-row sm:items-center">
        <div className="relative flex-1">
          <Search className="absolute left-2.5 top-1/2 size-4 -translate-y-1/2 text-muted-foreground" />
          <Input
            placeholder={t("points", "searchPartners")}
            value={search}
            onChange={(e) => setSearch(e.target.value)}
            className="pl-8"
          />
        </div>
        <Tabs
          value={filterType}
          onValueChange={(val) => setFilterType(val as string)}
        >
          <TabsList>
            <TabsTrigger value="all">{t("points", "all")}</TabsTrigger>
            <TabsTrigger value="airline">{t("points", "airline")}</TabsTrigger>
            <TabsTrigger value="hotel">{t("points", "hotel")}</TabsTrigger>
          </TabsList>
        </Tabs>
      </div>

      {/* Table */}
      <div className="rounded-xl border">
        <Table>
          <TableHeader>
            <TableRow>
              <TableHead>{t("points", "partner")}</TableHead>
              <TableHead>{t("points", "type")}</TableHead>
              <TableHead>{t("points", "transferRatio")}</TableHead>
              <TableHead>{t("points", "transferTime")}</TableHead>
              <TableHead>{t("points", "sweetSpot")}</TableHead>
            </TableRow>
          </TableHeader>
          <TableBody>
            {filtered.map((partner) => (
              <TableRow key={partner.id || partner.partner_name}>
                <TableCell className="font-medium">
                  {partner.partner_name}
                </TableCell>
                <TableCell>
                  <Badge variant="secondary" className="capitalize">
                    {partner.partner_type === "airline" ? t("points", "airline") : t("points", "hotel")}
                  </Badge>
                </TableCell>
                <TableCell>
                  {partner.transfer_ratio_from}:{partner.transfer_ratio_to}
                </TableCell>
                <TableCell>
                  <span className="flex items-center gap-1">
                    {partner.is_instant && (
                      <Zap className="size-3 text-brand-accent" />
                    )}
                    {partner.transfer_time_estimate}
                  </span>
                </TableCell>
                <TableCell>
                  {partner.sweet_spots && partner.sweet_spots.length > 0 ? (
                    <div className="flex items-center gap-1">
                      <Star className="size-3 fill-brand-accent text-brand-accent" />
                      <span className="text-xs">
                        {partner.sweet_spots.length} {t("points", "sweetSpot").toLowerCase()}
                        {partner.sweet_spots.length > 1 ? "s" : ""}
                      </span>
                    </div>
                  ) : (
                    <span className="text-xs text-muted-foreground">-</span>
                  )}
                </TableCell>
              </TableRow>
            ))}
            {filtered.length === 0 && (
              <TableRow>
                <TableCell colSpan={5} className="py-8 text-center text-muted-foreground">
                  {t("points", "noPartnersFound")}
                </TableCell>
              </TableRow>
            )}
          </TableBody>
        </Table>
      </div>
    </div>
  );
}
