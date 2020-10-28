import aposta10Dark from '../../js_deps/sportsbet-design/packages/themes/src/aposta10Dark/aposta10Dark';
import aposta10Light from '../../js_deps/sportsbet-design/packages/themes/src/aposta10Light/aposta10Light';
import sportsbetDark from '../../js_deps/sportsbet-design/packages/themes/src/sportsbetDark/sportsbetDark';
import sportsbetLight from '../../js_deps/sportsbet-design/packages/themes/src/sportsbetLight/sportsbetLight';
import missionsToolDark from '../../js_deps/sportsbet-design/packages/themes/src/missionsToolDark/missionsToolDark';
import missionsToolLight from '../../js_deps/sportsbet-design/packages/themes/src/missionsToolLight/missionsToolLight';
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

const writeTheme = (jsTheme, exThemePath) => {
  const exObj: any = jsKeysToElixirKeys(jsTheme);

  const s = x => x;

  // fs.writeFileSync(
  //   `${exThemePath}.json`,
  //   JSON.stringify(exObj, null, 2).replace(/\\\"/g, "'")
  // );

  fs.writeFileSync(
    `${exThemePath}.scss`,
    `
$theme--base--space: ${s(exObj.base.space)};
$theme--base--font-size: ${s(exObj.base.font_size)};
$theme--base--line-height: ${s(exObj.base.line_height)};

$theme--border-style: ${s(exObj.border_style)};
$theme--border_width: ${s(exObj.border_width)};
$theme--border: ${s(exObj.border)};
$theme--box-shadow: ${s(exObj.box_shadow)};

$theme--breakpoint--small: ${s(exObj.breakpoint.small)};
$theme--breakpoint--medium: ${s(exObj.breakpoint.medium)};
$theme--breakpoint--large: ${s(exObj.breakpoint.large)};
$theme--breakpoint--xlarge: ${s(exObj.breakpoint.xlarge)};

$theme--font-face--regular--font-family: ${s(exObj.font_face[0]['@font-face'].font_family)};
$theme--font-face--regular--font-style: ${s(exObj.font_face[0]['@font-face'].font_style)};
$theme--font-face--regular--font-display: ${s(exObj.font_face[0]['@font-face'].font_display)};
$theme--font-face--regular--unicode-range: ${s(exObj.font_face[0]['@font-face'].unicode_range)};
$theme--font-face--regular--font-weight: ${s(exObj.font_face[0]['@font-face'].font_weight)};
$theme--font-face--regular--src: ${s(exObj.font_face[0]['@font-face'].src)};

$theme--font-face--semibold--font-family: ${s(exObj.font_face[1]['@font-face'].font_family)};
$theme--font-face--semibold--font-style: ${s(exObj.font_face[1]['@font-face'].font_style)};
$theme--font-face--semibold--font-display: ${s(exObj.font_face[1]['@font-face'].font_display)};
$theme--font-face--semibold--unicode-range: ${s(exObj.font_face[1]['@font-face'].unicode_range)};
$theme--font-face--semibold--font-weight: ${s(exObj.font_face[1]['@font-face'].font_weight)};
$theme--font-face--semibold--src: ${s(exObj.font_face[1]['@font-face'].src)};
        
$theme--font-family: ${s(exObj.font_family)};
$theme--font-size: ${s(exObj.font_size.body)};
$theme--font-weight--normal: ${s(exObj.font_weight.normal)};
$theme--font-weight--semibold: ${s(exObj.font_weight.semibold)};

$theme--max-width--default: ${s(exObj.max_width.default)};
$theme--max-width--large: ${s(exObj.max_width.large)};

$theme--opacity--disabled: ${s(exObj.opacity.disabled)};

$theme--radius--small: ${s(exObj.radius.small)};
$theme--radius--default: ${s(exObj.radius.default)};
$theme--radius--largest: ${s(exObj.radius.largest)};

$theme--space--xsmall: ${s(exObj.space.xsmall)};
$theme--space--small: ${s(exObj.space.small)};
$theme--space--default: ${s(exObj.space.default)};
$theme--space--medium: ${s(exObj.space.medium)};
$theme--space--large: ${s(exObj.space.large)};
$theme--space--xlarge: ${s(exObj.space.xlarge)};

$theme--transition-duration--slow: ${s(exObj.transition_duration.slow)};
$theme--transition-duration--default: ${s(exObj.transition_duration.default)};

$theme--z-index--carousel-control: ${s(exObj.z_index.carousel_control)};
$theme--z-index--dialog: ${s(exObj.z_index.carousel_control)};
$theme--z-index--toggle: ${s(exObj.z_index.toggle)};

$theme--color--text: ${s(exObj.color.text)};
$theme--color--background: ${s(exObj.color.background)};
        
${Object.keys(exObj.color)
  .filter((x) => typeof exObj.color[x] === 'object')
  .map((colorName) =>
    Object.keys(exObj.color[colorName])
      .map(
        (colorShade) =>
          `$theme--color--${colorName}-${colorShade}: ${s(
            exObj.color[colorName][colorShade]
          )};`
      )
      .join('\n')
  )
  .join('\n')}
    `
  );
};

// these are themes that use this
writeTheme(
  aposta10Dark,
  '../../assets/css/themes/aposta10_dark'
);
writeTheme(
  aposta10Light,
  '../../assets/css/themes/aposta10_light'
);
writeTheme(
  sportsbetDark,
  '../../assets/css/themes/sportsbet_dark'
);
writeTheme(
  sportsbetLight,
  '../../assets/css/themes/sportsbet_light'
);

writeTheme(
  missionsToolDark,
  '../../assets/css/themes/missions_dark'
);
writeTheme(
  missionsToolLight,
  '../../assets/css/themes/missions_light'
);