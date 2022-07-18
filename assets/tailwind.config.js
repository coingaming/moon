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
    "bg-krillin-100",
    "bg-chi-chi-10",
    "bg-chi-chi-60",
    "bg-chi-chi-100",
    "bg-roshi-10",
    "bg-roshi-60",
    "bg-roshi-100",
    "bg-dodoria-10",
    "bg-dodoria-60",
    "bg-dodoria-100",
    "bg-cell-10",
    "bg-cell-60",
    "bg-cell-100",
    "bg-raditz-10",
    "bg-raditz-60",
    "bg-raditz-100",
    "bg-whis-10",
    "bg-whis-60",
    "bg-whis-100",
    "bg-frieza-10",
    "bg-frieza-60",
    "bg-frieza-100",
    "bg-nappa-10",
    "bg-nappa-60",
    "bg-nappa-100",
    "bg-piccolo-80",
    "bg-piccolo-100",
    "bg-piccolo-120",
    "bg-hit-80",
    "bg-hit-100",
    "bg-hit-120",
    "bg-goten-100",
    "bg-goku-10",
    "bg-goku-40",
    "bg-goku-80",
    "bg-goku-100",
    "bg-goku-120",
    "bg-gohan-10",
    "bg-gohan-40",
    "bg-gohan-80",
    "bg-gohan-100",
    "bg-gohan-120",
    "bg-beerus-100",
    "bg-bulma-100",
    "bg-trunks-100",
    "text-krillin-10",
    "text-krillin-60",
    "text-krillin-100",
    "text-chi-chi-10",
    "text-chi-chi-60",
    "text-chi-chi-100",
    "text-roshi-10",
    "text-roshi-60",
    "text-roshi-100",
    "text-dodoria-10",
    "text-dodoria-60",
    "text-dodoria-100",
    "text-cell-10",
    "text-cell-60",
    "text-cell-100",
    "text-raditz-10",
    "text-raditz-60",
    "text-raditz-100",
    "text-whis-10",
    "text-whis-60",
    "text-whis-100",
    "text-frieza-10",
    "text-frieza-60",
    "text-frieza-100",
    "text-nappa-10",
    "text-nappa-60",
    "text-nappa-100",
    "text-piccolo-80",
    "text-piccolo-100",
    "text-piccolo-120",
    "text-hit-80",
    "text-hit-100",
    "text-hit-120",
    "text-goten-100",
    "text-goku-10",
    "text-goku-40",
    "text-goku-80",
    "text-goku-100",
    "text-goku-120",
    "text-gohan-10",
    "text-gohan-40",
    "text-gohan-80",
    "text-gohan-100",
    "text-gohan-120",
    "text-beerus-100",
    "text-bulma-100",
    "text-trunks-100",
    "border-krillin-10",
    "border-krillin-60",
    "border-krillin-100",
    "border-chi-chi-10",
    "border-chi-chi-60",
    "border-chi-chi-100",
    "border-roshi-10",
    "border-roshi-60",
    "border-roshi-100",
    "border-dodoria-10",
    "border-dodoria-60",
    "border-dodoria-100",
    "border-cell-10",
    "border-cell-60",
    "border-cell-100",
    "border-raditz-10",
    "border-raditz-60",
    "border-raditz-100",
    "border-whis-10",
    "border-whis-60",
    "border-whis-100",
    "border-frieza-10",
    "border-frieza-60",
    "border-frieza-100",
    "border-nappa-10",
    "border-nappa-60",
    "border-nappa-100",
    "border-piccolo-80",
    "border-piccolo-100",
    "border-piccolo-120",
    "border-hit-80",
    "border-hit-100",
    "border-hit-120",
    "border-goten-100",
    "border-goku-10",
    "border-goku-40",
    "border-goku-80",
    "border-goku-100",
    "border-goku-120",
    "border-gohan-10",
    "border-gohan-40",
    "border-gohan-80",
    "border-gohan-100",
    "border-gohan-120",
    "border-beerus-100",
    "border-bulma-100",
    "border-trunks-100",
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
    require("@tailwindcss/aspect-ratio"),
    require("@tailwindcss/forms"),
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
  presets: [require("./ds-moon-preset")],
};
