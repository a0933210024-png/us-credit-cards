"use client";

import { useLanguage } from "@/lib/i18n";
import { Button } from "@/components/ui/button";

export default function LanguageToggle() {
  const { language, setLanguage } = useLanguage();

  return (
    <Button
      variant="ghost"
      size="sm"
      onClick={() => setLanguage(language === "zh-TW" ? "en" : "zh-TW")}
      className="px-2 text-xs font-medium"
      aria-label="Toggle language"
    >
      {language === "zh-TW" ? "EN" : "中文"}
    </Button>
  );
}
