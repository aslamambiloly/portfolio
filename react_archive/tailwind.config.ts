import type { Config } from "tailwindcss";

export default {
  darkMode: ["class"],
  content: ["./pages/**/*.{ts,tsx}", "./components/**/*.{ts,tsx}", "./app/**/*.{ts,tsx}", "./src/**/*.{ts,tsx}"],
  prefix: "",
  theme: {
    container: {
      center: true,
      padding: "2rem",
      screens: {
        "2xl": "1400px",
      },
    },
    extend: {
      fontFamily: {
        sans: ['Ubuntu', 'sans-serif'],
      },
      fontWeight: {
        normal: '300',
        medium: '400',
        semibold: '500',
        bold: '700',
      },
      colors: {
        border: "hsl(var(--border))",
        input: "hsl(var(--input))",
        ring: "hsl(var(--ring))",
        background: "hsl(var(--background))",
        foreground: "hsl(var(--foreground))",
        primary: {
          DEFAULT: "hsl(var(--primary))",
          foreground: "hsl(var(--primary-foreground))",
        },
        secondary: {
          DEFAULT: "hsl(var(--secondary))",
          foreground: "hsl(var(--secondary-foreground))",
        },
        destructive: {
          DEFAULT: "hsl(var(--destructive))",
          foreground: "hsl(var(--destructive-foreground))",
        },
        muted: {
          DEFAULT: "hsl(var(--muted))",
          foreground: "hsl(var(--muted-foreground))",
        },
        accent: {
          DEFAULT: "hsl(var(--accent))",
          foreground: "hsl(var(--accent-foreground))",
        },
        popover: {
          DEFAULT: "hsl(var(--popover))",
          foreground: "hsl(var(--popover-foreground))",
        },
        card: {
          DEFAULT: "hsl(var(--card))",
          foreground: "hsl(var(--card-foreground))",
        },
        sidebar: {
          DEFAULT: "hsl(var(--sidebar-background))",
          foreground: "hsl(var(--sidebar-foreground))",
          primary: "hsl(var(--sidebar-primary))",
          "primary-foreground": "hsl(var(--sidebar-primary-foreground))",
          accent: "hsl(var(--sidebar-accent))",
          "accent-foreground": "hsl(var(--sidebar-accent-foreground))",
          border: "hsl(var(--sidebar-border))",
          ring: "hsl(var(--sidebar-ring))",
        },
        // Custom color palette
        custom: {
          blue: "#0C87F2",
          purple: "#9857F2",
          "purple-dark": "#B052D9",
          pink: "#D94EB4",
          "blue-dark": "#0A6BC7",
          "blue-light": "#3A9FF5",
          "purple-light": "#A866F5",
          "pink-light": "#E066C4",
        },
      },
      borderRadius: {
        lg: "var(--radius)",
        md: "calc(var(--radius) - 2px)",
        sm: "calc(var(--radius) - 4px)",
      },
      keyframes: {
        "accordion-down": {
          from: { height: "0" },
          to: { height: "var(--radix-accordion-content-height)" },
        },
        "accordion-up": {
          from: { height: "var(--radix-accordion-content-height)" },
          to: { height: "0" },
        },
        "fade-in": {
          "0%": { opacity: "0", transform: "translateY(20px)" },
          "100%": { opacity: "1", transform: "translateY(0)" }
        },
        "fade-in-up": {
          "0%": { opacity: "0", transform: "translateY(10px)" },
          "100%": { opacity: "1", transform: "translateY(0)" }
        },
        "glow-pulse": {
          "0%, 100%": { opacity: "1" },
          "50%": { opacity: "0.5" }
        },
        "slide-in-left": {
          "0%": { opacity: "0", transform: "translateX(-20px)" },
          "100%": { opacity: "1", transform: "translateX(0)" }
        },
        "float": {
          "0%, 100%": { transform: "translate(0px, 0px)" },
          "25%": { transform: "translate(15px, -20px)" },
          "50%": { transform: "translate(-10px, -15px)" },
          "75%": { transform: "translate(-15px, 10px)" }
        },
        "float-lr": {
          "0%": { transform: "translate(-100vw, 0px)", opacity: "0" },
          "5%": { opacity: "0.3" },
          "95%": { opacity: "0.3" },
          "100%": { transform: "translate(100vw, 0px)", opacity: "0" }
        },
        "float-rl": {
          "0%": { transform: "translate(100vw, 0px)", opacity: "0" },
          "5%": { opacity: "0.3" },
          "95%": { opacity: "0.3" },
          "100%": { transform: "translate(-100vw, 0px)", opacity: "0" }
        },
        "float-tb": {
          "0%": { transform: "translate(0px, -100vh)", opacity: "0" },
          "5%": { opacity: "0.3" },
          "95%": { opacity: "0.3" },
          "100%": { transform: "translate(0px, 100vh)", opacity: "0" }
        },
        "float-bt": {
          "0%": { transform: "translate(0px, 100vh)", opacity: "0" },
          "5%": { opacity: "0.3" },
          "95%": { opacity: "0.3" },
          "100%": { transform: "translate(0px, -100vh)", opacity: "0" }
        },
        "float-diagonal-1": {
          "0%": { transform: "translate(-50vw, 100vh)", opacity: "0" },
          "5%": { opacity: "0.3" },
          "95%": { opacity: "0.3" },
          "100%": { transform: "translate(50vw, -100vh)", opacity: "0" }
        },
        "float-diagonal-2": {
          "0%": { transform: "translate(50vw, -100vh)", opacity: "0" },
          "5%": { opacity: "0.3" },
          "95%": { opacity: "0.3" },
          "100%": { transform: "translate(-50vw, 100vh)", opacity: "0" }
        },
        "gradient-shift": {
          "0%": { backgroundPosition: "0% 50%" },
          "50%": { backgroundPosition: "100% 50%" },
          "100%": { backgroundPosition: "0% 50%" }
        },
        "fade-in-subtitle": {
          "0%": { opacity: "0", transform: "translateX(-10px)" },
          "100%": { opacity: "0.4", transform: "translateX(0)" }
        },
      },
      animation: {
        "accordion-down": "accordion-down 0.2s ease-out",
        "accordion-up": "accordion-up 0.2s ease-out",
        "fade-in": "fade-in 0.6s ease-out",
        "fade-in-up": "fade-in-up 0.5s ease-out",
        "glow-pulse": "glow-pulse 2s ease-in-out infinite",
        "slide-in-left": "slide-in-left 0.5s ease-out",
        "float": "float 6s ease-in-out infinite",
        "float-lr": "float-lr 25s linear infinite",
        "float-rl": "float-rl 30s linear infinite",
        "float-tb": "float-tb 20s linear infinite",
        "float-bt": "float-bt 28s linear infinite",
        "float-diagonal-1": "float-diagonal-1 35s linear infinite",
        "float-diagonal-2": "float-diagonal-2 32s linear infinite",
        "gradient-shift": "gradient-shift 4s ease-in-out infinite",
        "fade-in-subtitle": "fade-in-subtitle 0.5s ease-out forwards",
      },
    },
  },
  plugins: [require("tailwindcss-animate")],
} satisfies Config;
