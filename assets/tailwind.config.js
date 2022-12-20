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
  content: [
    "../lib/**/*.ex",
    "../lib/**/*.heex",
    "../lib/**/*.eex",
    "./js/**/*.js",
  ],
  safelist: [
    "bg-krillin-10",
    "bg-krillin-60",
    "bg-krillin",
    "bg-chi-chi-10",
    "bg-chi-chi-60",
    "bg-chi-chi",
    "bg-roshi-10",
    "bg-roshi-60",
    "bg-roshi",
    "bg-dodoria-10",
    "bg-dodoria-60",
    "bg-dodoria",
    "bg-cell-10",
    "bg-cell-60",
    "bg-cell",
    "bg-raditz-10",
    "bg-raditz-60",
    "bg-raditz",
    "bg-whis-10",
    "bg-whis-60",
    "bg-whis",
    "bg-frieza-10",
    "bg-frieza-60",
    "bg-frieza",
    "bg-nappa-10",
    "bg-nappa-60",
    "bg-nappa",
    "bg-piccolo",
    "bg-hit-80",
    "bg-hit",
    "bg-hit-120",
    "bg-goten",
    "bg-goku-10",
    "bg-goku-40",
    "bg-goku-80",
    "bg-goku",
    "bg-goku-120",
    "bg-gohan-10",
    "bg-gohan-40",
    "bg-gohan-80",
    "bg-gohan",
    "bg-gohan-120",
    "bg-beerus",
    "bg-bulma",
    "bg-trunks",
    "text-krillin-10",
    "text-krillin-60",
    "text-krillin",
    "text-chi-chi-10",
    "text-chi-chi-60",
    "text-chi-chi",
    "text-roshi-10",
    "text-roshi-60",
    "text-roshi",
    "text-dodoria-10",
    "text-dodoria-60",
    "text-dodoria",
    "text-cell-10",
    "text-cell-60",
    "text-cell",
    "text-raditz-10",
    "text-raditz-60",
    "text-raditz",
    "text-whis-10",
    "text-whis-60",
    "text-whis",
    "text-frieza-10",
    "text-frieza-60",
    "text-frieza",
    "text-nappa-10",
    "text-nappa-60",
    "text-nappa",
    "text-piccolo",
    "text-hit-80",
    "text-hit",
    "text-hit-120",
    "text-goten",
    "text-goku-10",
    "text-goku-40",
    "text-goku-80",
    "text-goku",
    "text-goku-120",
    "text-gohan-10",
    "text-gohan-40",
    "text-gohan-80",
    "text-gohan",
    "text-gohan-120",
    "text-beerus",
    "text-bulma",
    "text-trunks",
    "border-krillin-10",
    "border-krillin-60",
    "border-krillin",
    "border-chi-chi-10",
    "border-chi-chi-60",
    "border-chi-chi",
    "border-roshi-10",
    "border-roshi-60",
    "border-roshi",
    "border-dodoria-10",
    "border-dodoria-60",
    "border-dodoria",
    "border-cell-10",
    "border-cell-60",
    "border-cell",
    "border-raditz-10",
    "border-raditz-60",
    "border-raditz",
    "border-whis-10",
    "border-whis-60",
    "border-whis",
    "border-frieza-10",
    "border-frieza-60",
    "border-frieza",
    "border-nappa-10",
    "border-nappa-60",
    "border-nappa",
    "border-piccolo",
    "border-hit-80",
    "border-hit",
    "border-hit-120",
    "border-goten",
    "border-goku-10",
    "border-goku-40",
    "border-goku-80",
    "border-goku",
    "border-goku-120",
    "border-gohan-10",
    "border-gohan-40",
    "border-gohan-80",
    "border-gohan",
    "border-gohan-120",
    "border-beerus",
    "border-bulma",
    "border-trunks",
  ],
  theme: {
    extend: {
      backgroundOpacity: {
        12: "0.12",
      },
      colors: {
        "slate-200": "rgb(226 232 240)",
        "for-designers": "rgb(52 72 240)",
        "for-developers": "rgb(149 241 213)",
      },
      screens: {
        "3xl": "1800px",
      },
    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    require("tailwindcss-rtl"),
    plugin(({ addComponents }) => {
      addComponents({
        ".btn-primary": {
          color: "rgb(var(--goten))",
          backgroundColor: `rgb(var(--piccolo))`,
        },
        ".btn-secondary": {
          color: "rgb(var(--bulma))",
          background: "none",
          boxShadow: `inset 0 0 0 1px rgb(var(--trunks)/1)`,
          "&:hover": {
            boxShadow: `inset 0 0 0 1px rgb(var(--bulma))`,
          },
        },
        ".btn-tertiary": {
          color: "rgb(var(--goten))",
          backgroundColor: "rgb(var(--hit))",
        },
        ".anim-error": {
          transform: "translate3d(0, 0, 0)",
          backfaceVisibility: "hidden",
          perspective: "1000px",
        },
        ".anim-pulse": {
          boxShadow: "0 0 0 0 rgb(var(--piccolo))",
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
  presets: [require("./ds-moon-preset")],
};
