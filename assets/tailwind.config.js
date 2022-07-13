const plugin = require("tailwindcss/plugin");

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
  content: ["../lib/**/*.{ex,heex,eex}", "./js/**/*.js"],
  theme: {
    extend: {
      screens: {
        "3xl": "1800px",
      },
      backgroundOpacity: {
        12: "0.12",
      },
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
      zIndex: {
        1: "1",
        5: "5",
        10000: "10000",
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
        border: "0 0 0 2px rgba(var(--color--piccolo-100)) inset",
        inset: "0 0 0 1px rgb(var(--color--piccolo-100)) inset",
        interactive: "0 0 0 2px rgb(var(--color--piccolo-100)) inset",
        focus: `0 0 0 4px rgba(var(--color--piccolo-100), .13)`,
        input: "0 0 0 var(--border-width) rgb(var(--color--beerus-100)) inset",
        "input-hov":
          "0 0 0 var(--border-i-width) rgb(var(--color--bulma-100) / 7%) inset, 0 0 0 var(--border-i-width) rgb(var(--color--beerus-100)) inset",
        "input-err":
          "0 0 0 var(--border-i-width) rgb(var(--color--chi-chi-100)) inset",
        "input-focus":
          "0 0 0 var(--border-i-width) rgb(var(--color--piccolo-100)) inset",
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
        text: "var(--color-text)",
        background: "var(--color-background)",
        piccolo: {
          80: withOpacityValue("--color--piccolo-80"),
          100: withOpacityValue("--color--piccolo-100"),
          120: withOpacityValue("--color--piccolo-120"),
        },
        hit: {
          80: withOpacityValue("--color--hit-80"),
          100: withOpacityValue("--color--hit-100"),
          120: withOpacityValue("--color--hit-120"),
        },
        beerus: {
          100: withOpacityValue("--color--beerus-100"),
        },
        goku: {
          10: withOpacityValue("--color--goku-10"),
          40: withOpacityValue("--color--goku-40"),
          80: withOpacityValue("--color--goku-80"),
          100: withOpacityValue("--color--goku-100"),
          120: withOpacityValue("--color--goku-120"),
        },
        gohan: {
          10: withOpacityValue("--color--gohan-10"),
          40: withOpacityValue("--color--gohan-40"),
          80: withOpacityValue("--color--gohan-80"),
          100: withOpacityValue("--color--gohan-100"),
          120: withOpacityValue("--color--gohan-120"),
        },
        bulma: {
          100: withOpacityValue("--color--bulma-100"),
        },
        trunks: {
          100: withOpacityValue("--color--trunks-100"),
        },
        goten: {
          100: withOpacityValue("--color--goten-100"),
        },
        popo: {
          100: withOpacityValue("--color--popo-100"),
        },
        krillin: {
          10: withOpacityValue("--color--krillin-10"),
          60: withOpacityValue("--color--krillin-60"),
          100: withOpacityValue("--color--krillin-100"),
        },
        "chi-chi": {
          10: withOpacityValue("--color--chi-chi-10"),
          60: withOpacityValue("--color--chi-chi-60"),
          100: withOpacityValue("--color--chi-chi-100"),
        },
        roshi: {
          10: withOpacityValue("--color--roshi-10"),
          60: withOpacityValue("--color--roshi-60"),
          100: withOpacityValue("--color--roshi-100"),
        },
        dodoria: {
          10: withOpacityValue("--color--dodoria-10"),
          60: withOpacityValue("--color--dodoria-60"),
          100: withOpacityValue("--color--dodoria-100"),
        },
        cell: {
          10: withOpacityValue("--color--cell-10"),
          60: withOpacityValue("--color--cell-60"),
          100: withOpacityValue("--color--cell-100"),
        },
        raditz: {
          10: withOpacityValue("--color--raditz-10"),
          60: withOpacityValue("--color--raditz-60"),
          100: withOpacityValue("--color--raditz-100"),
        },
        whis: {
          10: withOpacityValue("--color--whis-10"),
          60: withOpacityValue("--color--whis-60"),
          100: withOpacityValue("--color--whis-100"),
        },
        frieza: {
          10: withOpacityValue("--color--frieza-10"),
          60: withOpacityValue("--color--frieza-60"),
          100: withOpacityValue("--color--frieza-100"),
        },
        nappa: {
          10: withOpacityValue("--color--nappa-10"),
          60: withOpacityValue("--color--nappa-60"),
          100: withOpacityValue("--color--nappa-100"),
        },
        black: "#000",
        hover: "rgba(34, 34, 37, 0.12)",
        "primary-hover": "rgba(0, 0, 0, 0.08)",
        "slate-200": "rgb(226 232 240)",
        "for-designers": "rgb(52 72 240)",
        "for-developers": "rgb(149 241 213)",
      },
    },
  },
  plugins: [
    require("@tailwindcss/aspect-ratio"),
    require("@tailwindcss/forms"),
    plugin(({ addUtilities }) => {
      addUtilities({});
    }),
    plugin(({ addComponents }) => {
      addComponents({
        ".btn-primary": {
          color: "rgb(var(--color--goten-100))",
          backgroundColor: `rgb(var(--color--piccolo-100))`,
        },
        ".btn-secondary": {
          color: "rgb(var(--color--bulma-100))",
          background: "none",
          boxShadow: `inset 0 0 0 1px rgb(var(--color--trunks-100)/1)`,
          "&:hover": {
            boxShadow: `inset 0 0 0 1px rgb(var(--color--bulma-100))`,
          },
        },
        ".btn-tertiary": {
          color: "rgb(var(--color--goten-100))",
          backgroundColor: "rgb(var(--color--hit-100))",
        },
        ".anim-error": {
          transform: "translate3d(0, 0, 0)",
          backfaceVisibility: "hidden",
          perspective: "1000px",
        },
        ".anim-pulse": {
          boxShadow: "0 0 0 0 rgb(var(--color--piccolo-100))",
        },
        ".input-number-clear": {
          MozAppearance: "textfield",
          "&::-webkit-inner-spin-button, &::-webkit-outer-spin-button": {
            opacity: 0,
          },
        },
        ".input-xl": {
          "&:not(:focus):not([disabled])::placeholder": {
            opacity: 0,
          },
          "&:not(:focus):not([disabled]):placeholder-shown + label": {
            top: "50%",
            marginTop: "-0.438rem",
            fontSize: "1rem",
            lineHeight: "1rem",
          },
        },
        ".input-dt-shared": {
          "&::-webkit-datetime-edit, &::-webkit-date-and-time-value": {
            display: "block",
            padding: 0,
            height: "2.375rem",
            lineHeight: "2.375rem",
          },
          "&::-webkit-date-and-time-value": {
            paddingTop: "0.5rem",
          },
          "&::-webkit-calendar-picker-indicator": {
            position: "absolute",
          },
        },
        ".input-lg-dt-shared": {
          "&::-webkit-datetime-edit": {
            height: "2.875rem",
            lineHeight: "2.875rem",
          },
          "&::-webkit-date-and-time-value": {
            paddingTop: "0.625rem",
          },
        },
        ".input-xl-dt-shared": {
          "&::-webkit-datetime-edit": {
            height: "3.5rem",
            lineHeight: "3.5rem",
          },
          "&::-webkit-date-and-time-value": {
            paddingTop: "1rem",
          },
        },
        ".input-xl-dt-label": {
          "&::-webkit-datetime-edit": {
            height: "2.25rem",
            lineHeight: "2.125rem",
          },
          "&::-webkit-date-and-time-value": {
            paddingTop: 0,
          },
        },
        ".input-d": {
          "&::-webkit-calendar-picker-indicator": {
            right: "0.875rem",
          },
        },
        ".input-t": {
          "&::-webkit-calendar-picker-indicator": {
            right: "0.875rem",
          },
        },
        ".input-d-rtl": {
          //type === 'date' rtl
          "&::-webkit-datetime-edit, &::-webkit-date-and-time-value": {
            position: "absolute",
            right: "0",
          },
          "&::-webkit-calendar-picker-indicator": {
            left: "0.5rem",
          },
        },
        ".input-t-rtl": {
          //type === 'time' rtl
          "&::-webkit-datetime-edit, &::-webkit-date-and-time-value": {
            position: "absolute",
            right: "0.5rem",
          },
          "&::-webkit-calendar-picker-indicator": {
            left: "0.5rem",
          },
        },
        ".input-dt-local-rtl": {
          //type === 'datetime-local' rtl
          "&::-webkit-datetime-edit, &::-webkit-date-and-time-value": {
            position: "absolute",
            right: "0",
          },
          "&::-webkit-calendar-picker-indicator": {
            left: "0.5rem",
          },
        },
        ".input-rsb-hidden": {
          "&:not(:hover):not(:focus):not(:invalid)": {
            clipPath: `inset(calc(var(--border-i-width) * -1) 0.125rem calc(var(--border-i-width) * -1) 0)`,
          },
        },
        ".input-lsb-hidden": {
          "&:not(:hover):not(:focus):not(:invalid)": {
            clipPath: `inset(calc(var(--border-i-width) * -1) 0 calc(var(--border-i-width) * -1) 0.125rem)`,
          },
        },
        ".input-tbb-hidden": {
          "&:not(:hover):not(:focus):not(:invalid)": {
            clipPath: `inset(0.125rem calc(var(--border-i-width) * -1) 0 calc(var(--border-i-width) * -1))`,
          },
        },
        ".input-bbb-hidden": {
          "&:not(:hover):not(:focus):not(:invalid)": {
            clipPath: `inset(0 calc(var(--border-i-width) * -1) 0.125rem calc(var(--border-i-width) * -1))`,
          },
        },
        ".brcrumb-li": {
          "& a, & span": {
            padding: "0.5rem",
          },
        },
      });
    }),
  ],
};
