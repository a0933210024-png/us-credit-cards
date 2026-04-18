"use client";

import { useState, useEffect } from "react";
import { ChevronDown, ChevronUp } from "lucide-react";
import ProgramOverview from "@/components/points/ProgramOverview";
import TransferTable from "@/components/points/TransferTable";
import SweetSpotCard from "@/components/points/SweetSpotCard";
import PointsCalculator from "@/components/points/PointsCalculator";
import type { PointsProgram, TransferPartner, SweetSpot } from "@/lib/types";
import { useLanguage } from "@/lib/i18n";

interface ProgramData {
  program_name: string;
  currency_name: string;
  base_value_cpp: number;
  best_value_cpp: number;
  earning_cards: string[];
  partners: TransferPartner[];
}

interface TransferPartnersJSON {
  programs: ProgramData[];
}

export default function PointsPage() {
  const { t } = useLanguage();
  const [programs, setPrograms] = useState<PointsProgram[]>([]);
  const [partnersByProgram, setPartnersByProgram] = useState<
    Record<string, TransferPartner[]>
  >({});
  const [sweetSpots, setSweetSpots] = useState<SweetSpot[]>([]);
  const [loading, setLoading] = useState(true);
  const [expandedProgram, setExpandedProgram] = useState<string | null>(null);

  useEffect(() => {
    const loadData = async () => {
      try {
        const [transferData, sweetSpotData] = await Promise.all([
          import("@/data/transfer-partners.json"),
          import("@/data/sweet-spots.json"),
        ]);

        const tpData = transferData.default as TransferPartnersJSON;
        const progs: PointsProgram[] = [];
        const partMap: Record<string, TransferPartner[]> = {};

        tpData.programs.forEach((p: ProgramData, i: number) => {
          const prog: PointsProgram = {
            id: `prog-${i}`,
            program_name: p.program_name,
            currency_name: p.currency_name,
            base_value_cpp: p.base_value_cpp,
            best_value_cpp: p.best_value_cpp,
            earning_cards: p.earning_cards,
          };
          progs.push(prog);

          partMap[p.program_name] = p.partners.map(
            (partner: TransferPartner, pi: number) => ({
              ...partner,
              id: `partner-${i}-${pi}`,
              points_program: p.program_name,
            })
          );
        });

        setPrograms(progs);
        setPartnersByProgram(partMap);
        setSweetSpots(sweetSpotData.default as SweetSpot[]);
      } catch {
        // fallback
      } finally {
        setLoading(false);
      }
    };
    loadData();
  }, []);

  const toggleProgram = (name: string) => {
    setExpandedProgram((prev) => (prev === name ? null : name));
  };

  if (loading) {
    return (
      <div className="mx-auto max-w-7xl px-4 py-8 sm:px-6">
        <div className="animate-pulse space-y-6">
          <div className="h-8 w-64 rounded bg-muted" />
          <div className="h-4 w-96 rounded bg-muted" />
          <div className="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
            {Array.from({ length: 5 }).map((_, i) => (
              <div key={i} className="h-64 rounded-xl bg-muted" />
            ))}
          </div>
        </div>
      </div>
    );
  }

  return (
    <div className="mx-auto max-w-7xl px-4 py-8 sm:px-6">
      <div className="mb-8">
        <h1 className="text-2xl font-bold sm:text-3xl">{t("points", "pageTitle")}</h1>
        <p className="mt-2 text-muted-foreground">
          {t("points", "pageSubtitle")}
        </p>
      </div>

      {/* Programs overview */}
      <section className="mb-12">
        <h2 className="mb-6 text-xl font-bold">{t("points", "pointsPrograms")}</h2>
        <div className="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
          {programs.map((program) => (
            <div key={program.id}>
              <div
                className="cursor-pointer"
                onClick={() => toggleProgram(program.program_name)}
              >
                <ProgramOverview
                  program={program}
                  partnerCount={
                    partnersByProgram[program.program_name]?.length
                  }
                />
              </div>
              <button
                onClick={() => toggleProgram(program.program_name)}
                className="mt-2 flex w-full items-center justify-center gap-1 text-sm text-muted-foreground hover:text-foreground"
              >
                {expandedProgram === program.program_name ? (
                  <>
                    {t("points", "hideTransferPartners")}
                    <ChevronUp className="size-4" />
                  </>
                ) : (
                  <>
                    {t("points", "showTransferPartners")}
                    <ChevronDown className="size-4" />
                  </>
                )}
              </button>
            </div>
          ))}
        </div>
      </section>

      {/* Expanded transfer table */}
      {expandedProgram && partnersByProgram[expandedProgram] && (
        <section className="mb-12">
          <h2 className="mb-4 text-xl font-bold">
            {expandedProgram} - {t("points", "transferPartners")}
          </h2>
          <TransferTable partners={partnersByProgram[expandedProgram]} />
        </section>
      )}

      {/* Sweet spots */}
      <section className="mb-12">
        <h2 className="mb-6 text-xl font-bold">{t("points", "sweetSpots")}</h2>
        <p className="mb-4 text-sm text-muted-foreground">
          {t("points", "bestValueRedemptions")}
        </p>
        <div className="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
          {sweetSpots.map((spot, i) => (
            <SweetSpotCard key={spot.id || i} sweetSpot={spot} />
          ))}
        </div>
      </section>

      {/* Points calculator */}
      <section className="mb-12 max-w-md">
        <PointsCalculator />
      </section>
    </div>
  );
}
