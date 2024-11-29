const plugin = require("tailwindcss/plugin");
const components = require("./moon-components.js");

const commonBorderWidths = {
  0: "var(--dimension-border-0)",
  1: "var(--dimension-border-1)",
  2: "var(--dimension-border-2)",
  4: "var(--dimension-border-4)",
};

const commonBorderColors = {
  primary: "var(--semantic-border-primary)",
  secondary: "var(--semantic-border-secondary)",
  brand: "var(--semantic-border-brand)",
  positive: "var(--semantic-border-positive)",
  caution: "var(--semantic-border-caution)",
  negative: "var(--semantic-border-negative)",
  info: "var(--semantic-border-info)",
  discovery: "var(--semantic-border-discovery)",
  active: "var(--semantic-border-active)",
  "force-light": "var(--semantic-border-forcelight)",
  "force-dark": "var(--semantic-border-forcedark)",
};

const iconClasses = [
  "primary",
  "secondary",
  "brand",
  "inverse",
  "positive",
  "caution",
  "negative",
  "info",
  "discovery",
  "active",
  "force-light",
  "force-dark",
];

// Utility function to generate text styles
const generateTextUtilities = (prefix, levels) => {
  return levels.reduce((acc, level) => {
    acc[`.${prefix}-${level}`] = {
      fontWeight: `var(--${prefix}-${level}-font-weight)`,
      fontSize: `var(--${prefix}-${level}-font-size)`,
      lineHeight: `var(--${prefix}-${level}-line-height)`,
      fontFamily: `var(--${prefix}-${level}-font-family)`,
    };
    return acc;
  }, {});
};

