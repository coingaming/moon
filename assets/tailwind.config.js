const plugin = require("tailwindcss/plugin");

//as Variant of using rgba color with opacity
const withOpacityValue = (rgbColor) => {
  return ({ opacityValue }) => {
    if (opacityValue === undefined) {
      return `rgb(var(${rgbColor}))`;
    }
    return `rgb(var(${rgbColor}) / ${opacityValue})`;
  };
}

module.exports = {
  content: [
    "../lib/**/*.ex",
    "../lib/**/*.heex",
    "../lib/**/*.eex",
    "./js/**/*.js",
  ],
  theme: {
    extend: {
      screens: {
        '3xl': '1800px',
      },
      backgroundOpacity: {
        "12": "0.12",
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
        border: "0 0 0 2px rgba(var(--color--piccolo-100)) inset"
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
        "krillin-10": { 
          DEFAULT: withOpacityValue("--color--krillin-10"), 
        },
        "krillin-60": { 
          DEFAULT: withOpacityValue("--color--krillin-60") 
        },
        "krillin-100": { 
          DEFAULT: withOpacityValue("--color--krillin-100") 
        },
        "chi-chi-10": { 
          DEFAULT: withOpacityValue("--color--chi-chi-10") 
        },
        "chi-chi-60": { 
          DEFAULT: withOpacityValue("--color--chi-chi-60") 
        },
        "chi-chi-100": { 
          DEFAULT: withOpacityValue("--color--chi-chi-100") 
        },
        "roshi-10": { 
          DEFAULT: withOpacityValue("--color--roshi-10") 
        },
        "roshi-60": { 
          DEFAULT: withOpacityValue("--color--roshi-60") 
        },
        "roshi-100": { 
          DEFAULT: withOpacityValue("--color--roshi-100") 
        },
        "dodoria-10": { 
          DEFAULT: withOpacityValue("--color--dodoria-10") 
        },
        "dodoria-60": { 
          DEFAULT: withOpacityValue("--color--dodoria-60") 
        },
        "dodoria-100": { 
          DEFAULT: withOpacityValue("--color--dodoria-100") 
        },
        "cell-10": { 
          DEFAULT: withOpacityValue("--color--cell-10") 
        },
        "cell-60": { 
          DEFAULT: withOpacityValue("--color--cell-60") 
        },
        "cell-100": { 
          DEFAULT: withOpacityValue("--color--cell-100") 
        },
        "raditz-10": { 
          DEFAULT: withOpacityValue("--color--raditz-10") 
        },
        "raditz-60": { 
          DEFAULT: withOpacityValue("--color--raditz-60") 
        },
        "raditz-100": { 
          DEFAULT: withOpacityValue("--color--raditz-100") 
        },
        "whis-10": { 
          DEFAULT: withOpacityValue("--color--whis-10") 
        },
        "whis-60": { 
          DEFAULT: withOpacityValue("--color--whis-60") 
        },
        "whis-100": { 
          DEFAULT: withOpacityValue("--color--whis-100") 
        },
        "frieza-10": { 
          DEFAULT: withOpacityValue("--color--frieza-10") 
        },
        "frieza-60": { 
          DEFAULT: withOpacityValue("--color--frieza-60") 
        },
        "frieza-100": { 
          DEFAULT: withOpacityValue("--color--frieza-100") 
        },
        "nappa-10": { 
          DEFAULT: withOpacityValue("--color--nappa-10") 
        },
        "nappa-60": { 
          DEFAULT: withOpacityValue("--color--nappa-60") 
        },
        "nappa-100": { 
          DEFAULT: withOpacityValue("--color--nappa-100") 
        },
        "piccolo-80": { 
          DEFAULT: withOpacityValue("--color--piccolo-80") 
        },
        "piccolo-100": { 
          DEFAULT: withOpacityValue("--color--piccolo-100") 
        },
        "piccolo-120": { 
          DEFAULT: withOpacityValue("--color--piccolo-120") 
        },
        "hit-80": { 
          DEFAULT: withOpacityValue("--color--hit-80") 
        },
        "hit-100": { 
          DEFAULT: withOpacityValue("--color--hit-100") 
        },
        "hit-120": { 
          DEFAULT: withOpacityValue("--color--hit-120") 
        },
        "goten-100": { 
          DEFAULT: withOpacityValue("--color--goten-100") 
        },
        "goku-10": { 
          DEFAULT: withOpacityValue("--color--goku-10") 
        },
        "goku-40": { 
          DEFAULT: withOpacityValue("--color--goku-40") 
        },
        "goku-80": { 
          DEFAULT: withOpacityValue("--color--goku-80") 
        },
        "goku-100": { 
          DEFAULT: withOpacityValue("--color--goku-100") 
        },
        "goku-120": { 
          DEFAULT: withOpacityValue("--color--goku-120") 
        },
        "gohan-10": { 
          DEFAULT: withOpacityValue("--color--gohan-10") 
        },
        "gohan-40": { 
          DEFAULT: withOpacityValue("--color--gohan-40") 
        },
        "gohan-80": { 
          DEFAULT: withOpacityValue("--color--gohan-80") 
        },
        "gohan-100": { 
          DEFAULT: withOpacityValue("--color--gohan-100") 
        },
        "gohan-120": { 
          DEFAULT: withOpacityValue("--color--gohan-120") 
        },
        "beerus-100": { 
          DEFAULT: withOpacityValue("--color--beerus-100") 
        },
        "bulma-100": { 
          DEFAULT: withOpacityValue("--color--bulma-100") 
        },
        "trunks-100": { 
          DEFAULT: withOpacityValue("--color--trunks-100") 
        },
        black: "#000",
        hover: "rgba(34, 34, 37, 0.12)",
        "primary-hover": "rgba(0, 0, 0, 0.08)",
        "slate-200": "rgb(226 232 240)",
        "for-designers": "rgb(52 72 240)",
        "for-developers": "rgb(149 241 213)"
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
        '.btn-primary': {
          color: 'rgb(var(--goten))',
          backgroundColor: `rgb(var(--piccolo))`,
        },
        '.btn-secondary': {
          color: 'rgb(var(--bulma))',
          background: 'none',
          boxShadow: `inset 0 0 0 1px rgb(var(--trunks)/1)`,
          '&:hover': {
            boxShadow: `inset 0 0 0 1px rgb(var(--bulma))`,
          },
        },
        '.btn-tertiary': {
          color: 'rgb(var(--goten))',
          backgroundColor: 'rgb(var(--hit))',
        },
        '.anim-error': {
          transform: 'translate3d(0, 0, 0)',
          backfaceVisibility: 'hidden',
          perspective: '1000px',
        },
        '.anim-pulse': {
          boxShadow: '0 0 0 0 rgb(var(--piccolo))',
        },
        '.input-number-clear': {
          MozAppearance: 'textfield',
          '&::-webkit-inner-spin-button, &::-webkit-outer-spin-button': {
            opacity: 0,
          },
        },
        '.input-xl': {
          '&:not(:focus):not([disabled])::placeholder': {
            opacity: 0,
          },
          '&:not(:focus):not([disabled]):placeholder-shown + label': {
            top: '50%',
            marginTop: '-0.438rem',
            fontSize: '1rem',
            lineHeight: '1rem',
          },
        },
        '.input-dt-shared': {
          '&::-webkit-datetime-edit, &::-webkit-date-and-time-value': {
            display: 'block',
            padding: 0,
            height: '2.375rem',
            lineHeight: '2.375rem',
          },
          '&::-webkit-date-and-time-value': {
            paddingTop: '0.5rem',
          },
          '&::-webkit-calendar-picker-indicator': {
            position: 'absolute',
          },
        },
        '.input-lg-dt-shared': {
          '&::-webkit-datetime-edit': {
            height: '2.875rem',
            lineHeight: '2.875rem',
          },
          '&::-webkit-date-and-time-value': {
            paddingTop: '0.625rem',
          },
        },
        '.input-xl-dt-shared': {
          '&::-webkit-datetime-edit': {
            height: '3.5rem',
            lineHeight: '3.5rem',
          },
          '&::-webkit-date-and-time-value': {
            paddingTop: '1rem',
          },
        },
        '.input-xl-dt-label': {
          '&::-webkit-datetime-edit': {
            height: '2.25rem',
            lineHeight: '2.125rem',
          },
          '&::-webkit-date-and-time-value': {
            paddingTop: 0,
          },
        },
        '.input-d': {
          '&::-webkit-calendar-picker-indicator': {
            right: '0.875rem',
          },
        },
        '.input-t': {
          '&::-webkit-calendar-picker-indicator': {
            right: '0.875rem',
          },
        },
        '.input-d-rtl': {
          //type === 'date' rtl
          '&::-webkit-datetime-edit, &::-webkit-date-and-time-value': {
            position: 'absolute',
            right: '0',
          },
          '&::-webkit-calendar-picker-indicator': {
            left: '0.5rem',
          },
        },
        '.input-t-rtl': {
          //type === 'time' rtl
          '&::-webkit-datetime-edit, &::-webkit-date-and-time-value': {
            position: 'absolute',
            right: '0.5rem',
          },
          '&::-webkit-calendar-picker-indicator': {
            left: '0.5rem',
          },
        },
        '.input-dt-local-rtl': {
          //type === 'datetime-local' rtl
          '&::-webkit-datetime-edit, &::-webkit-date-and-time-value': {
            position: 'absolute',
            right: '0',
          },
          '&::-webkit-calendar-picker-indicator': {
            left: '0.5rem',
          },
        },
        '.input-rsb-hidden': {
          '&:not(:hover):not(:focus):not(:invalid)': {
            clipPath: `inset(calc(var(--border-i-width) * -1) 0.125rem calc(var(--border-i-width) * -1) 0)`,
          },
        },
        '.input-lsb-hidden': {
          '&:not(:hover):not(:focus):not(:invalid)': {
            clipPath: `inset(calc(var(--border-i-width) * -1) 0 calc(var(--border-i-width) * -1) 0.125rem)`,
          },
        },
        '.input-tbb-hidden': {
          '&:not(:hover):not(:focus):not(:invalid)': {
            clipPath: `inset(0.125rem calc(var(--border-i-width) * -1) 0 calc(var(--border-i-width) * -1))`,
          },
        },
        '.input-bbb-hidden': {
          '&:not(:hover):not(:focus):not(:invalid)': {
            clipPath: `inset(0 calc(var(--border-i-width) * -1) 0.125rem calc(var(--border-i-width) * -1))`,
          },
        },
        '.brcrumb-li': {
          '& a, & span': {
            padding: '0.5rem',
          },
        },
      });
    }),
  ],
};
