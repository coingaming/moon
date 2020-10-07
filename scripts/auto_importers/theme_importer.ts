import aposta10Dark from '../../js_deps/sportsbet-design/packages/themes/src/aposta10Dark/aposta10Dark';
import aposta10Light from '../../js_deps/sportsbet-design/packages/themes/src/aposta10Light/aposta10Light';
import sportsbetDark from '../../js_deps/sportsbet-design/packages/themes/src/sportsbetDark/sportsbetDark';
import sportsbetLight from '../../js_deps/sportsbet-design/packages/themes/src/sportsbetLight/sportsbetLight';
// import bitcasinoDark from '../../js_deps/sportsbet-design/packages/themes/src/bitcasinoDark/bitcasinoDark';
// import bitcasinoLight from '../../js_deps/sportsbet-design/packages/themes/src/bitcasinoLight/bitcasinoLight';
// import livecasinoDark from '../../js_deps/sportsbet-design/packages/themes/src/livecasinoDark/livecasinoDark';
// import livecasinoLight from '../../js_deps/sportsbet-design/packages/themes/src/livecasinoLight/livecasinoLight';

import * as fs from 'fs';

const capitalizeFirstLetter = (string) => {
  return string.charAt(0).toUpperCase() + string.slice(1);
};

const camelToSnakeCase = (str) =>
  str.replace(/[A-Z]/g, (letter) => `_${letter.toLowerCase()}`);

const jsKeysToElixirKeys = (obj) => {
  let newObj = Array.isArray(obj) ? [] : {};

  for (const k in obj) {
    newObj[camelToSnakeCase(k)] =
      typeof obj[k] == 'object' ? jsKeysToElixirKeys(obj[k]) : obj[k];
  }

  return newObj;
};

const toCamel = (s) => {
  return s.replace(/([-_][a-z])/gi, ($1) => {
    return $1.toUpperCase().replace('-', '').replace('_', '');
  });
};

const toCapitalisedCamel = (s) => capitalizeFirstLetter(toCamel(s));

