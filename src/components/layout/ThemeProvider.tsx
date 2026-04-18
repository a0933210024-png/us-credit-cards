"use client";

import React, { createContext, useContext, useEffect, useSyncExternalStore } from "react";

type Theme = "light" | "dark";

interface ThemeContextType {
  theme: Theme;
  toggleTheme: () => void;
}

const ThemeContext = createContext<ThemeContextType>({
  theme: "light",
  toggleTheme: () => {},
});

export function useTheme() {
  return useContext(ThemeContext);
}

// Module-level theme store (initialized once)
let currentTheme: Theme = "light";
let storeInitialized = false;
const listeners = new Set<() => void>();

function initializeStore() {
  if (storeInitialized) return;
  storeInitialized = true;
  if (typeof window === "undefined") return;
  const stored = localStorage.getItem("theme") as Theme | null;
  if (stored) {
    currentTheme = stored;
  } else if (window.matchMedia("(prefers-color-scheme: dark)").matches) {
    currentTheme = "dark";
  }
}

function subscribe(listener: () => void) {
  listeners.add(listener);
  return () => listeners.delete(listener);
}

function getSnapshot(): Theme {
  initializeStore();
  return currentTheme;
}

function getServerSnapshot(): Theme {
  return "light";
}

function setTheme(newTheme: Theme) {
  currentTheme = newTheme;
  listeners.forEach((l) => l());
}

export default function ThemeProvider({
  children,
}: {
  children: React.ReactNode;
}) {
  const theme = useSyncExternalStore(subscribe, getSnapshot, getServerSnapshot);

  useEffect(() => {
    const root = document.documentElement;
    if (theme === "dark") {
      root.classList.add("dark");
    } else {
      root.classList.remove("dark");
    }
    localStorage.setItem("theme", theme);
  }, [theme]);

  const toggleTheme = () => {
    setTheme(theme === "light" ? "dark" : "light");
  };

  return (
    <ThemeContext.Provider value={{ theme, toggleTheme }}>
      {children}
    </ThemeContext.Provider>
  );
}
