//as Variant of using rgba color with opacity
const withOpacityValue = (rgbColor) => {
  return ({ opacityValue }) => {
    if (opacityValue === undefined) {
      return `rgb(var(${rgbColor}))`;
    }
    return `rgb(var(${rgbColor}) / ${opacityValue})`;
  };
};

module.exports = {
  theme: {
    extend: {
      fontSize: {
        "moon-9": [
          "0.5625rem",
          {
            lineHeight: "1rem",
          },
        ],
        "moon-9-caption": [
          "0.5625rem",
          {
            lineHeight: "1rem",
            letterSpacing: "0.0625rem",
          },
        ],
        "moon-10": [
          "0.625rem",
          {
            lineHeight: "1rem",
          },
        ],
        "moon-10-caption": [
          "0.625rem",
          {
            lineHeight: "1rem",
            letterSpacing: "0.0313rem",
          },
        ],
        "moon-12": [
          "0.75rem",
          {
            lineHeight: "1rem",
          },
        ],
        "moon-14": [
          "0.875rem",
          {
            lineHeight: "1.5rem",
          },
        ],
        "moon-16": [
          "1rem",
          {
            lineHeight: "1.5rem",
          },
        ],
        "moon-18": [
          "1.125rem",
          {
            lineHeight: "1.5rem",
          },
        ],
        "moon-20": [
          "1.25rem",
          {
            lineHeight: "2rem",
          },
        ],
        "moon-24": [
          "1.5rem",
          {
            lineHeight: "2rem",
          },
        ],
        "moon-32": [
          "2rem",
          {
            lineHeight: "2.5rem",
            letterSpacing: "-0.03125rem",
          },
        ],
        "moon-48": [
          "3rem",
          {
            lineHeight: "3.5rem",
            letterSpacing: "-0.0625rem",
          },
        ],
        "moon-56": [
          "3.5rem",
          {
            lineHeight: "4rem",
            letterSpacing: "-0.09375rem",
          },
        ],
        "moon-64": [
          "4rem",
          {
            lineHeight: "4.5rem",
            letterSpacing: "-0.125rem",
          },
        ],
        "moon-72": [
          "4.5rem",
          {
            lineHeight: "4.75rem",
            letterSpacing: "-0.15625rem",
          },
        ],
      },
      borderRadius: {
        "moon-i-xs": "var(--radius-i-xs)",
        "moon-i-sm": "var(--radius-i-sm)",
        "moon-i-md": "var(--radius-i-md)",
        "moon-s-xs": "var(--radius-s-xs)",
        "moon-s-sm": "var(--radius-s-sm)",
        "moon-s-md": "var(--radius-s-md)",
        "moon-s-lg": "var(--radius-s-lg)",
      },
      opacity: {
        disabled: "var(--opacity--disabled)",
      },
      animation: {
        loader: "loader 1.2s cubic-bezier(0.5, 0, 0.5, 1) infinite",
      },
      keyframes: {
        loader: {
          "0%": { transform: "rotate(0deg)" },
          "100%": { transform: "rotate(360deg)" },
        },
        error: {
          "10%, 90%": { transform: "translate3d(-1px, 0, 0)" },
          "20%, 80%": { transform: "translate3d(2px, 0, 0)" },
          "30%, 50%, 70%": { transform: "translate3d(-4px, 0, 0)" },
          "40%, 60%": { transform: "translate3d(4px, 0, 0)" },
        },
        explode: {
          "0%": { transform: "translate(-50%, -50%) scale(0)", opacity: 1 },
          "50%": { transform: "translate(-50%, -50%) scale(1)", opacity: 0.4 },
          "80%": { transform: "translate(-50%, -50%) scale(1)", opacity: 0 },
          "100%": { transform: "translate(-50%, -50%) scale(1)", opacity: 0 },
        },
        rotation: {
          "0%": { transform: "rotate(0deg)" },
          "100%": { transform: "rotate(360deg)" },
        },
        pulse2: {
          "10%, 90%": { transform: "translate3d(-1px, 0, 0)" },
          "0%": { transform: "scale(1)" },
          "70%": { transform: "scale(1)", boxShadow: "0 0 0 30px transparent" },
          "100%": { transform: "scale(1)", boxShadow: "0 0 0 0 transparent" },
        },
      },
      fontWeight: {
        normal: 400,
        semibold: 500,
      },
      boxShadow: {
        border: "0 0 0 2px rgba(var(--piccolo)) inset",
        inset: "0 0 0 1px rgb(var(--piccolo)) inset",
        interactive: "0 0 0 2px rgb(var(--piccolo)) inset",
        focus: `0 0 0 4px rgba(var(--piccolo), .13)`,
        input: "0 0 0 var(--border-width) rgb(var(--beerus)) inset",
        "input-hov":
          "0 0 0 var(--border-i-width) rgb(var(--bulma) / 7%) inset, 0 0 0 var(--border-i-width) rgb(var(--beerus)) inset",
        "input-err":
          "0 0 0 var(--border-i-width) rgb(var(--chi-chi)) inset",
        "input-focus":
          "0 0 0 var(--border-i-width) rgb(var(--piccolo)) inset",
        "moon-sm":
          "0 6px 6px -6px rgba(0, 0, 0, 0.16), 0 0 1px rgba(0, 0, 0, 0.4)",
        "moon-md":
          "0 12px 12px -6px rgba(0, 0, 0, 0.16), 0 0 1px rgba(0, 0, 0, 0.4)",
        "moon-lg":
          "0 8px 24px -6px rgba(0, 0, 0, 0.16), 0 0 1px rgba(0, 0, 0, 0.4)",
        "moon-xl":
          "0 32px 32px -8px rgba(0, 0, 0, 0.08), 0 0 32px -8px rgba(0, 0, 0, 0.12), 0 0 1px rgba(0, 0, 0, 0.2)",
      },
      colors: {
        transparent: "transparent",
        text: "var(--text)",
        background: "var(--background)",
        "krillin-10": {
          DEFAULT: withOpacityValue("--krillin-10"),
        },
        "krillin-60": {
          DEFAULT: withOpacityValue("--krillin-60"),
        },
        "krillin": {
          DEFAULT: withOpacityValue("--krillin"),
        },
        "chi-chi-10": {
          DEFAULT: withOpacityValue("--chi-chi-10"),
        },
        "chi-chi-60": {
          DEFAULT: withOpacityValue("--chi-chi-60"),
        },
        "chi-chi": {
          DEFAULT: withOpacityValue("--chi-chi"),
        },
        "roshi-10": {
          DEFAULT: withOpacityValue("--roshi-10"),
        },
        "roshi-60": {
          DEFAULT: withOpacityValue("--roshi-60"),
        },
        "roshi": {
          DEFAULT: withOpacityValue("--roshi"),
        },
        "dodoria-10": {
          DEFAULT: withOpacityValue("--dodoria-10"),
        },
        "dodoria-60": {
          DEFAULT: withOpacityValue("--dodoria-60"),
        },
        "dodoria": {
          DEFAULT: withOpacityValue("--dodoria"),
        },
        "cell-10": {
          DEFAULT: withOpacityValue("--cell-10"),
        },
        "cell-60": {
          DEFAULT: withOpacityValue("--cell-60"),
        },
        "cell": {
          DEFAULT: withOpacityValue("--cell"),
        },
        "raditz-10": {
          DEFAULT: withOpacityValue("--raditz-10"),
        },
        "raditz-60": {
          DEFAULT: withOpacityValue("--raditz-60"),
        },
        "raditz": {
          DEFAULT: withOpacityValue("--raditz"),
        },
        "whis-10": {
          DEFAULT: withOpacityValue("--whis-10"),
        },
        "whis-60": {
          DEFAULT: withOpacityValue("--whis-60"),
        },
        "whis": {
          DEFAULT: withOpacityValue("--whis"),
        },
        "frieza-10": {
          DEFAULT: withOpacityValue("--frieza-10"),
        },
        "frieza-60": {
          DEFAULT: withOpacityValue("--frieza-60"),
        },
        "frieza": {
          DEFAULT: withOpacityValue("--frieza"),
        },
        "nappa-10": {
          DEFAULT: withOpacityValue("--nappa-10"),
        },
        "nappa-60": {
          DEFAULT: withOpacityValue("--nappa-60"),
        },
        "nappa": {
          DEFAULT: withOpacityValue("--nappa"),
        },
        "piccolo": {
          DEFAULT: withOpacityValue("--piccolo"),
        },
        "hit-80": {
          DEFAULT: withOpacityValue("--hit-80"),
        },
        "hit": {
          DEFAULT: withOpacityValue("--hit"),
        },
        "hit-120": {
          DEFAULT: withOpacityValue("--hit-120"),
        },
        "goten": {
          DEFAULT: withOpacityValue("--goten"),
        },
        "goku-10": {
          DEFAULT: withOpacityValue("--goku-10"),
        },
        "goku-40": {
          DEFAULT: withOpacityValue("--goku-40"),
        },
        "goku-80": {
          DEFAULT: withOpacityValue("--goku-80"),
        },
        "goku": {
          DEFAULT: withOpacityValue("--goku"),
        },
        "goku-120": {
          DEFAULT: withOpacityValue("--goku-120"),
        },
        "gohan-10": {
          DEFAULT: withOpacityValue("--gohan-10"),
        },
        "gohan-40": {
          DEFAULT: withOpacityValue("--gohan-40"),
        },
        "gohan-80": {
          DEFAULT: withOpacityValue("--gohan-80"),
        },
        "gohan": {
          DEFAULT: withOpacityValue("--gohan"),
        },
        "gohan-120": {
          DEFAULT: withOpacityValue("--gohan-120"),
        },
        "beerus": {
          DEFAULT: withOpacityValue("--beerus"),
        },
        "bulma": {
          DEFAULT: withOpacityValue("--bulma"),
        },
        "trunks": {
          DEFAULT: withOpacityValue("--trunks"),
        },
        black: "#000",
        hover: "rgba(34, 34, 37, 0.12)",
        "primary-hover": "rgba(0, 0, 0, 0.08)",
      },
    },
  },
};