module.exports = {
  plugins: [
    // Plugin to add Moon Components and Text Utilities
    plugin(function ({ addComponents }) {
      const textBodyUtilities = generateTextUtilities("text-body", [
        "100",
        "200",
        "300",
        "400",
        "500",
      ]);

      const textHeadingUtilities = generateTextUtilities("text-heading", [
        "100",
        "200",
        "300",
        "400",
        "500",
      ]);
      addComponents(components);
      addComponents({ ...textBodyUtilities, ...textHeadingUtilities });
    }),
    // Plugin to add custom icon classes
    plugin(function ({ addUtilities }) {
      const iconUtilities = iconClasses.reduce((acc, iconClass) => {
        acc[`.icon-${iconClass}`] = {
          color: `var(--semantic-icon-${iconClass.replace(/-/g, "")})`,
        };
        return acc;
      }, {});

      addUtilities(iconUtilities);
    }),
  ],
  theme: {
    extend: {
      spacing: {
        "space-0": "var(--dimension-space-0)",
        "space-1": "var(--dimension-space-1)",
        "space-2": "var(--dimension-space-2)",
        "space-4": "var(--dimension-space-4)",
        "space-6": "var(--dimension-space-6)",
        "space-8": "var(--dimension-space-8)",
        "space-10": "var(--dimension-space-10)",
        "space-12": "var(--dimension-space-12)",
        "space-14": "var(--dimension-space-14)",
        "space-16": "var(--dimension-space-16)",
        "space-18": "var(--dimension-space-18)",
        "space-20": "var(--dimension-space-20)",
        "space-24": "var(--dimension-space-24)",
        "space-28": "var(--dimension-space-28)",
        "space-32": "var(--dimension-space-32)",
        "space-36": "var(--dimension-space-36)",
        "space-40": "var(--dimension-space-40)",
        "space-48": "var(--dimension-space-48)",
        "space-56": "var(--dimension-space-56)",
        "space-64": "var(--dimension-space-64)",
        "space-72": "var(--dimension-space-72)",
        "space-80": "var(--dimension-space-80)",
        "space-88": "var(--dimension-space-88)",
        "space-96": "var(--dimension-space-96)",
        "space-104": "var(--dimension-space-104)",
        "space-112": "var(--dimension-space-112)",
        "space-120": "var(--dimension-space-120)",
        "space-128": "var(--dimension-space-128)",
        "space-136": "var(--dimension-space-136)",
        "space-144": "var(--dimension-space-144)",
        "space-152": "var(--dimension-space-152)",
        "space-160": "var(--dimension-space-160)",
      },
      borderRadius: {
        0: "var(--dimension-rounded-0)",
        2: "var(--dimension-rounded-2)",
        4: "var(--dimension-rounded-4)",
        6: "var(--dimension-rounded-6)",
        8: "var(--dimension-rounded-8)",
        12: "var(--dimension-rounded-12)",
        16: "var(--dimension-rounded-16)",
        24: "var(--dimension-rounded-24)",
        32: "var(--dimension-rounded-32)",
        full: "var(--dimension-rounded-full)",
      },
      borderWidth: commonBorderWidths,
      divideWidth: commonBorderWidths,
      ringWidth: commonBorderWidths,
      outlineWidth: commonBorderWidths,
      boxShadow: {
        100: "var(--effect-shadow-100-layer1-x) var(--effect-shadow-100-layer1-y) var(--effect-shadow-100-layer1-blur) var(--effect-shadow-100-layer1-spread) var(--effect-shadow-100-layer1-color), var(--effect-shadow-100-layer2-x) var(--effect-shadow-100-layer2-y) var(--effect-shadow-100-layer2-blur) var(--effect-shadow-100-layer2-spread) var(--effect-shadow-100-layer2-color)",
        200: "var(--effect-shadow-200-layer1-x) var(--effect-shadow-200-layer1-y) var(--effect-shadow-200-layer1-blur) var(--effect-shadow-200-layer1-spread) var(--effect-shadow-200-layer1-color), var(--effect-shadow-200-layer2-x) var(--effect-shadow-200-layer2-y) var(--effect-shadow-200-layer2-blur) var(--effect-shadow-200-layer2-spread) var(--effect-shadow-200-layer2-color)",
        300: "var(--effect-shadow-300-layer1-x) var(--effect-shadow-300-layer1-y) var(--effect-shadow-300-layer1-blur) var(--effect-shadow-300-layer1-spread) var(--effect-shadow-300-layer1-color), var(--effect-shadow-300-layer2-x) var(--effect-shadow-300-layer2-y) var(--effect-shadow-300-layer2-blur) var(--effect-shadow-300-layer2-spread) var(--effect-shadow-300-layer2-color)",
        400: "var(--effect-shadow-400-layer1-x) var(--effect-shadow-400-layer1-y) var(--effect-shadow-400-layer1-blur) var(--effect-shadow-400-layer1-spread) var(--effect-shadow-400-layer1-color), var(--effect-shadow-300-layer2-x) var(--effect-shadow-300-layer2-y) var(--effect-shadow-300-layer2-blur) var(--effect-shadow-300-layer2-spread) var(--effect-shadow-300-layer2-color)",
        500: "var(--effect-shadow-500-layer1-x) var(--effect-shadow-500-layer1-y) var(--effect-shadow-500-layer1-blur) var(--effect-shadow-500-layer1-spread) var(--effect-shadow-500-layer1-color), var(--effect-shadow-500-layer2-x) var(--effect-shadow-500-layer2-y) var(--effect-shadow-500-layer2-blur) var(--effect-shadow-500-layer2-spread) var(--effect-shadow-500-layer2-color)",
        600: "var(--effect-shadow-600-layer1-x) var(--effect-shadow-600-layer1-y) var(--effect-shadow-600-layer1-blur) var(--effect-shadow-600-layer1-spread) var(--effect-shadow-600-layer1-color), var(--effect-shadow-600-layer2-x) var(--effect-shadow-600-layer2-y) var(--effect-shadow-600-layer2-blur) var(--effect-shadow-600-layer2-spread) var(--effect-shadow-600-layer2-color)",
      },
      backgroundColor: {
        primary: "var(--semantic-background-primary)",
        secondary: "var(--semantic-background-secondary)",
        tertiary: "var(--semantic-background-tertiary)",
        brand: "var(--semantic-background-brand)",
        inverse: "var(--semantic-background-inverse)",
        positive: "var(--semantic-background-positive)",
        caution: "var(--semantic-background-caution)",
        negative: "var(--semantic-background-negative)",
        info: "var(--semantic-background-info)",
        discovery: "var(--semantic-background-discovery)",
        active: "var(--semantic-background-active)",
        hover: "var(--semantic-background-hover)",
        backdrop: "var(--semantic-background-backdrop)",
        "force-light": "var(--semantic-background-forcelight)",
        "force-dark": "var(--semantic-background-forcedark)",
      },
      textColor: {
        primary: "var(--semantic-text-primary)",
        secondary: "var(--semantic-text-secondary)",
        brand: "var(--semantic-text-brand)",
        inverse: "var(--semantic-text-inverse)",
        positive: "var(--semantic-text-positive)",
        caution: "var(--semantic-text-caution)",
        negative: "var(--semantic-text-negative)",
        info: "var(--semantic-text-info)",
        discovery: "var(--semantic-text-discovery)",
        active: "var(--semantic-text-active)",
        link: "var(--semantic-text-link)",
        "force-light": "var(--semantic-text-forcelight)",
        "force-dark": "var(--semantic-text-forcedark)",
      },
      borderColor: commonBorderColors,
      divideColor: commonBorderColors,
      ringColor: commonBorderColors,
      outlineColor: commonBorderColors,
      fontFamily: {
        primary: "var(--text-font-family-primary)",
        secondary: "var(--text-font-family-secondary)",
        tertiary: "var(--text-font-family-tertiary)",
      },
      opacity: {
        0: "var(--effect-opacity-0)",
        20: "var(--effect-opacity-20)",
        40: "var(--effect-opacity-40)",
        60: "var(--effect-opacity-60)",
        80: "var(--effect-opacity-80)",
        100: "var(--effect-opacity-100)",
      },
    },
  },
};
