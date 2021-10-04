import * as fs from 'fs';

console.log('Running assets importer');

const rawDir = 'node_modules/moon-design/packages/assets/raw/';
const rawDirIcons = 'node_modules/moon-design/packages/icons/raw/imported';
const exportDir = '../../priv/static/svgs';

const getFilesList = (iconType: string) => {
  // New icons are at different folder
  if (iconType === "icons_new") {
    return fs.readdirSync(`${rawDirIcons}`);
  } else {
    return fs.readdirSync(`${rawDir}/${iconType}`);
  }
}

const camelToDashSnakeCase = (str: string) => str.replace(/[A-Z]/g, (letter: string, index: number) => {
  return index == 0 ? letter.toLowerCase() : '-' + letter.toLowerCase();
});

const getContents = (iconType: string, file: string) => {
  // New icons are at different folder
  if (iconType === "icons_new") {
    return fs.readFileSync(`${rawDirIcons}/${file}`);
  } else {
    return fs.readFileSync(`${rawDir}/${iconType}/${file}`);
  }
}

const getProp = (contents: string, propName: string): string => {
  try {
    return contents.split(`${propName}="`)[1].split('"')[0];
  } catch (e) {
  }
  return ''
};

const getSvgPropValue = (content: string, propName: string): string => {
  const c = content.toLowerCase();
  const sAt = c.indexOf(propName + '="') + propName.length + 2;
  const eAt = c.indexOf('"', sAt);
  console.log(propName);
  console.log(c.substring(sAt, eAt));
  console.log("\n");
  return c.substring(sAt, eAt);
}

const symboliseSvg = (content: string): string => {
  const svgContentStartsAt = content.indexOf(">", content.indexOf("<svg"));
  const svgContentEndsAt = content.indexOf("</svg");
  const symbolised = `
${content.substring(0, svgContentStartsAt + 1)}
<symbol id="item"
width="${getSvgPropValue(content, "width")}"
height="${getSvgPropValue(content, "height")}"
viewBox="${getSvgPropValue(content, "viewbox")}"
fill="none"
>
${content.substring(svgContentStartsAt + 1, svgContentEndsAt)}
</symbol>
</svg>
  `;
  return symbolised;
}

const writeSvgFile = (iconType: string, file: string, contents: string) => {
  const originalWidth = getProp(contents, 'width');
  const originalHeight = getProp(contents, 'height');
  const originalWidthInt = parseInt(originalWidth);
  const originalHeightInt = parseInt(originalHeight);

  const newWidth = originalWidthInt < originalHeightInt ? 'auto' : '1em';
  const newHeight = originalHeightInt < originalWidthInt ? 'auto' : '1em';

  let svgNewContents = contents
    .replace(
      '<svg',
      `<svg NEW_WIDTH NEW_HEIGHT `
    )
    .replace(`width="${originalWidth}"`, ``)
    .replace(`height="${originalHeight}"`, ``)
    .replace(`NEW_WIDTH`, `width="${newWidth}"`)
    .replace(`NEW_HEIGHT`, `height="${newHeight}"`)
    .replace(/#DE1E7E/gi, 'currentColor')
    .replace(/#000/gi, 'var(--color--bulma-100)')
    .replace(/white/gi, 'var(--color--bulma-100)')
    .replace(/#fff/gi, 'var(--color--bulma-100)')
    .trim();

  svgNewContents = symboliseSvg(svgNewContents);

  if (iconType == "icons_new") {
    var svgPath = `${exportDir}/icons_new/${camelToDashSnakeCase(file).toLowerCase()}.svg`;
  } else {
    var svgPath = `${exportDir}/${iconType}/${file.toLowerCase()}.svg`;
  }

  fs.writeFileSync(svgPath, svgNewContents);
};

['crests', 'currencies', 'duotones', 'icons', 'icons_new', 'logos', 'patterns'].forEach((iconType: string) => {
  getFilesList(iconType).forEach((file) => {
    const contents = getContents(iconType, file);
    writeSvgFile(iconType, file.replace('.svg', ''), contents.toString());
  });
});

