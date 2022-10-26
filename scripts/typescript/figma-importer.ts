// PLEASE ENSURE THAT YOU UPDATE ALL FIGMA FILES IF YOU MAKE CHANGES HERE
// Also you need to run the importer to validate, that your changes work. 
// TODO theme manager GUI for Moon 

import * as fs from "fs";
import fetch from "node-fetch";

const exportDir = "../../priv/static/themes/";

console.log("Running Figma importer");

// tutorial https://blog.prototypr.io/design-tokens-with-figma-aef25c42430f
// figma tokens file https://www.figma.com/file/d5oitzaWXGiOuMjKDatC1W/Lab---Templates?node-id=1%3A7
// https://www.figma.com/file/d5oitzaWXGiOuMjKDatC1W/Lab-Templates?node-id=1%3A41

// https://www.figma.com/developers/api
const accessToken = process.env.FIGMA_ACCESS_TOKEN;

if (!accessToken) {
  throw new Error("Please define FIGMA_ACCESS_TOKEN env value.");
}

type ThemeConf = {
  name: string;
  fileId: string;
};

// configuration for themes
const themes: ThemeConf[] = [
  {
    name: "lab",
    fileId: "d5oitzaWXGiOuMjKDatC1W",
  },
  {
    name: "partners",
    fileId: "aMBmdNX4cfv885xchXHIHo",
  },
];

const getFigmaObjTree = async (
  figmaApiKey: string,
  figmaId: string
): Promise<any> => {
  let result = await fetch("https://api.figma.com/v1/files/" + figmaId, {
    method: "GET",
    headers: {
      "X-Figma-Token": figmaApiKey,
    },
  });
  return await result.json();
};

// const getChild = (root: any, childName: string) => {
//   return root.children.find((child: any) => {
//     return child.name.includes(childName);
//   });
// };

// const getValidColors = (root: any) => {
//   return root.children.filter((child: any) => {
//     return child && child.children && child.children.length > 1;
//   });
// };

const getFlatChildren = (children: any[]): any[] => {
  return children
    .map((x: any) => {
      if (x && x.children) {
        return [x, ...getFlatChildren(x.children)];
      }
      return [x];
    })
    .reduce((acc: any[], curr: any[]) => {
      return [...acc, ...curr];
    }, []);
};

const hexToRgb = (hex: string) => {
  const hexValue = hex.trim().padEnd(7, "0");
  var result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hexValue);
  if (result) {
    var r = parseInt(result[1], 16);
    var g = parseInt(result[2], 16);
    var b = parseInt(result[3], 16);
    return r + " " + g + " " + b; //return 23,14,45 -> reformat if needed
  }
  return null;
};

const colorIds = [
  "krillin-100",
  "krillin-60",
  "krillin-10",
  "chi-chi-100",
  "chi-chi-60",
  "chi-chi-10",
  "roshi-100",
  "roshi-60",
  "roshi-10",
  "dodoria-100",
  "dodoria-60",
  "dodoria-10",
  "cell-100",
  "cell-60",
  "cell-10",
  "raditz-100",
  "raditz-60",
  "raditz-10",
  "whis-100",
  "whis-60",
  "whis-10",
  "frieza-100",
  "frieza-60",
  "frieza-10",
  "nappa-100",
  "nappa-60",
  "nappa-10",
  "piccolo-100",
  "hit-100",
  "beerus-100",
  "gohan-100",
  "goten-100",
  "goku-100",
  "bulma-100",
  "trunks-100",
];

const boxShadowIds = [
  "box-shadow-sm",
  "box-shadow-md",
  "box-shadow-lg",
  "box-shadow-xl",
];

const extractIds = [
  "radius-i-xs",
  "radius-i-sm",
  "radius-i-md",
  "radius-s-xs",
  "radius-s-sm",
  "radius-s-md",
  "radius-s-lg",
  "breakpoint-sm",
  "breakpoint-md",
  "breakpoint-lg",
  "breakpoint-xl",
  "breakpoint-2xl",
  "border-width",
  "border-i-width",
  "space-xsmall",
  "space-small",
  "space-default",
  "space-medium",
  "space-large",
  "space-xlarge",
  "transition-slow",
  "transition-default",
  ...boxShadowIds.map((x) => `light-${x}`),
  ...boxShadowIds.map((x) => `dark-${x}`),
  "opacity-disabled",
  "font-family",
  "font-size",
  ...colorIds.map((x) => `light-color-${x}`),
  ...colorIds.map((x) => `dark-color-${x}`),
];

const getFigmaConfig = (elements: any[]): any => {
  return elements
    .filter((x: any) => extractIds.includes(x.name))
    .reduce((acc, curr) => {
      return { ...acc, [curr.name]: curr.characters.trim() };
    }, {});
};

const writeThemeFile = (name: string, content: string) => {
  fs.writeFileSync(`${exportDir}/${name}`, content);
};

const notifyIfSomeKeyMissing = (theme: ThemeConf, figmaConfig: any) => {
  const missingIds = extractIds.filter(x => !figmaConfig[x]).sort();
  if (missingIds.length > 0) {
    console.error(theme, "Missing keys", missingIds);
  }
};

