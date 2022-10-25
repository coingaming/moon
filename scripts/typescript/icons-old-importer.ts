import * as fs from 'fs';

console.log('Running assets importer');

const rawDirIcons = '../../priv/static/svgs/icons_new';
const exportDir = '../../lib/moon';

const getFilesList = () => fs.readdirSync(`${rawDirIcons}`);

const toCamel = (s: string) => {
  return s.replace(/([-_][a-z])/gi, ($1) => {
    return $1
      .toUpperCase()
      .replace(/([-_])/gi, '')
      .replace(/([-_])/gi, '');
  });
};

const caseInsensitiveCompare = (a:string, b:string) =>
  a.toLowerCase().localeCompare(b.toLowerCase());

const capitalizeFirstLetter = (string: string) => {
  return string.charAt(0).toUpperCase() + string.slice(1);
};

const getModuleName = (s: string) =>
  capitalizeFirstLetter(toCamel(s))
    .replace('IconLoyalty-0', 'IconLoyalty0')
    .replace('.svg', '');

const propsMap = `
  prop color, :string, values: Moon.colors
  prop background_color, :string, values: Moon.colors
  prop font_size, :string
  prop click, :event
  prop class, :string
`;

const propsMapKeys = [
  'color',
  'background_color',
  'font_size',
  'click',
  'class',
];

type WriteAssetsMapFileProps = {
  files: string[];
};

const writeAssetsMapFile = ({
  files,
}: WriteAssetsMapFileProps) => {
  const newFilePath = `${exportDir}/icon.ex`;

  fs.writeFileSync(
    newFilePath,
    `
defmodule Moon.Icon do
  @moduledoc false
  
  use Moon.StatelessComponent
  alias Moon.Icons

  prop name, :string
  ${propsMap}
  @assets_map %{
    ${files.sort(caseInsensitiveCompare).map(
          (i) =>
            `${i
              .replace(/([-_])/gi, '_')
              .toLowerCase()
              .replace('.svg', '')
            }: Icons.${getModuleName(i)}`
        )
        .join(', ')}
    }

  defp icon_name_to_module(icon_name) when is_binary(icon_name), do: icon_name |> String.to_existing_atom() |> icon_name_to_module()
  defp icon_name_to_module(icon_name), do: @assets_map[icon_name]

  def render(assigns) do
    ~F"""
    {@name && icon_name_to_module(@name) && live_component(@socket, icon_name_to_module(@name), ${propsMapKeys
        .map((x: string) => `${x}: @${x}`)
        .join(', ')})}
    """
  end
end
`.replace('IconLoyalty-0', 'IconLoyalty0')
  );
};

type CreateAssetsComponentFileProps = {
  file: string;
};

const createAssetComponentFile = ({
  file,
}: CreateAssetsComponentFileProps) => {
  const newFilePath = `${exportDir}/icons/${file
    .replace(/([-_])/gi, '_')
    .toLowerCase()}.ex`;

  const svgMap = `
  <svg class={"moon-icon #{@class} #{@click && "cursor-pointer"}"} :on-click={@click} style={get_style(color: @color, background_color: @background_color, font_size: @font_size)}>
    <use href="/moon/assets/svgs/icons_new/${file}.svg#item"></use>
  </svg>
  `;

  fs.writeFileSync(
    newFilePath,
    `
defmodule Moon.Icons.${getModuleName(file)} do
  @moduledoc false
  use Moon.StatelessComponent
  ${propsMap}
  def render(assigns) do
    ~F"""
    ${svgMap}
    """
  end
end
`.replace('IconLoyalty-0', 'IconLoyalty0')
  );
};

const singularMap = { currencies: 'currency' };

const singularName = (pluralName: string) =>
  (singularMap as any)[pluralName] ||
  pluralName.substring(0, pluralName.length - 1);

const files = getFilesList();

writeAssetsMapFile({
  files,
});

files.map((file: string) => {
  createAssetComponentFile({
    file: file.replace('.svg', ''),
  });
});

const assetsDocDir = '../../lib/moon_web/pages/';

const writeAssetsDocumentationPage = (pageContent: string) => {
  if (!pageContent) {
    return console.error('no content');
  }
  fs.writeFileSync(assetsDocDir + 'icons_page.ex', pageContent);
};

const generateAssetsDocumentationPageContent = (
  modules: string[]
): string => {
  return `
defmodule MoonWeb.Pages.IconsPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.CodePreview
  alias Moon.Components.Heading
  alias Moon.Icons
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page

  data breadcrumbs, :any,
    default: [
      %{
        to: "/icons",
        name: "Icons"
      }
    ]
${modules.sort(caseInsensitiveCompare).map((x: string) => `  alias Icons.${x}`).join('\n')}

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <TopToDown>
      <Heading size={56} class="mb-4">Icons</Heading>
      ${modules.sort(caseInsensitiveCompare).map(
        (x: string, i: number) => `
        <ExampleAndCode id="icon_${i + 1}" class="mt-4">
          <#template slot="example">
            <${x} font_size="5rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <${x} font_size="5rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      `
      )
      .join('\n')}
      </TopToDown>
    </Page>
    """
  end
end
    `;
};

const generateAssetsDocumentationPage = (files: string[]) => {
  const modules = files.sort(caseInsensitiveCompare).map((f: string) => getModuleName(f));
  const pageContent = generateAssetsDocumentationPageContent(modules);
  writeAssetsDocumentationPage(pageContent);
};

(() => {
  const files = getFilesList();
  generateAssetsDocumentationPage(files);
})();
