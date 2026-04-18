"use client";

import React, { createContext, useContext, useEffect, useSyncExternalStore } from "react";
import { translations } from "./translations";

export type Language = "zh-TW" | "en";

interface LanguageContextType {
  language: Language;
  setLanguage: (lang: Language) => void;
  t: (section: string, key: string) => string;
}

const LanguageContext = createContext<LanguageContextType>({
  language: "zh-TW",
  setLanguage: () => {},
  t: () => "",
});

export function useLanguage() {
  return useContext(LanguageContext);
}

// Module-level language store (similar pattern to ThemeProvider)
let currentLanguage: Language = "zh-TW";
let langStoreInitialized = false;
const langListeners = new Set<() => void>();

function initializeLangStore() {
  if (langStoreInitialized) return;
  langStoreInitialized = true;
  if (typeof window === "undefined") return;
  const stored = localStorage.getItem("language") as Language | null;
  if (stored && (stored === "zh-TW" || stored === "en")) {
    currentLanguage = stored;
  }
}

function langSubscribe(listener: () => void) {
  langListeners.add(listener);
  return () => langListeners.delete(listener);
}

function getLangSnapshot(): Language {
  initializeLangStore();
  return currentLanguage;
}

function getLangServerSnapshot(): Language {
  return "zh-TW";
}

function setLangValue(newLang: Language) {
  currentLanguage = newLang;
  langListeners.forEach((l) => l());
}

// Translation function (standalone, for use outside React)
export function translate(
  language: Language,
  section: string,
  key: string
): string {
  const sectionObj = (translations as Record<string, Record<string, Record<string, string>>>)[
    section
  ];
  if (!sectionObj) return key;
  const entry = sectionObj[key];
  if (!entry) return key;
  return entry[language] || entry["en"] || key;
}

export function LanguageProvider({ children }: { children: React.ReactNode }) {
  const language = useSyncExternalStore(
    langSubscribe,
    getLangSnapshot,
    getLangServerSnapshot
  );

  useEffect(() => {
    localStorage.setItem("language", language);
    document.documentElement.lang = language === "zh-TW" ? "zh-Hant" : "en";
  }, [language]);

  const setLanguage = (lang: Language) => {
    setLangValue(lang);
  };

  const t = (section: string, key: string): string => {
    return translate(language, section, key);
  };

  return React.createElement(
    LanguageContext.Provider,
    { value: { language, setLanguage, t } },
    children
  );
}
