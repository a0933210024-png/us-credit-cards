"use client";

import { useState, useEffect } from "react";
import { useRouter } from "next/navigation";
import { Search } from "lucide-react";
import {
  CommandDialog,
  Command,
  CommandInput,
  CommandList,
  CommandEmpty,
  CommandGroup,
  CommandItem,
} from "@/components/ui/command";
import { Button } from "@/components/ui/button";
import { useLanguage } from "@/lib/i18n";

interface SearchResult {
  slug: string;
  card_name: string;
  issuer: string;
  category?: string;
}

export default function SearchBar() {
  const [open, setOpen] = useState(false);
  const [results, setResults] = useState<SearchResult[]>([]);
  const router = useRouter();
  const { t } = useLanguage();

  useEffect(() => {
    const down = (e: KeyboardEvent) => {
      if (e.key === "k" && (e.metaKey || e.ctrlKey)) {
        e.preventDefault();
        setOpen((o) => !o);
      }
    };
    document.addEventListener("keydown", down);
    return () => document.removeEventListener("keydown", down);
  }, []);

  const handleSearch = async (value: string) => {
    if (!value || value.length < 2) {
      setResults([]);
      return;
    }
    try {
      const res = await fetch(`/api/search?q=${encodeURIComponent(value)}`);
      if (res.ok) {
        const data = await res.json();
        setResults(
          data.map((c: { slug: string; card_name: string; issuer: string }) => ({
            slug: c.slug,
            card_name: c.card_name,
            issuer: c.issuer,
          }))
        );
      } else {
        setResults([]);
      }
    } catch {
      setResults([]);
    }
  };

  const handleSelect = (slug: string) => {
    setOpen(false);
    router.push(`/cards/${slug}`);
  };

  return (
    <>
      <Button
        variant="ghost"
        size="icon"
        onClick={() => setOpen(true)}
        aria-label={t("common", "search")}
      >
        <Search className="size-5" />
      </Button>
      <CommandDialog open={open} onOpenChange={setOpen} title={t("common", "search")} description={t("cards", "searchPlaceholder")}>
        <Command shouldFilter={false}>
          <CommandInput
            placeholder={t("cards", "searchPlaceholder")}
            onValueChange={handleSearch}
          />
          <CommandList>
            <CommandEmpty>{t("cards", "noResults")}</CommandEmpty>
            {results.length > 0 && (
              <CommandGroup heading={t("cards", "creditCards")}>
                {results.map((item) => (
                  <CommandItem
                    key={item.slug}
                    onSelect={() => handleSelect(item.slug)}
                  >
                    <span className="font-medium">{item.card_name}</span>
                    <span className="ml-2 text-xs text-muted-foreground">
                      {item.issuer}
                    </span>
                  </CommandItem>
                ))}
              </CommandGroup>
            )}
          </CommandList>
        </Command>
      </CommandDialog>
    </>
  );
}
