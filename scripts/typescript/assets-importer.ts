import * as fs from 'fs';

console.log('Running assets importer');

const rawDir = '../../assets/node_modules/moon-css/example/assets/';
const exportDir = '../../lib/moon/assets/';

const getFiles = (iconType: string) => fs.readdirSync(`${rawDir}/${iconType}`);
const getContents = (iconType: string, file: string) =>
  fs.readFileSync(`${rawDir}/${iconType}/${file}`);

const toCamel = (s: string) => {
  return s.replace(/([-_][a-z])/gi, ($1) => {
    return $1
      .toUpperCase()
      .replace(/([-_])/gi, '')
      .replace(/([-_])/gi, '');
  });
};

const capitalizeFirstLetter = (string: string) => {
  return string.charAt(0).toUpperCase() + string.slice(1);
};

const camelToSnakeCase = (str: string) =>
  str.replace(/[A-Z]/g, (letter) => `_${letter.toLowerCase()}`);

const getModuleName = (s: string) =>
  capitalizeFirstLetter(toCamel(s))
    .replace('IconLoyalty-0', 'IconLoyalty0')
    .replace('.svg', '');

const propsMap = {
  icon: `
    prop color, :string, values: Moon.colors
    prop background_color, :string, values: Moon.colors
    prop font_size, :string
    prop click, :event
    prop class, :string
    `,
  default: `
    prop color, :string, values: Moon.colors
    prop height, :string
    prop width, :string
    prop font_size, :string
    prop vertical_align, :string
    prop click, :event
    prop class, :string
    `,
};

const propsMapKeys = {
  icon: ['color', 'background_color', 'font_size', 'click', 'class'],
  default: [
    'color',
    'height',
    'width',
    'font_size',
    'vertical_align',
    'click',
    'class',
  ],
};

type WriteAssetsMapFileProps = {
  assetsFolder: string
  iconType: string
  files: string[]
}

const writeAssetsMapFile = ({ assetsFolder, iconType, files }: WriteAssetsMapFileProps) => {
  const newFilePath = `${exportDir}/${iconType}.ex`;

  fs.writeFileSync(
    newFilePath,
    `
defmodule Moon.Assets.${getModuleName(iconType)} do
  use Moon.StatelessComponent
  alias Moon.Assets.${getModuleName(iconType)}s

  prop name, :string
  ${(propsMap as any)[iconType] || propsMap.default}
  @assets_map %{
    ${files
        .map(
          (i) =>
            `${i
              .replace(/([-_])/gi, '_')
              .toLowerCase()
              .replace('.svg', '')
              .replace(
                `${iconType.substring(0, iconType.length - 1)}_`.toLowerCase(),
                ''
              )}: ${getModuleName(iconType)}s.${getModuleName(i)}`
        )
        .join(', ')}
    }
  def icon_name_to_module(icon_name) do
    @assets_map[:"#{icon_name}"]
  end
  def render(assigns) do
    ~F"""
    {@name && icon_name_to_module(@name) && live_component(@socket, icon_name_to_module(@name), ${(
        (propsMapKeys as any)[iconType] || propsMapKeys.default
      )
        .map((x: string) => `${x}: @${x}`)
        .join(', ')})}
    """
  end
end
`.replace('IconLoyalty-0', 'IconLoyalty0')
  );
};

type CreateAssetsComponentFileProps = {
  assetsFolder: string
  iconType: string
  file: string
}

const createAssetComponentFile = ({ assetsFolder, iconType, file }: CreateAssetsComponentFileProps) => {
  const newFilePath = `${exportDir}/${assetsFolder}/${file
    .replace(/([-_])/gi, '_')
    .toLowerCase()}.ex`;

  const svgMap = {
    icon: `
    <svg class={"moon-${iconType} #{@class} #{@click && "cursor-pointer"}"} :on-click={@click} style={get_style(color: @color, background_color: @background_color, font_size: @font_size)}>
      <use href="/moon/assets/svgs/${assetsFolder}/${file}.svg#item"></use>
    </svg>
    `,
    default: `
    <svg class={"moon-${iconType} #{@class} #{@click && "cursor-pointer"}"} :on-click={@click} style={get_style(color: @color, height: @height, width: @width, font_size: @font_size, vertical_align: @vertical_align)}>
      <use href="/moon/assets/svgs/${assetsFolder}/${file}.svg#item"></use>
    </svg>
    `,
  };

  fs.writeFileSync(
    newFilePath,
    `
defmodule Moon.Assets.${getModuleName(assetsFolder)}.${getModuleName(file)} do
  use Moon.StatelessComponent
  ${(propsMap as any)[iconType] || propsMap.default}
  def render(assigns) do
    ~F"""
    {asset_import @socket, "js/assets/${iconType}"}
    ${(svgMap as any)[iconType] || svgMap.default}
    """
  end
end
`.replace('IconLoyalty-0', 'IconLoyalty0')
  );
};