const writeTheme = (jsTheme, exThemePath, moduleName, moduleId) => {
  const exObj: any = jsKeysToElixirKeys(jsTheme);

  const s = JSON.stringify;

  fs.writeFileSync(
    `${exThemePath}.json`,
    JSON.stringify(exObj, null, 2).replace(/\\\"/g, "'")
  );

  fs.writeFileSync(
    `${exThemePath}.ex`,
    `

defmodule ${moduleName}.Base do 
  defstruct space: ${s(exObj.base.space)},
    font_size: ${s(exObj.base.font_size)},
    line_height: ${s(exObj.base.line_height)}
end

defmodule ${moduleName}.Breakpoint do 
  defstruct small: ${s(exObj.breakpoint.small)},
    medium: ${s(exObj.breakpoint.medium)},
    large: ${s(exObj.breakpoint.large)},
    xlarge: ${s(exObj.breakpoint.xlarge)}
end

defmodule ${moduleName}.FontFace.Normal do 
  defstruct font_family: ${s(exObj.font_face[0]['@font-face'].font_family)},
    font_style: ${s(exObj.font_face[0]['@font-face'].font_style)},
    font_display: ${s(exObj.font_face[0]['@font-face'].font_display)},
    unicode_range: ${s(exObj.font_face[0]['@font-face'].unicode_range)},
    font_weight: ${s(exObj.font_face[0]['@font-face'].font_weight)},
    src: ${s(exObj.font_face[0]['@font-face'].src)}
end

defmodule ${moduleName}.FontFace.Semibold do 
  defstruct font_family: ${s(exObj.font_face[1]['@font-face'].font_family)},
    font_style: ${s(exObj.font_face[1]['@font-face'].font_style)},
    font_display: ${s(exObj.font_face[1]['@font-face'].font_display)},
    unicode_range: ${s(exObj.font_face[1]['@font-face'].unicode_range)},
    font_weight: ${s(exObj.font_face[1]['@font-face'].font_weight)},
    src: ${s(exObj.font_face[1]['@font-face'].src)}
end

defmodule ${moduleName}.FontFace do 
  defstruct regular: %${moduleName}.FontFace.Normal{},
    bold: %${moduleName}.FontFace.Semibold{}
end

defmodule ${moduleName}.FontWeight do 
  defstruct normal: ${s(exObj.font_weight.normal)},
    semibold: ${s(exObj.font_weight.semibold)}
end

defmodule ${moduleName}.MaxWidth do 
  defstruct default: ${s(exObj.max_width.default)},
    large: ${s(exObj.max_width.large)}
end

defmodule ${moduleName}.Opacity do 
  defstruct disabled: ${s(exObj.opacity.disabled)}
end

defmodule ${moduleName}.Radius do 
  defstruct small: ${s(exObj.radius.small)},
    default: ${s(exObj.radius.default)},
    largest: ${s(exObj.radius.largest)}
end

defmodule ${moduleName}.Space do 
  defstruct xsmall: ${s(exObj.space.xsmall)},
    small: ${s(exObj.space.small)},
    default: ${s(exObj.space.default)},
    medium: ${s(exObj.space.medium)},
    large: ${s(exObj.space.large)},
    xlarge: ${s(exObj.space.xlarge)}
end

defmodule ${moduleName}.TransitionDuration do 
  defstruct slow: ${s(exObj.transition_duration.slow)},
    default: ${s(exObj.transition_duration.default)}
end

defmodule ${moduleName}.ZIndex do 
  defstruct carousel_control: ${s(exObj.z_index.carousel_control)},
    dialog: ${s(exObj.z_index.carousel_control)},
    toggle: ${s(exObj.z_index.toggle)}
end

defmodule ${moduleName}.Color do 
  defstruct text: ${s(exObj.color.text)},
    background: ${s(exObj.color.background)},
${Object.keys(exObj.color)
  .filter((x) => typeof exObj.color[x] === 'object')
  .map((colorName) =>
    Object.keys(exObj.color[colorName])
      .map(
        (colorShade) =>
          `    ${colorName}_${colorShade}: ${s(
            exObj.color[colorName][colorShade]
          )}`
      )
      .join(',    \n')
  )
  .join(',    \n')}
end

defmodule ${moduleName} do 
  defstruct id: ${s(moduleId)},
    base: %${moduleName}.Base{},
    border_style: ${s(exObj.border_style)},
    border_width: ${s(exObj.border_width)},
    border: ${s(exObj.border)},
    box_shadow: ${s(exObj.box_shadow)},
    breakpoint: %${moduleName}.Breakpoint{},
    font_face: %${moduleName}.FontFace{},
    font_family: ${s(exObj.font_family)},
    font_size: ${s(exObj.font_size.body)},
    font_weight: %${moduleName}.FontWeight{},
    max_width: %${moduleName}.MaxWidth{},
    opacity: %${moduleName}.Opacity{},
    radius: %${moduleName}.Radius{},
    space: %${moduleName}.Space{},
    transition_duration: %${moduleName}.TransitionDuration{},
    z_index: %${moduleName}.ZIndex{},
    brand: ${s(exObj.brand)},
    color: %${moduleName}.Color{},
    color_scheme: ${s(exObj.color_scheme)}
end
    `
  );
};

writeTheme(
  aposta10Dark,
  '../../lib/moon/sites/aposta10/themes/dark',
  'Moon.Sites.Aposta10.Themes.Dark',
  'aposta10-dark'
);
writeTheme(
  aposta10Light,
  '../../lib/moon/sites/aposta10/themes/light',
  'Moon.Sites.Aposta10.Themes.Light',
  'aposta10-light'
);
writeTheme(
  sportsbetDark,
  '../../lib/moon/sites/moon_docs/themes/dark',
  'Moon.Sites.MoonDocs.Themes.Dark',
  'moondocs-dark'
);
writeTheme(
  sportsbetLight,
  '../../lib/moon/sites/moon_docs/themes/light',
  'Moon.Sites.MoonDocs.Themes.Light',
  'moondocs-light'
);