themes.map(async (theme: ThemeConf) => {
  const conf = await getFigmaObjTree(accessToken, theme.fileId);
  const elements = getFlatChildren(conf.document.children);

  const figmaConfig = getFigmaConfig(elements);

  notifyIfSomeKeyMissing(theme, figmaConfig);

  // console.log(figmaConfig);
  console.log(figmaConfig);

  const fontFaceCss = `
@font-face {
  font-family: Averta Std;
  font-style: normal;
  font-display: swap;
  unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD;
  font-weight: 400;
  src: local("AvertaStd-Regular"), local("Averta Std Regular"), url(https://sportsbet.io/sportsbet-io/files/fonts/averta-std/regular.woff2) format("woff2");
}

@font-face {
  font-family: Averta Std;
  font-style: normal;
  font-display: swap;
  unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD;
  font-weight: 500;
  src: local("AvertaStd-Semibold"), local("Averta Std Semibold"), url(https://sportsbet.io/sportsbet-io/files/fonts/averta-std/semibold.woff2) format("woff2");
}
  `;

  const sharedCssVarsAndValues = `
  --base--font-size: ${figmaConfig["font-size"]};
  --base--line-height: 24px;

  --border-style: solid;
  --border-width: 1px;
  --border-i-width: 2px;
  --border: 1px solid;

  --breakpoint--sm: ${figmaConfig["breakpoint-sm"]};
  --breakpoint--md: ${figmaConfig["breakpoint-md"]};
  --breakpoint--lg: ${figmaConfig["breakpoint-lg"]};
  --breakpoint--xl: ${figmaConfig["breakpoint-xl"]};
  --breakpoint--2xl: ${figmaConfig["breakpoint-2xl"]};

  --opacity--disabled: ${figmaConfig["opacity-disabled"]};

  --radius-i-xs: ${figmaConfig["radius-i-xs"]};
  --radius-i-sm: ${figmaConfig["radius-i-sm"]};
  --radius-i-md: ${figmaConfig["radius-i-md"]};
  --radius-s-xs: ${figmaConfig["radius-s-xs"]};
  --radius-s-sm: ${figmaConfig["radius-s-sm"]};
  --radius-s-md: ${figmaConfig["radius-s-md"]};
  --radius-s-lg: ${figmaConfig["radius-s-lg"]};

  --space--xsmall: ${figmaConfig["space-xsmall"]};
  --space--small: ${figmaConfig["space-small"]};
  --space--default: ${figmaConfig["space-default"]};
  --space--medium: ${figmaConfig["space-medium"]};
  --space--large: ${figmaConfig["space-large"]};
  --space--xlarge: ${figmaConfig["space-xlarge"]};

  --transition-duration--slow: 0.4s;
  --transition-duration--default: 0.2s;

  --z-index--carousel-control: 5;
  --z-index--dialog: 10000;
  --z-index--toggle: 1;

  font-family: ${figmaConfig["font-family"]};
  font-weight: 400;
  font-size: var(--base--font-size);
  line-height: var(--base--line-height);
  color: rgba(var(--color--text));
  background-color: rgba(var(--color--goku-100));

  --color--text: var(--color--bulma-100);
  --color--background: rgba(var(--color--goku-100));
  `;

  const lightThemeCss = `
/* This file is automatically generated by run-auto-importers.sh DO NOT UPDATE IT MANUALLY */
${fontFaceCss}
.${theme.name}-light {
  ${sharedCssVarsAndValues}

  ${boxShadowIds
    .map(
      (x) => `
  --${x.replace("box-shadow", "box-shadow-")}: ${figmaConfig["light-"+x]};`
    )
    .join("")}
  --box-shadow: ${figmaConfig["light-box-shadow-md"]};
  --box-shadow--default: ${figmaConfig["light-box-shadow-md"]};

  ${colorIds
    .map(
      (x) => `
  --color--${x}: ${hexToRgb("#" + figmaConfig[`light-color-${x}`])}; /* #${
        figmaConfig[`light-color-${x}`]
      } */`
    )
    .join("")}
}
`;

  const darkThemeCss = `
/* This file is automatically generated by run-auto-importers.sh DO NOT UPDATE IT MANUALLY */
${fontFaceCss}
.${theme.name}-dark {
  ${sharedCssVarsAndValues}

  ${boxShadowIds
    .map(
      (x) => `
  --${x.replace("box-shadow", "box-shadow-")}: ${figmaConfig["dark-"+x] || figmaConfig["light-"+x]};`
    )
    .join("")}
  --box-shadow: ${figmaConfig["dark-box-shadow-md"] || figmaConfig["light-box-shadow-md"]};
  --box-shadow--default: ${figmaConfig["dark-box-shadow-md"] || figmaConfig["light-box-shadow-md"]};

  ${colorIds
    .map(
      (x) => `
  --color--${x}: ${hexToRgb("#" + figmaConfig[`dark-color-${x}`])}; /* #${
        figmaConfig[`dark-color-${x}`] || figmaConfig[`light-color-${x}`]
      } */`
    )
    .join("")}
}
`;

  writeThemeFile(`${theme.name}-light.css`, lightThemeCss);
  writeThemeFile(`${theme.name}-dark.css`, darkThemeCss);
});
