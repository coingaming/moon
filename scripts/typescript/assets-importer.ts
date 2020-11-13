import * as fs from 'fs';

console.log('Running assets importer');

const rawDir = '../../assets/node_modules/moon-css/example/assets/';
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

const getModuleName = (s) =>
  capitalizeFirstLetter(toCamel(s)).replace('IconLoyalty-0', 'IconLoyalty0');

const createAssetComponentFile = ({ assetsFolder, iconType, file }) => {
  fs.writeFileSync(
    `${exportDir}/${assetsFolder}/${file
      .replace(/([-_])/gi, '_')
      .toLowerCase()}.ex`,
    `
defmodule Moon.Assets.${getModuleName(assetsFolder)}.${getModuleName(file)} do 
  use Moon.StatelessComponent
  ${
    (iconType === 'icon' &&
      `
  prop color, :string, values: Moon.colors
  prop background_color, :string, values: Moon.colors
  prop font_size, :string
  `) ||
    ''}${
    (iconType !== 'icon' &&
      `
  prop color, :string, values: Moon.colors
  prop height, :string
  prop width, :string
  prop font_size, :string
  prop vertical_align, :string
  `) ||
    ''}
  def render(assigns) do 
    ~H"""
    <svg class="moon-${iconType}">
      <use href="/assets/${assetsFolder}/${file}.svg#item"></use>
    </svg>
    """
  end
end
`.replace('IconLoyalty-0', 'IconLoyalty0')
  );
};

['crests', 'duotones', 'icons', 'logos', 'patterns'].forEach((assetsFolder) => {
  getFiles(assetsFolder).forEach((file) => {
    createAssetComponentFile({
      assetsFolder,
      iconType: assetsFolder.substring(0, assetsFolder.length - 1),
      file: file.replace('.svg', ''),
    });
  });
});
