import * as fs from "fs";
import * as dotenv from "dotenv";
dotenv.config();

console.log("Running generate svg generate symbols");

const iconPageName = process.env.ICON_PAGE_NAME;

const rawDir = "node_modules/assets/svg";
const rawDirIcons = `node_modules/assets/svg/${iconPageName}`;
const exportDir = "../../priv/static/svgs";
const mdRawDir = "node_modules/moon-design/packages/assets/raw";

const getFilesList = (iconType: string) => {
  // New icons are at different folder
  if (iconType === "icons_new") {
    return fs.readdirSync(`${rawDirIcons}`);
  } else if (["duotones", "icons"].includes(iconType)) {
    // duotones raw svg does not exist in the assets importer tool repo
    // but in the moon-design repo
    return fs.readdirSync(`${mdRawDir}/${toCamel(iconType)}`);
  } else {
    return fs.readdirSync(`${rawDir}/${toCamel(iconType)}`);
  }
};

const camelToDashSnakeCase = (str: string) =>
  str.replace(/[A-Z]/g, (letter: string, index: number) => {
    return index == 0 ? letter.toLowerCase() : "-" + letter.toLowerCase();
  });

const toCamel = (s: string) => {
  return s.replace(/([-_][a-z])/gi, ($1) => {
    return $1
      .toUpperCase()
      .replace(/([-_])/gi, "")
      .replace(/([-_])/gi, "");
  });
};

const getContents = (iconType: string, file: string) => {
  // New icons are at different folder
  if (iconType === "icons_new") {
    return fs.readFileSync(`${rawDirIcons}/${file}`);
  } else if (["duotones", "icons"].includes(iconType)) {
    return fs.readFileSync(`${mdRawDir}/${toCamel(iconType)}/${file}`);
  } else {
    return fs.readFileSync(`${rawDir}/${toCamel(iconType)}/${file}`);
  }
};

const getProp = (contents: string, propName: string): string => {
  try {
    return contents.split(`${propName}="`)[1].split('"')[0];
  } catch (e) {}
  return "";
};

const getSvgPropValue = (content: string, propName: string): string => {
  const c = content.toLowerCase();
  const sAt = c.indexOf(propName + '="') + propName.length + 2;
  const eAt = c.indexOf('"', sAt);
  return c.substring(sAt, eAt);
};

const symboliseSvg = (content: string, newIcons: boolean): string => {
  const svgContentStartsAt = content.indexOf(">", content.indexOf("<svg"));
  const svgContentEndsAt = content.indexOf("</svg");
  const strokeAttrs =
    newIcons && content.includes("stroke") ? 'stroke-width="1"' : "";

  const symbolised = `${content.substring(0, svgContentStartsAt + 1)}
  <symbol id="item" viewBox="${getSvgPropValue(
    content,
    "viewbox"
  )}" ${strokeAttrs} fill="none">
    ${content.substring(svgContentStartsAt + 1, svgContentEndsAt)}
  </symbol>
</svg>
  `;
  return symbolised;
};

const writeSvgFile = (iconType: string, file: string, contents: string) => {
  let svgNewContents = contents
    .replace(/#DE1E7E/gi, "currentColor")
    .replace(/#000/gi, "currentColor")
    .replace(/white/gi, "currentColor")
    .replace(/#fff/gi, "currentColor")
    .trim();

  svgNewContents = symboliseSvg(svgNewContents, iconType == "icons_new");

  if (iconType == "icons_new") {
    var svgPath = `${exportDir}/icons_new/${camelToDashSnakeCase(
      file
    ).toLowerCase()}.svg`;
  } else if (iconType === "icons" && file.includes("currency")) {
    var svgPath = `${exportDir}/${iconType}/${camelToDashSnakeCase(
      file.toLowerCase()
    )}.svg`;
  } else {
    var svgPath = `${exportDir}/${iconType}/${camelToDashSnakeCase(
      file
    ).toLowerCase()}.svg`;
  }

  fs.writeFileSync(svgPath, svgNewContents);
};

[
  "age_limit",
  "crests",
  "currencies",
  "duotones",
  "icons",
  "icons_new",
  "logos",
  "patterns",
].forEach((iconType: string) => {
  getFilesList(iconType).forEach((file) => {
    // const fileLowerCase = file.toLowerCase();
    const contents = getContents(iconType, file);
    writeSvgFile(iconType, file.replace(".svg", ""), contents.toString());
  });
});
