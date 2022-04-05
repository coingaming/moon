import * as fs from "fs";
import aposta10Dark from "./moon-design/packages/themes/src/aposta10Dark/aposta10Dark";
import aposta10Light from "./moon-design/packages/themes/src/aposta10Light/aposta10Light";
import bitcasinoDark from "./moon-design/packages/themes/src/bitcasinoDark/bitcasinoDark";
import bitcasinoLight from "./moon-design/packages/themes/src/bitcasinoLight/bitcasinoLight";
import bombayClub from "./moon-design/packages/themes/src/bombayClub/bombayClub";
import btcxe from "./moon-design/packages/themes/src/btcxe/btcxe";
import hub88 from "./moon-design/packages/themes/src/hub88/hub88";
import livecasinoDark from "./moon-design/packages/themes/src/livecasinoDark/livecasinoDark";
import livecasinoLight from "./moon-design/packages/themes/src/livecasinoLight/livecasinoLight";
import luckyslots from "./moon-design/packages/themes/src/luckyslots/luckyslots";
import missionsToolDark from "./moon-design/packages/themes/src/missionsToolDark/missionsToolDark";
import missionsToolLight from "./moon-design/packages/themes/src/missionsToolLight/missionsToolLight";
import moneyballDark from "./moon-design/packages/themes/src/moneyball/moneyballDark";
import moneyballLight from "./moon-design/packages/themes/src/moneyball/moneyballLight";
import moonDesignDark from "./moon-design/packages/themes/src/moonDesignDark/moonDesignDark";
import moonDesignLight from "./moon-design/packages/themes/src/moonDesignLight/moonDesignLight";
import slotsDark from "./moon-design/packages/themes/src/slotsDark/slotsDark";
import slotsLight from "./moon-design/packages/themes/src/slotsLight/slotsLight";
import sportsbetDark from "./moon-design/packages/themes/src/sportsbetDark/sportsbetDark";
import sportsbetLight from "./moon-design/packages/themes/src/sportsbetLight/sportsbetLight";

const themes: any = {
  aposta10Dark,
  aposta10Light,
  bitcasinoDark,
  bitcasinoLight,
  bombayClub,
  btcxe,
  hub88,
  livecasinoDark,
  livecasinoLight,
  luckyslots,
  missionsToolDark,
  missionsToolLight,
  moneyballDark,
  moneyballLight,
  moonDesignDark,
  moonDesignLight,
  slotsDark,
  slotsLight,
  sportsbetDark,
  sportsbetLight,
};

const capitalizeFirstLetter = (string: string) => {
  return string.charAt(0).toUpperCase() + string.slice(1);
};

const camelToSnakeCase = (str: string) =>
  str.replace(/[A-Z]/g, (letter) => `_${letter.toLowerCase()}`);

const jsKeysToElixirKeys = (obj: any) => {
  let newObj: any = Array.isArray(obj) ? [] : {};

  for (const k in obj) {
    newObj[camelToSnakeCase(k)] =
      typeof obj[k] == "object" ? jsKeysToElixirKeys(obj[k]) : obj[k];
  }

  return newObj;
};

const toCamel = (s: string) => {
  return s.replace(/([-_][a-z])/gi, ($1) => {
    return $1.toUpperCase().replace("-", "").replace("_", "");
  });
};

const toCapitalisedCamel = (s: string) => capitalizeFirstLetter(toCamel(s));

