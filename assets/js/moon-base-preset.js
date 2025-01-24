const plugin = require("tailwindcss/plugin");
const components = require("./moon-components.js");

const commonBorderWidths = {
  "0": "var(--dimension-border-0)",
  "1": "var(--dimension-border-1)",
  "2": "var(--dimension-border-2)",
  "4": "var(--dimension-border-4)"
};

const commonBorderColors = {
  "active": "rgb(var(--semantic-color-border-active))",
  "brand": "rgb(var(--semantic-color-border-brand))",
  "brand-subtle": "rgb(var(--semantic-color-border-brand-subtle))",
  "caution": "rgb(var(--semantic-color-border-caution))",
  "discovery": "rgb(var(--semantic-color-border-discovery))",
  "force-dark": "rgb(var(--semantic-color-border-force-dark))",
  "force-light": "rgb(var(--semantic-color-border-force-light))",
  "info": "rgb(var(--semantic-color-border-info))",
  "inverse": "rgb(var(--semantic-color-border-inverse))",
  "negative": "rgb(var(--semantic-color-border-negative))",
  "positive": "rgb(var(--semantic-color-border-positive))",
  "primary": "rgb(var(--semantic-color-border-primary))",
  "secondary": "rgb(var(--semantic-color-border-secondary))"
};

const iconClasses = [
  "active",
  "brand",
  "caution",
  "discovery",
  "force-dark",
  "force-light",
  "info",
  "inverse",
  "negative",
  "positive",
  "primary",
  "secondary"
];

const textBodyPrefixes = [
  "100",
  "200",
  "300",
  "400",
  "500"
];

const textHeadingPrefixes = [
  "100",
  "200",
  "300",
  "400",
  "500"
];

const spacing = {
  "space--12": "var(--dimension-space--12)",
  "space--2": "var(--dimension-space--2)",
  "space--4": "var(--dimension-space--4)",
  "space-0": "var(--dimension-space-0)",
  "space-1": "var(--dimension-space-1)",
  "space-10": "var(--dimension-space-10)",
  "space-104": "var(--dimension-space-104)",
  "space-112": "var(--dimension-space-112)",
  "space-12": "var(--dimension-space-12)",
  "space-120": "var(--dimension-space-120)",
  "space-128": "var(--dimension-space-128)",
  "space-136": "var(--dimension-space-136)",
  "space-14": "var(--dimension-space-14)",
  "space-144": "var(--dimension-space-144)",
  "space-152": "var(--dimension-space-152)",
  "space-16": "var(--dimension-space-16)",
  "space-160": "var(--dimension-space-160)",
  "space-18": "var(--dimension-space-18)",
  "space-2": "var(--dimension-space-2)",
  "space-20": "var(--dimension-space-20)",
  "space-24": "var(--dimension-space-24)",
  "space-28": "var(--dimension-space-28)",
  "space-32": "var(--dimension-space-32)",
  "space-36": "var(--dimension-space-36)",
  "space-4": "var(--dimension-space-4)",
  "space-40": "var(--dimension-space-40)",
  "space-48": "var(--dimension-space-48)",
  "space-56": "var(--dimension-space-56)",
  "space-6": "var(--dimension-space-6)",
  "space-64": "var(--dimension-space-64)",
  "space-72": "var(--dimension-space-72)",
  "space-8": "var(--dimension-space-8)",
  "space-80": "var(--dimension-space-80)",
  "space-88": "var(--dimension-space-88)",
  "space-96": "var(--dimension-space-96)"
};

const borderRadius = {
  "0": "var(--dimension-rounded-0)",
  "2": "var(--dimension-rounded-2)",
  "4": "var(--dimension-rounded-4)",
  "6": "var(--dimension-rounded-6)",
  "8": "var(--dimension-rounded-8)",
  "12": "var(--dimension-rounded-12)",
  "16": "var(--dimension-rounded-16)",
  "20": "var(--dimension-rounded-20)",
  "24": "var(--dimension-rounded-24)",
  "32": "var(--dimension-rounded-32)",
  "full": "var(--dimension-rounded-full)"
};

