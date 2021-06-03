import * as fs from 'fs';
import fetch from 'node-fetch';

const exportDir = '../../assets/css/themes/';

console.log('Running Figma importer');

// tutorial https://blog.prototypr.io/design-tokens-with-figma-aef25c42430f
// figma tokens file https://www.figma.com/file/d5oitzaWXGiOuMjKDatC1W/Lab---Templates?node-id=1%3A7

// https://www.figma.com/developers/api
// TODO this is really not secure, especially when project goes public
const accessToken = '192730-97a241b4-a87d-4704-bd42-27ab884057b5';

type ThemeConf = {
  name: string;
  fileId: string;
};

// configuration for themes
const themes: ThemeConf[] = [
  {
    name: 'lab',
    fileId: 'd5oitzaWXGiOuMjKDatC1W',
  },
];

const getFigmaObjTree = async (
  figmaApiKey: string,
  figmaId: string
): Promise<any> => {
  let result = await fetch('https://api.figma.com/v1/files/' + figmaId, {
    method: 'GET',
    headers: {
      'X-Figma-Token': figmaApiKey,
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

const colorIds = [
  'krillin-100',
  'krillin-10',
  'chi-chi-100',
  'chi-chi-10',
  'roshi-100',
  'roshi-10',
  'dodoria-100',
  'dodoria-10',
  'cell-100',
  'cell-10',
  'raditz-100',
  'raditz-10',
  'whis-100',
  'whis-10',
  'frieza-100',
  'frieza-10',
  'nappa-100',
  'nappa-10',
  'piccolo-120',
  'piccolo-100',
  'piccolo-80',
  'hit-120',
  'hit-100',
  'hit-80',
  'beerus-100',
  'goku-100',
  'goku-80',
  'goku-40',
  'goku-10',
  'gohan-100',
  'gohan-80',
  'gohan-40',
  'gohan-10',
  'goten-100',
  'bulma-100',
  'trunks-100',
];

const boxShadowIds = [
  'box-shadow-4',
  'box-shadow-8',
  'box-shadow-16',
  'box-shadow-64',
];

const extractIds = [
  'radius-small',
  'radius-medium',
  'radius-large',
  'radius-full',
  'breakpoint-small',
  'breakpoint-medium',
  'breakpoint-large',
  'breakpoint-xlarge',
  'border-width',
  'border-style',
  'border',
  'border-input-focus',
  'space-xsmall',
  'space-small',
  'space-default',
  'space-medium',
  'space-large',
  'space-xlarge',
  'transition-slow',
  'transition-default',
  ...boxShadowIds,
  ...boxShadowIds.map((x) => `dark-${x}`),
  'opacity-disabled',
  'font-family',
  'font-size',
  ...colorIds.map((x) => `color-${x}`),
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

themes.map(async (theme: ThemeConf) => {
  const conf = await getFigmaObjTree(accessToken, theme.fileId);
  const elements = getFlatChildren(conf.document.children);

  const figmaConfig = getFigmaConfig(elements);

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

  const lightThemeCss = `
${fontFaceCss}

.${theme.name}-light {
  --base--space: ${figmaConfig['space-default']};
  --base--font-size: ${figmaConfig['font-size']};
  --base--line-height: 20px;
  
  --border-style: ${figmaConfig['border-style']};
  --border-width: ${figmaConfig['border-width']};
  --border: ${figmaConfig['border']};
  --box-shadow: ${figmaConfig['box-shadow-4']};
  
  --breakpoint--small: ${figmaConfig['breakpoint-small']};
  --breakpoint--medium: ${figmaConfig['breakpoint-medium']};
  --breakpoint--large: ${figmaConfig['breakpoint-large']};
  --breakpoint--xlarge: ${figmaConfig['breakpoint-xlarge']};
  
  --font-face--regular--font-family: Averta Std;
  --font-face--regular--font-style: normal;
  --font-face--regular--font-display: swap;
  --font-face--regular--unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD;
  --font-face--regular--font-weight: 400;
  --font-face--regular--src: local("AvertaStd-Regular"), local("Averta Std Regular"), url(https://sportsbet.io/sportsbet-io/files/fonts/averta-std/regular.woff2) format("woff2");
  
  --font-face--semibold--font-family: Averta Std;
  --font-face--semibold--font-style: normal;
  --font-face--semibold--font-display: swap;
  --font-face--semibold--unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD;
  --font-face--semibold--font-weight: 500;
  --font-face--semibold--src: local("AvertaStd-Semibold"), local("Averta Std Semibold"), url(https://sportsbet.io/sportsbet-io/files/fonts/averta-std/semibold.woff2) format("woff2");
          
  --font-family: Averta Std, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans, Ubuntu, Cantarell, "Helvetica Neue", sans-serif;
  --font-size: ${figmaConfig['breakpoint-xlarge']};
  --font-weight--normal: 400;
  --font-weight--semibold: 500;
  
  --max-width--default: 1024;
  --max-width--large: 1440;
  
  --opacity--disabled: 0.35;
  
  --radius--small: ${figmaConfig['radius-small']};
  --radius--medium: ${figmaConfig['radius-medium']};
  --radius--large: ${figmaConfig['radius-large']};
  --radius--full: ${figmaConfig['radius-full']};
  
  --space--xsmall: ${figmaConfig['space-xsmall']};
  --space--small: ${figmaConfig['space-small']};
  --space--default: ${figmaConfig['space-default']};
  --space--medium: ${figmaConfig['space-medium']};
  --space--large: ${figmaConfig['space-large']};
  --space--xlarge: ${figmaConfig['space-xlarge']};
  
  --transition-duration--slow: ${figmaConfig['transition-slow']};
  --transition-duration--default: ${figmaConfig['transition-default']};
  
  --z-index--carousel-control: 5;
  --z-index--dialog: 1000;
  --z-index--toggle: 1;
  
  --color--text: ${figmaConfig['bulma-100']};
  --color--background: ${figmaConfig['goku-100']};

  ${colorIds
    .map(
      (x) => `
  --color--${x}: #${figmaConfig[`color-${x}`]};`
    )
    .join('')}
            
  space: var(--base--space);
  font-size: var(--base--font-size);
  line-height: var(--base--line-height);
  color: var(--color--text);
  background-color: var(--color--background);
  font-family: var(--font-family);
  font-weight: var(--font-face--regular--font-weight);
}
  `;

  const darkThemeCss = `
  ${fontFaceCss}
  
  .${theme.name}-dark {
    --base--space: ${figmaConfig['space-default']};
    --base--font-size: ${figmaConfig['font-size']};
    --base--line-height: 20px;
    
    --border-style: ${figmaConfig['border-style']};
    --border-width: ${figmaConfig['border-width']};
    --border: ${figmaConfig['border']};
    --box-shadow: ${figmaConfig['box-shadow-4']};
    
    --breakpoint--small: ${figmaConfig['breakpoint-small']};
    --breakpoint--medium: ${figmaConfig['breakpoint-medium']};
    --breakpoint--large: ${figmaConfig['breakpoint-large']};
    --breakpoint--xlarge: ${figmaConfig['breakpoint-xlarge']};
    
    --font-face--regular--font-family: Averta Std;
    --font-face--regular--font-style: normal;
    --font-face--regular--font-display: swap;
    --font-face--regular--unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD;
    --font-face--regular--font-weight: 400;
    --font-face--regular--src: local("AvertaStd-Regular"), local("Averta Std Regular"), url(https://sportsbet.io/sportsbet-io/files/fonts/averta-std/regular.woff2) format("woff2");
    
    --font-face--semibold--font-family: Averta Std;
    --font-face--semibold--font-style: normal;
    --font-face--semibold--font-display: swap;
    --font-face--semibold--unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD;
    --font-face--semibold--font-weight: 500;
    --font-face--semibold--src: local("AvertaStd-Semibold"), local("Averta Std Semibold"), url(https://sportsbet.io/sportsbet-io/files/fonts/averta-std/semibold.woff2) format("woff2");
            
    --font-family: Averta Std, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans, Ubuntu, Cantarell, "Helvetica Neue", sans-serif;
    --font-size: ${figmaConfig['breakpoint-xlarge']};
    --font-weight--normal: 400;
    --font-weight--semibold: 500;
    
    --max-width--default: 1024;
    --max-width--large: 1440;
    
    --opacity--disabled: 0.35;
    
    --radius--small: ${figmaConfig['radius-small']};
    --radius--medium: ${figmaConfig['radius-medium']};
    --radius--large: ${figmaConfig['radius-large']};
    --radius--full: ${figmaConfig['radius-full']};
    
    --space--xsmall: ${figmaConfig['space-xsmall']};
    --space--small: ${figmaConfig['space-small']};
    --space--default: ${figmaConfig['space-default']};
    --space--medium: ${figmaConfig['space-medium']};
    --space--large: ${figmaConfig['space-large']};
    --space--xlarge: ${figmaConfig['space-xlarge']};
    
    --transition-duration--slow: ${figmaConfig['transition-slow']};
    --transition-duration--default: ${figmaConfig['transition-default']};
    
    --z-index--carousel-control: 5;
    --z-index--dialog: 1000;
    --z-index--toggle: 1;
    
    --color--text: ${figmaConfig['bulma-100']};
    --color--background: ${figmaConfig['goku-100']};
  
    ${colorIds
      .map(
        (x) => `
    --color--${x}: #${figmaConfig[`dark-color-${x}`]};`
      )
      .join('')}
              
    space: var(--base--space);
    font-size: var(--base--font-size);
    line-height: var(--base--line-height);
    color: var(--color--text);
    background-color: var(--color--background);
    font-family: var(--font-family);
    font-weight: var(--font-face--regular--font-weight);
  }
    `;

  writeThemeFile(`${theme.name}-light.scss`, lightThemeCss);
  writeThemeFile(`${theme.name}-dark.scss`, darkThemeCss);

  // const tokensConfiguration = getChild(conf.document, 'Tokens configuration');
  // const tokensTemplate = getChild(tokensConfiguration, 'Tokens template');
  // const body = getChild(tokensTemplate, 'Body');
  // const bodyRadiusAndBreakpoints = getChild(body, 'Border Radius & Breakpoint');
  // const borderStyleAndSpacing = getChild(body, 'Border Style & Spacing');
  // const transitionAndZIndex = getChild(body, 'Transition & Z-Index');
  // const boxShadow = getChild(body, 'Box-Shadow');
  // const opacity = getChild(body, 'Opacity');
  // const font = getChild(body, 'Font');
  // const color = getChild(body, 'Color');
  // const colorContent = getChild(color, 'Content');
  // const supportColors = getChild(colorContent, 'Supprotive Color');
  // const brandColors = getChild(colorContent, 'Brand Colors');
  // const validSupportColors = getValidColors(supportColors);
  // const validBrandColors = getValidColors(brandColors);
  // validSupportColors.map((validSupportColor: any) => {
  //     console.log("---")
  //     console.log(validSupportColor.name)
  //     try {
  //     console.log(validSupportColor.children[0].children[1].children[1].name);
  //     } catch (e) {
  //     console.error(e);
  //     }
  // });
});
