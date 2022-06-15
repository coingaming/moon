const plugin = require("tailwindcss/plugin");

module.exports = {
  content: [
    "../lib/**/*.ex",
    "../lib/**/*.heex",
    "../lib/**/*.eex",
    "./js/**/*.js",
  ],
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
      boxShadow: {
        border: "0 0 0 2px var(--color--piccolo-100) inset",
      },
      animation: {
        loader: "loader 1.2s cubic-bezier(0.5, 0, 0.5, 1) infinite",
      },
      keyframes: {
        loader: {
          "0%": { transform: "rotate(0deg)" },
          "100%": { transform: "rotate(360deg)" },
        },
      },
    },
    fontWeight: {
      normal: 400,
      semibold: 500,
    },
    boxShadow: {
      sm: "var(--box-shadow--sm)",
      DEFAULT: "var(--box-shadow--default)",
      md: "var(--box-shadow--default)",
      lg: "var(--box-shadow--lg)",
      xl: "var(--box-shadow--xl)",
    },
    // borderRadius: {
    //   sm: "var(--radius--small)",
    //   DEFAULT: "var(--radius--default)",
    //   lg: "var(--radius--large)",
    //   xl: "var(--radius--xlarge)",
    // },
    colors: {
      transparent: "transparent",
      text: "var(--color-text)",
      background: "var(--color-background)",
      "krillin-10": "var(--color--krillin-10)",
      "krillin-60": "var(--color--krillin-60)",
      "krillin-100": "var(--color--krillin-100)",
      "chi-chi-10": "var(--color--chi-chi-10)",
      "chi-chi-60": "var(--color--chi-chi-60)",
      "chi-chi-100": "var(--color--chi-chi-100)",
      "roshi-10": "var(--color--roshi-10)",
      "roshi-60": "var(--color--roshi-60)",
      "roshi-100": "var(--color--roshi-100)",
      "dodoria-10": "var(--color--dodoria-10)",
      "dodoria-60": "var(--color--dodoria-60)",
      "dodoria-100": "var(--color--dodoria-100)",
      "cell-10": "var(--color--cell-10)",
      "cell-60": "var(--color--cell-60)",
      "cell-100": "var(--color--cell-100)",
      "raditz-10": "var(--color--raditz-10)",
      "raditz-60": "var(--color--raditz-60)",
      "raditz-100": "var(--color--raditz-100)",
      "whis-10": "var(--color--whis-10)",
      "whis-60": "var(--color--whis-60)",
      "whis-100": "var(--color--whis-100)",
      "frieza-10": "var(--color--frieza-10)",
      "frieza-60": "var(--color--frieza-60)",
      "frieza-100": "var(--color--frieza-100)",
      "nappa-10": "var(--color--nappa-10)",
      "nappa-60": "var(--color--nappa-60)",
      "nappa-100": "var(--color--nappa-100)",
      "piccolo-80": "var(--color--piccolo-80)",
      "piccolo-100": "var(--color--piccolo-100)",
      "piccolo-120": "var(--color--piccolo-120)",
      "hit-80": "var(--color--hit-80)",
      "hit-100": "var(--color--hit-100)",
      "hit-120": "var(--color--hit-120)",
      "goten-100": "var(--color--goten-100)",
      "goku-10": "var(--color--goku-10)",
      "goku-40": "var(--color--goku-40)",
      "goku-80": "var(--color--goku-80)",
      "goku-100": "var(--color--goku-100)",
      "goku-120": "var(--color--goku-120)",
      "gohan-10": "var(--color--gohan-10)",
      "gohan-40": "var(--color--gohan-40)",
      "gohan-80": "var(--color--gohan-80)",
      "gohan-100": "var(--color--gohan-100)",
      "gohan-120": "var(--color--gohan-120)",
      "beerus-100": "var(--color--beerus-100)",
      "bulma-100": "var(--color--bulma-100)",
      "trunks-100": "var(--color--trunks-100)",
      black: "#000",
      hover: "rgba(34, 34, 37, 0.12)",
      "primary-hover": "rgba(0, 0, 0, 0.08)",
      "slate-200": "rgb(226 232 240)",
    },
  },
  plugins: [
    require("@tailwindcss/aspect-ratio"),
    require("@tailwindcss/forms"),
    plugin(({ addUtilities }) => {
      addUtilities({});
    }),
  ],
};
