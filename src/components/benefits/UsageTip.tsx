import { Lightbulb } from "lucide-react";

interface UsageTipProps {
  title: string;
  description: string;
  highlight?: boolean;
}

export default function UsageTip({
  title,
  description,
  highlight = true,
}: UsageTipProps) {
  return (
    <div
      className={`rounded-xl p-4 ${
        highlight
          ? "border-2 border-brand-accent/50 bg-brand-accent/5"
          : "border bg-card"
      }`}
    >
      <div className="flex items-start gap-3">
        <div
          className={`flex size-8 shrink-0 items-center justify-center rounded-lg ${
            highlight ? "bg-brand-accent/20" : "bg-muted"
          }`}
        >
          <Lightbulb
            className={`size-4 ${
              highlight
                ? "text-brand-accent"
                : "text-muted-foreground"
            }`}
          />
        </div>
        <div>
          <h4 className="font-medium">{title}</h4>
          <p className="mt-1 text-sm text-muted-foreground">{description}</p>
        </div>
      </div>
    </div>
  );
}