const writeTheme = (jsTheme: any, exThemePath: string) => {
  const exObj: any = jsKeysToElixirKeys(jsTheme);

  const s = (x: any) => x;

  // fs.writeFileSync(
  //   `${exThemePath}.json`,
  //   JSON.stringify(exObj, null, 2).replace(/\\\"/g, "'")
  // );

  const themeName = exThemePath.split("/").splice(-1)[0];

  fs.writeFileSync(
    `${exThemePath}.css`,
    `
@font-face {
  font-family: ${s(exObj.font_face[0]["@font-face"].font_family)};
  font-style: ${s(exObj.font_face[0]["@font-face"].font_style)};
  font-display: ${s(exObj.font_face[0]["@font-face"].font_display)};
  unicode-range: ${s(exObj.font_face[0]["@font-face"].unicode_range)};
  font-weight: ${s(exObj.font_face[0]["@font-face"].font_weight)};
  src: ${s(exObj.font_face[0]["@font-face"].src)};
}

@font-face {
  font-family: ${s(exObj.font_face[1]["@font-face"].font_family)};
  font-style: ${s(exObj.font_face[1]["@font-face"].font_style)};
  font-display: ${s(exObj.font_face[1]["@font-face"].font_display)};
  unicode-range: ${s(exObj.font_face[1]["@font-face"].unicode_range)};
  font-weight: ${s(exObj.font_face[1]["@font-face"].font_weight)};
  src: ${s(exObj.font_face[1]["@font-face"].src)};
}

.${themeName} {
--base--space: ${s(exObj.base.space)}px;
--base--font-size: ${s(exObj.base.font_size)}px;
--base--line-height: ${s(exObj.base.line_height)}px;

--border-style: ${s(exObj.border_style)};
--border-width: ${s(exObj.border_width)}px;
--border: ${s(exObj.border)};
--box-shadow: ${s(exObj.box_shadow)};

--breakpoint--small: ${s(exObj.breakpoint.small)}px;
--breakpoint--medium: ${s(exObj.breakpoint.medium)}px;
--breakpoint--large: ${s(exObj.breakpoint.large)}px;
--breakpoint--xlarge: ${s(exObj.breakpoint.xlarge)}px;

--font-face--regular--font-family: ${s(
      exObj.font_face[0]["@font-face"].font_family
    )};
--font-face--regular--font-style: ${s(
      exObj.font_face[0]["@font-face"].font_style
    )};
--font-face--regular--font-display: ${s(
      exObj.font_face[0]["@font-face"].font_display
    )};
--font-face--regular--unicode-range: ${s(
      exObj.font_face[0]["@font-face"].unicode_range
    )};
--font-face--regular--font-weight: ${s(
      exObj.font_face[0]["@font-face"].font_weight
    )};
--font-face--regular--src: ${s(exObj.font_face[0]["@font-face"].src)};

--font-face--semibold--font-family: ${s(
      exObj.font_face[1]["@font-face"].font_family
    )};
--font-face--semibold--font-style: ${s(
      exObj.font_face[1]["@font-face"].font_style
    )};
--font-face--semibold--font-display: ${s(
      exObj.font_face[1]["@font-face"].font_display
    )};
--font-face--semibold--unicode-range: ${s(
      exObj.font_face[1]["@font-face"].unicode_range
    )};
--font-face--semibold--font-weight: ${s(
      exObj.font_face[1]["@font-face"].font_weight
    )};
--font-face--semibold--src: ${s(exObj.font_face[1]["@font-face"].src)};
        
--font-family: ${s(exObj.font_family)};
--font-size: ${s(exObj.font_size.body)};
--font-weight--normal: ${s(exObj.font_weight.normal)};
--font-weight--semibold: ${s(exObj.font_weight.semibold)};

--max-width--default: ${s(exObj.max_width.default)};
--max-width--large: ${s(exObj.max_width.large)};

--opacity--disabled: ${s(exObj.opacity.disabled)};

--radius--small: ${s(exObj.radius.small)}px;
--radius--default: ${s(exObj.radius.default)}px;
--radius--largest: ${s(exObj.radius.largest)}px;

--space--xsmall: ${s(exObj.space.xsmall)}px;
--space--small: ${s(exObj.space.small)}px;
--space--default: ${s(exObj.space.default)}px;
--space--medium: ${s(exObj.space.medium)}px;
--space--large: ${s(exObj.space.large)}px;
--space--xlarge: ${s(exObj.space.xlarge)}px;

--transition-duration--slow: ${s(exObj.transition_duration.slow)}s;
--transition-duration--default: ${s(exObj.transition_duration.default)}s;

--z-index--carousel-control: ${s(exObj.z_index.carousel_control)};
--z-index--dialog: ${s(exObj.z_index.carousel_control)};
--z-index--toggle: ${s(exObj.z_index.toggle)};

--color--text: ${s(
      exObj.color.text.startsWith("rgba")
        ? exObj.color.text
        : exObj.color.text.toUpperCase()
    )};
--color--background: ${s(
      exObj.color.background.startsWith("rgba")
        ? exObj.color.background
        : exObj.color.background.toUpperCase()
    )};
        
${Object.keys(exObj.color)
  .filter((x: any) => typeof exObj.color[x] === "object")
  .map((colorName: string) =>
    Object.keys(exObj.color[colorName])
      .map(
        (colorShade: string) =>
          `--color--${colorName.replace("_", "-")}-${colorShade}: ${s(
            exObj.color[colorName][colorShade].startsWith("rgba")
              ? exObj.color[colorName][colorShade]
              : exObj.color[colorName][colorShade].toUpperCase()
          )};`
      )
      .join("\n")
  )
  .join("\n")}

space: var(--base--space);
font-size: var(--base--font-size);
line-height: var(--base--line-height);
color: var(--color--text);
background-color: var(--color--background);
font-family: var(--font-family);
font-weight: var(--font-face--regular--font-weight);
}
    `
  );
};

for (const k in themes) {
  const v: any = themes[k];
  const fileName = camelToSnakeCase(k).replace(/_/g, "-");
  writeTheme(v, `../../priv/static/themes/${fileName}`);
}