const boxShadow = {
  "100": "var(--effect-shadow-100-layer-1-x) var(--effect-shadow-100-layer-1-y) var(--effect-shadow-100-layer-1-blur) var(--effect-shadow-100-layer-1-spread) rgb(var(--effect-shadow-100-layer-1-color)), var(--effect-shadow-100-layer-2-x) var(--effect-shadow-100-layer-2-y) var(--effect-shadow-100-layer-2-blur) var(--effect-shadow-100-layer-2-spread) rgb(var(--effect-shadow-100-layer-2-color))",
  "200": "var(--effect-shadow-200-layer-1-x) var(--effect-shadow-200-layer-1-y) var(--effect-shadow-200-layer-1-blur) var(--effect-shadow-200-layer-1-spread) rgb(var(--effect-shadow-200-layer-1-color)), var(--effect-shadow-200-layer-2-x) var(--effect-shadow-200-layer-2-y) var(--effect-shadow-200-layer-2-blur) var(--effect-shadow-200-layer-2-spread) rgb(var(--effect-shadow-200-layer-2-color))",
  "300": "var(--effect-shadow-300-layer-1-x) var(--effect-shadow-300-layer-1-y) var(--effect-shadow-300-layer-1-blur) var(--effect-shadow-300-layer-1-spread) rgb(var(--effect-shadow-300-layer-1-color)), var(--effect-shadow-300-layer-2-x) var(--effect-shadow-300-layer-2-y) var(--effect-shadow-300-layer-2-blur) var(--effect-shadow-300-layer-2-spread) rgb(var(--effect-shadow-300-layer-2-color))",
  "400": "var(--effect-shadow-400-layer-1-x) var(--effect-shadow-400-layer-1-y) var(--effect-shadow-400-layer-1-blur) var(--effect-shadow-400-layer-1-spread) rgb(var(--effect-shadow-400-layer-1-color)), var(--effect-shadow-400-layer-2-x) var(--effect-shadow-400-layer-2-y) var(--effect-shadow-400-layer-2-blur) var(--effect-shadow-400-layer-2-spread) rgb(var(--effect-shadow-400-layer-2-color))",
  "500": "var(--effect-shadow-500-layer-1-x) var(--effect-shadow-500-layer-1-y) var(--effect-shadow-500-layer-1-blur) var(--effect-shadow-500-layer-1-spread) rgb(var(--effect-shadow-500-layer-1-color)), var(--effect-shadow-500-layer-2-x) var(--effect-shadow-500-layer-2-y) var(--effect-shadow-500-layer-2-blur) var(--effect-shadow-500-layer-2-spread) rgb(var(--effect-shadow-500-layer-2-color))",
  "600": "var(--effect-shadow-600-layer-1-x) var(--effect-shadow-600-layer-1-y) var(--effect-shadow-600-layer-1-blur) var(--effect-shadow-600-layer-1-spread) rgb(var(--effect-shadow-600-layer-1-color)), var(--effect-shadow-600-layer-2-x) var(--effect-shadow-600-layer-2-y) var(--effect-shadow-600-layer-2-blur) var(--effect-shadow-600-layer-2-spread) rgb(var(--effect-shadow-600-layer-2-color))"
};

const backgroundColor = {
  "active": "rgb(var(--semantic-color-background-active))",
  "backdrop": "rgb(var(--semantic-color-background-backdrop))",
  "brand": "rgb(var(--semantic-color-background-brand))",
  "brand-subtle": "rgb(var(--semantic-color-background-brand-subtle))",
  "caution": "rgb(var(--semantic-color-background-caution))",
  "discovery": "rgb(var(--semantic-color-background-discovery))",
  "force-dark": "rgb(var(--semantic-color-background-force-dark))",
  "force-light": "rgb(var(--semantic-color-background-force-light))",
  "hover": "rgb(var(--semantic-color-background-hover))",
  "info": "rgb(var(--semantic-color-background-info))",
  "inverse": "rgb(var(--semantic-color-background-inverse))",
  "negative": "rgb(var(--semantic-color-background-negative))",
  "positive": "rgb(var(--semantic-color-background-positive))",
  "primary": "rgb(var(--semantic-color-background-primary))",
  "secondary": "rgb(var(--semantic-color-background-secondary))",
  "tertiary": "rgb(var(--semantic-color-background-tertiary))",
  "transparent": "rgb(var(--semantic-color-background-transparent))"
};

const textColor = {
  "active": "rgb(var(--semantic-color-text-active))",
  "brand": "rgb(var(--semantic-color-text-brand))",
  "caution": "rgb(var(--semantic-color-text-caution))",
  "discovery": "rgb(var(--semantic-color-text-discovery))",
  "force-dark": "rgb(var(--semantic-color-text-force-dark))",
  "force-light": "rgb(var(--semantic-color-text-force-light))",
  "info": "rgb(var(--semantic-color-text-info))",
  "inverse": "rgb(var(--semantic-color-text-inverse))",
  "link": "rgb(var(--semantic-color-text-link))",
  "negative": "rgb(var(--semantic-color-text-negative))",
  "positive": "rgb(var(--semantic-color-text-positive))",
  "primary": "rgb(var(--semantic-color-text-primary))",
  "secondary": "rgb(var(--semantic-color-text-secondary))"
};

const fontFamily = {
  "primary": "var(--text-font-family-primary)",
  "secondary": "var(--text-font-family-secondary)",
  "tertiary": "var(--text-font-family-tertiary)"
};

const opacity = {
  "0": "var(--effect-opacity-0)",
  "20": "var(--effect-opacity-20)",
  "40": "var(--effect-opacity-40)",
  "60": "var(--effect-opacity-60)",
  "80": "var(--effect-opacity-80)",
  "100": "var(--effect-opacity-100)"
};

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

const generateIconUtilities = (iconClasses) => {
  return iconClasses.reduce((acc, iconClass) => {
    acc[`.icon-${iconClass}`] = {
      color: `rgb(var(--semantic-color-icon-${iconClass}))`,
    };
    return acc;
  }, {});
};

module.exports = {
  plugins: [
    plugin(function ({ addComponents }) {
      const textBodyUtilities = generateTextUtilities("text-body", textBodyPrefixes);
      const textHeadingUtilities = generateTextUtilities("text-heading", textHeadingPrefixes);
      addComponents(components);
      addComponents({ ...textBodyUtilities, ...textHeadingUtilities });
    }),
    plugin(function ({ addUtilities }) {
      const iconUtilities = generateIconUtilities(iconClasses);
      addUtilities(iconUtilities);
    }),
  ],
  theme: {
    extend: {
      spacing: spacing,
      borderRadius: borderRadius,
      borderWidth: commonBorderWidths,
      divideWidth: commonBorderWidths,
      ringWidth: commonBorderWidths,
      outlineWidth: commonBorderWidths,
      boxShadow: boxShadow,
      backgroundColor: backgroundColor,
      textColor: textColor,
      borderColor: commonBorderColors,
      divideColor: commonBorderColors,
      ringColor: commonBorderColors,
      outlineColor: commonBorderColors,
      fontFamily: fontFamily,
      opacity: opacity,
    }
  }
};