const singularMap = { currencies: 'currency' };

const singularName = (pluralName: string) =>
  (singularMap as any)[pluralName] || pluralName.substring(0, pluralName.length - 1);

['crests', 'currencies', 'duotones', 'icons', 'logos', 'patterns'].forEach(
  (assetsFolder) => {
    const files = getFiles(assetsFolder);

    console.log(files)

    writeAssetsMapFile({
      assetsFolder,
      iconType: singularName(assetsFolder),
      files,
    });

    files.map((file: string) => {
      createAssetComponentFile({
        assetsFolder,
        iconType: singularName(assetsFolder),
        file: file.replace('.svg', ''),
      });
    });
  }
);

const assetsDocDir = '../../lib/moon_web/pages/assets/';

const writeAssetsDocumentationPage = (type: string, pageContent?: string) => {
  if (!pageContent) {
    return console.error("no content")
  }
  fs.writeFileSync(assetsDocDir + type + '_page.ex', pageContent);
};

const generateAssetsDocumentationPageContent = (type: string, modules: string[]): string => {
  if (type == 'crests') {
    return `
defmodule MoonWeb.Pages.Assets.CrestsPage do
  use MoonWeb, :live_view

  alias MoonWeb.Components.Breadcrumbs
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Heading
  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Components.CodePreview
  alias Moon.Assets.Crests

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Assets"
      },
      %{
        to: "/assets/crests",
        name: "Crests"
      }
    ]
${modules.map((x: string) => `  alias Crests.${x}`).join('\n')}

  def mount(params, _session, socket) do
    {:ok, assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def render(assigns) do
    ~F"""
    <TopToDown>
    <Breadcrumbs theme_name={@theme_name} breadcrumbs={@breadcrumbs} class="mb-2" />
    <Heading size={32} class="mb-8">Crests</Heading>
    ${modules
        .map(
          (x: string, i: number) => `
      <ExampleAndCode id="crest_${i + 1}" class="mt-4">
        <#template slot="example">
          <${x} font_size="10rem" />
        </#template>

        <#template slot="code">
          <#CodePreview>
            <${x} font_size="10rem" />
          </#CodePreview>
        </#template>
      </ExampleAndCode>
    `
          )
          .join('\n')}
    </TopToDown>
    """
  end
end
    `;
  }

  if (type == 'currencies') {
    console.log({ modules });
    return `
defmodule MoonWeb.Pages.Assets.CurrenciesPage do
  use MoonWeb, :live_view

  alias MoonWeb.Components.Breadcrumbs
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Heading
  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Components.CodePreview
  alias Moon.Assets.Currencies

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Assets"
      },
      %{
        to: "/assets/currencies",
        name: "Currencies"
      }
    ]
${modules.map((x: string) => `  alias Currencies.${x}`).join('\n')}

  def mount(params, _session, socket) do
    {:ok, assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def render(assigns) do
    ~F"""
    <TopToDown>
    <Breadcrumbs theme_name={@theme_name} breadcrumbs={@breadcrumbs} class="mb-2" />
    <Heading size={32} class="mb-8">Currencies</Heading>
    ${modules
        .map(
          (x: string, i: number) => `
      <ExampleAndCode id="currency_${i + 1}" class="mt-4">
        <#template slot="example">
          <${x} font_size="10rem" />
        </#template>

        <#template slot="code">
          <#CodePreview>
            <${x} font_size="10rem" />
          </#CodePreview>
        </#template>
      </ExampleAndCode>
    `
          )
          .join('\n')}
    </TopToDown>
    """
  end
end
    `;
  }

  if (type == 'duotones') {
    return `
defmodule MoonWeb.Pages.Assets.DuotonesPage do
  use MoonWeb, :live_view

  alias MoonWeb.Components.Breadcrumbs
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Heading
  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Components.CodePreview
  alias Moon.Assets.Duotones

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Assets"
      },
      %{
        to: "/assets/duotones",
        name: "Duotones"
      }
    ]
${modules.map((x: string) => `  alias Duotones.${x}`).join('\n')}

  def mount(params, _session, socket) do
    {:ok, assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def render(assigns) do
    ~F"""
    <TopToDown>
    <Breadcrumbs theme_name={@theme_name} breadcrumbs={@breadcrumbs} class="mb-2" />
    <Heading size={32} class="mb-8">Duotones</Heading>
    ${modules
        .map(
          (x: string, i: number) => `
      <ExampleAndCode id="duotone_${i + 1}"  class="mt-4">
        <#template slot="example">
          <${x} font_size="10rem" color="piccolo-100" />
        </#template>

        <#template slot="code">
          <#CodePreview>
            <${x} font_size="10rem" color="piccolo-100" />
          </#CodePreview>
        </#template>
      </ExampleAndCode>
    `
          )
          .join('\n')}
    </TopToDown>
    """
  end
end
    `;
  }

  if (type == 'icons') {
    return `
defmodule MoonWeb.Pages.Assets.IconsPage do
  use MoonWeb, :live_view

  alias MoonWeb.Components.Breadcrumbs
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Heading
  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Components.CodePreview
  alias Moon.Assets.Icons

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Assets"
      },
      %{
        to: "/assets/icons",
        name: "Icons"
      }
    ]
${modules.map((x: string) => `  alias Icons.${x}`).join('\n')}

  def mount(params, _session, socket) do
    {:ok, assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def render(assigns) do
    ~F"""
    <TopToDown>
    <Breadcrumbs theme_name={@theme_name} breadcrumbs={@breadcrumbs} class="mb-2" />
    <Heading size={32} class="mb-8">Icons</Heading>
    ${modules
        .map(
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
    """
  end
end
    `;
  }

  if (type == 'logos') {
    return `
defmodule MoonWeb.Pages.Assets.LogosPage do
  use MoonWeb, :live_view

  alias MoonWeb.Components.Breadcrumbs
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Heading
  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Components.CodePreview
  alias Moon.Assets.Logos

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Assets"
      },
      %{
        to: "/assets/logos",
        name: "Logos"
      }
    ]
${modules.map((x: string) => `  alias Logos.${x}`).join('\n')}

  def mount(params, _session, socket) do
    {:ok, assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def render(assigns) do
    ~F"""
    <TopToDown>
    <Breadcrumbs theme_name={@theme_name} breadcrumbs={@breadcrumbs} class="mb-2" />
    <Heading size={32} class="mb-8">Logos</Heading>
    ${modules
        .map(
          (x: string, i: number) => `
      <ExampleAndCode id="logo_${i + 1}" class="mt-4">
        <#template slot="example">
          <${x} font_size="10rem" />
        </#template>

        <#template slot="code">
          <#CodePreview>
            <${x} font_size="10rem" />
          </#CodePreview>
        </#template>
      </ExampleAndCode>
    `
          )
          .join('\n')}
    </TopToDown>
    """
  end
end
    `;
  }

  if (type == 'patterns') {
    return `
defmodule MoonWeb.Pages.Assets.PatternsPage do
  use MoonWeb, :live_view

  alias MoonWeb.Components.Breadcrumbs
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Heading
  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Components.CodePreview
  alias Moon.Assets.Patterns

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Assets"
      },
      %{
        to: "/assets/patterns",
        name: "Patterns"
      }
    ]
${modules.map((x: string) => `  alias Patterns.${x}`).join('\n')}

  def mount(params, _session, socket) do
    {:ok, assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def render(assigns) do
    ~F"""
    <TopToDown>
    <Breadcrumbs theme_name={@theme_name} breadcrumbs={@breadcrumbs} class="mb-2" />
    <Heading size={32} class="mb-8">Patterns</Heading>
    ${modules
        .map(
          (x: string, i: number) => `
      <ExampleAndCode id="pattern_${i + 1}" class="mt-4">
        <#template slot="example">
          <${x} font_size="10rem" />
        </#template>

        <#template slot="code">
          <#CodePreview>
            <${x} font_size="10rem" />
          </#CodePreview>
        </#template>
      </ExampleAndCode>
    `
          )
          .join('\n')}
    </TopToDown>
    """
  end
end
    `;
  }

  console.log({ error: 'unknown type', type });
  return ''
};

const generateAssetsDocumentationPage = (type: string, files: string[]) => {
  const modules = files.map((f: string) => getModuleName(f));
  const pageContent = generateAssetsDocumentationPageContent(type, modules);

  writeAssetsDocumentationPage(type, pageContent);
};

['crests', 'currencies', 'duotones', 'icons', 'logos', 'patterns'].forEach(
  (assetsFolder: string) => {
    const files = getFiles(assetsFolder);
    generateAssetsDocumentationPage(assetsFolder, files);
  }
);
