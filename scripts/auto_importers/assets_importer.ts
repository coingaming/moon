import * as fs from 'fs';

console.log('Running assets importer');

const rawDir = '../../js_deps/sportsbet-design/packages/assets/raw/';
const exportDir = '../../lib/moon/assets/';

const getFiles = (iconType) => fs.readdirSync(`${rawDir}/${iconType}`);
const getContents = (iconType, file) =>
  fs.readFileSync(`${rawDir}/${iconType}/${file}`);

const toCamel = (s) => {
  return s.replace(/([-_][a-z])/gi, ($1) => {
    return $1
      .toUpperCase()
      .replace(/([-_])/gi, '')
      .replace(/([-_])/gi, '');
  });
};

const capitalizeFirstLetter = (string) => {
  return string.charAt(0).toUpperCase() + string.slice(1);
};

const camelToSnakeCase = (str) =>
  str.replace(/[A-Z]/g, (letter) => `_${letter.toLowerCase()}`);

const getModuleName = (s) => capitalizeFirstLetter(toCamel(s));

const getProp = (contents, propName) => {
  try {
    return contents.split(`${propName}="`)[1].split('"')[0];
  } catch (e) {}
};

const getIntProp = (contents, propName) =>
  parseInt(getProp(contents, propName));

const writeSvgFile = (iconType, file, contents) => {
  const originalWidth = getProp(contents, 'width');
  const originalHeight = getProp(contents, 'height');
  const originalWidthInt = parseInt(originalWidth);
  const originalHeightInt = parseInt(originalHeight);

  const newWidth = originalWidthInt >= originalHeightInt ? '1em' : 'auto';
  const newHeight =
    originalWidthInt && originalHeightInt && originalHeight >= originalWidth
      ? '1em'
      : 'auto';

  fs.writeFileSync(
    `${exportDir}/${iconType}/${file
      .replace(/([-_])/gi, '_')
      .toLowerCase()}.ex`,
    `
defmodule Moon.Assets.${getModuleName(iconType)}.${getModuleName(file)} do 
  use Moon.StatelessComponent

  property color, :string
  property background_color, :string

  def render(assigns) do 
    class_name = get_class_name("${getModuleName(iconType)}-${getModuleName(
      file
    )}-#{assigns[:color]}-#{assigns[:background_color]}")

    ~H"""
    <style>
      .{{ class_name }} {
        vertical-align: middle;
        color: {{ @color }};
        background-color: {{ @background_color }};
      }
    </style>

    ${contents
      .replace('<svg', `<svg class={{ class_name }} `)
      .replace(`width="${originalWidth}"`, `width="${newWidth}"`)
      .replace(`height="${originalHeight}"`, `height="${newHeight}"`)
      .replace(/\n/gi, ' ')
      .replace(/\r/gi, ' ')
      .replace(/  /gi, ' ')
      .replace(/" >/gi, '">')
      .replace(`	`, ' ')
      .replace(
        `<!-- Generator: Adobe Illustrator 18.0.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->`,
        ''
      )
      .replace(`xmlns:xlink="http://www.w3.org/1999/xlink"`, '')
      .replace(`<?xml version="1.0" encoding="iso-8859-1"?>`, '')
      .replace(`enable-background="new 0 0 16 16"`, '')
      .replace(`xml:space="preserve"`, '')
      .replace(`<?xml version="1.0" encoding="UTF-8"?>`, '')
      .replace(`<?xml version="1.0" encoding="utf-8"?>`, '')
      .replace(/#DE1E7E/gi, 'currentColor')
      .replace(
        `<!-- Generator: Adobe Illustrator 17.1.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->`,
        ''
      )
      .trim()}
    """
  end
end
`.replace('IconLoyalty-0', 'IconLoyalty0')
  );
};

const writeAssetsMapFile = (iconType, icons) => {
  fs.writeFileSync(
    `${exportDir}/${iconType}.ex`,
    `
defmodule Moon.Assets.${getModuleName(iconType)} do 
  use Moon.StatelessComponent

  alias Moon.Assets.${getModuleName(iconType)}

  property name, :string
  property color, :string
  property background_color, :string

  def icon_name_to_module(icon_name) do 
    %{
      ${icons
        .map(
          (i) =>
            `${i
              .replace(/([-_])/gi, '_')
              .toLowerCase()
              .replace(
                `${iconType.substring(0, iconType.length - 1)}_`.toLowerCase(),
                ''
              )}: ${getModuleName(iconType)}.${getModuleName(i)}`
        )
        .join(', ')}
      }[:"#{icon_name}"]
  end

  def render(assigns) do 
    ~H"""
    {{ @name && icon_name_to_module(@name) && live_component(@socket, icon_name_to_module(@name), color: @color, background_color: @background_color) }}
    """
  end
end
`.replace('IconLoyalty-0', 'IconLoyalty0')
  );
};

['crests', 'duotones', 'icons', 'logos', 'patterns'].forEach((iconType) => {
  getFiles(iconType).forEach((file) => {
    const contents = getContents(iconType, file);
    writeSvgFile(iconType, file.replace('.svg', ''), contents.toString());
  });

  writeAssetsMapFile(
    iconType,
    getFiles(iconType).map((i) => i.replace('.svg', ''))
  );
});
