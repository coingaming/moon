import * as fs from 'fs';

console.log('Running assets importer');

const rawDir = '../../js_deps/sportsbet-design/packages/assets/raw/';
const exportDir = '../../lib/moon/assets/';
const documentationDir = '../../lib/moon/sites/moon_docs/pages/assets';

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

const getModuleName = (s) =>
  capitalizeFirstLetter(toCamel(s)).replace('IconLoyalty-0', 'IconLoyalty0');

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

  const newWidth = originalWidthInt < originalHeightInt ? 'auto' : '1em';
  const newHeight = originalHeightInt < originalWidthInt ? 'auto' : '1em';

  fs.writeFileSync(
    `${exportDir}/${iconType}/${file
      .replace(/([-_])/gi, '_')
      .toLowerCase()}.ex`,
    `
defmodule Moon.Assets.${getModuleName(iconType)}.${getModuleName(file)} do 
  use Moon.StatelessComponent
  use Moon.Components.Context

  ${
    (iconType === 'icons' &&
      `
  prop color, :string
  prop background_color, :string
  `) ||
    ''
  }

  ${
    (iconType !== 'icons' &&
      `
  prop color, :string
  prop height, :string
  prop width, :string
  prop font_size, :string
  prop vertical_align, :string
  `) ||
    ''
  }

  def render(assigns) do 
    ${
      (iconType === 'icons' &&
        `
    class_name = get_class_name("${getModuleName(iconType)}-${getModuleName(
          file
        )}-#{assigns.color}-#{assigns.background_color}")
    `) ||
      ''
    }

    ${
      (iconType !== 'icons' &&
        `
    class_name = get_class_name("${getModuleName(iconType)}-${getModuleName(
          file
        )}-#{assigns.color}-#{assigns.height}-#{assigns.width}-#{assigns.font_size}-#{assigns.vertical_align}")
    `) ||
      ''
    }

    ~H"""
    <Context get={{ theme: theme }}>
    <style>
      .{{ class_name }} {
        vertical-align: middle;

        ${
          (iconType === 'icons' &&
            `
        color: {{ get_color(@color, @theme) }};
        background-color: {{ get_color(@background_color, @theme) }};
        display: inline-block;
        overflow: hidden;
        `) ||
          ''
        }

        ${
          (iconType !== 'icons' &&
            `
        color: {{ get_color(@color, @theme) }};
        height: {{ @height }};
        width: {{ @width }};
        font-size: {{ @font_size }};
        vertical-align: {{ @vertical_align }};
        overflow: hidden;
        `) ||
          ''
        }
      }
    </style>

    ${contents
      .replace('<svg', `<svg class={{ class_name }} NEW_WIDTH NEW_HEIGHT `)
      .replace(`width="${originalWidth}"`, ``)
      .replace(`height="${originalHeight}"`, ``)
      .replace(`NEW_WIDTH`, `width="${newWidth}"`)
      .replace(`NEW_HEIGHT`, `height="${newHeight}"`)
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
    </Context>
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

  prop name, :string
  prop color, :string
  prop background_color, :string

  @assets_map %{
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
    }

  def icon_name_to_module(icon_name) do 
    @assets_map[:"#{icon_name}"]
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

const writeAssetsDocFile = (iconType, icons) => {
  fs.writeFileSync(
    `${documentationDir}/${iconType}_page.ex`,
    `
defmodule Moon.Sites.MoonDocs.Pages.Assets.${getModuleName(iconType)}Page do 
  use Moon.LiveView
  use Moon.Components.Context

  alias Moon.Sites.MoonDocs.Layouts.DefaultLayout
  alias Moon.Themed
  alias Moon.Components.Inline

  alias Moon.Assets.${getModuleName(iconType)}
  ${icons
    .map((icon) => `alias ${getModuleName(iconType)}.${getModuleName(icon)}`)
    .join('\n  ')}

  data theme, :any, default: %Moon.Sites.MoonDocs.Themes.Light{}

  def render(assigns) do 
    code_as_string = """
      <Inline>
        ${
          (iconType === 'icons' &&
            icons
              .map(
                (icon) =>
                  `<${getModuleName(
                    icon
                  )} color="piccolo_100" background_color="gohan_100" />`
              )
              .join('\n        ')) ||
          ''
        }
        ${
          (iconType !== 'icons' &&
            icons
              .map(
                (icon) =>
                  `<${getModuleName(
                    icon
                  )} color="piccolo_100" height="1rem" width="1rem" />`
              )
              .join('\n        ')) ||
          ''
        }
      </Inline>
    """

    ~H"""
    <Themed theme={{ @theme }}>
      <DefaultLayout id="moondocs" user_token={{ "user_token" }}>
        <Inline>
          ${
            (iconType === 'icons' &&
              icons
                .map(
                  (icon) =>
                    `<${getModuleName(
                      icon
                    )} color="piccolo_100" background_color="gohan_100" />`
                )
                .join('\n          ')) ||
            ''
          }
          ${
            (iconType !== 'icons' &&
              icons
                .map(
                  (icon) =>
                    `<${getModuleName(
                      icon
                    )} color="piccolo_100" height="1rem" width="1rem" />`
                )
                .join('\n          ')) ||
            ''
          }
        </Inline>
        <pre>{{ code_as_string }}</pre>
      </DefaultLayout>
    </Themed>
    """
  end
end
`
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

  writeAssetsDocFile(
    iconType,
    getFiles(iconType).map((i) => i.replace('.svg', ''))
  );
});
