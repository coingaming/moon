import * as fs from "fs";

console.log("Running assets importer");

const rawDir = "./node_modules/moon-design/packages/assets/raw/";
const exportDir = "../../lib/moon/assets/";

const getFilesList = (iconType: string) =>
  fs.readdirSync(`${rawDir}/${iconType}`);

const toCamel = (s: string) => {
  return s.replace(/([-_][a-z])/gi, ($1) => {
    return $1
      .toUpperCase()
      .replace(/([-_])/gi, "")
      .replace(/([-_])/gi, "");
  });
};

const caseInsensitiveCompare = (a: string, b: string) =>
  a.toLowerCase().localeCompare(b.toLowerCase());

const capitalizeFirstLetter = (string: string) => {
  return string.charAt(0).toUpperCase() + string.slice(1);
};

const getModuleName = (s: string) =>
  capitalizeFirstLetter(toCamel(s))
    .replace("IconLoyalty-0", "IconLoyalty0")
    .replace(".svg", "");

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
  icon: ["color", "background_color", "font_size", "click", "class"],
  default: [
    "color",
    "height",
    "width",
    "font_size",
    "vertical_align",
    "click",
    "class",
  ],
};

type MapFileContentParams = {
  iconType: string;
  assetsFolder: string;
};

const mapFileContentString = ({
  iconType,
  assetsFolder,
}: MapFileContentParams) => `
  <svg
    class={"moon-${iconType} #{@class} #{@click && "cursor-pointer"}"}
    :on-click={@click}
    style={get_style(
      color: @color,
      height: @height,
      width: @width,
      font_size: @font_size,
      vertical_align: @vertical_align
    )}
  >
    <use href={"/moon/assets/svgs/${assetsFolder}/#{asset_name_to_filename(@name)}.svg#item"} />
  </svg>
`;

const mapFileIconContentString = `
  <svg
    class={"moon-icon #{@class} #{@click && "cursor-pointer"}"}
    :on-click={@click}
    style={get_style(color: @color, background_color: @background_color, font_size: @font_size)}
  >
    <use href={"/moon/assets/svgs/icons/#{asset_name_to_filename(@name)}.svg#item"} />
  </svg>
`;

type WriteAssetsMapFileProps = {
  assetsFolder: string;
  iconType: string;
  files: string[];
};

const writeAssetsMapFile = ({
  assetsFolder,
  iconType,
  files,
}: WriteAssetsMapFileProps) => {
  const newFilePath = `${exportDir}/${iconType}.ex`;

  fs.writeFileSync(
    newFilePath,
    `
defmodule Moon.Assets.${getModuleName(iconType)} do
  ${
    iconType !== "icon"
      ? "@moduledoc false"
      : `@moduledoc """
         This module is deprecated. Please use \`Moon.Icon\` instead.
         """`
  }

  use Moon.StatelessComponent

  import Moon.Helpers.Assets, only: [asset_name_to_filename: 1]
   
  prop name, :string ${(propsMap as any)[iconType] || propsMap.default}

  def render(assigns) do
    ~F"""

    ${
      iconType !== "icon"
        ? mapFileContentString({ iconType, assetsFolder })
        : mapFileIconContentString
    }
    
    """
  end
end
`.replace("IconLoyalty-0", "IconLoyalty0")
  );
};

type CreateAssetsComponentFileProps = {
  assetsFolder: string;
  iconType: string;
  file: string;
};

const createAssetComponentFile = ({
  assetsFolder,
  iconType,
  file,
}: CreateAssetsComponentFileProps) => {
  const newFilePath = `${exportDir}/${assetsFolder}/${file
    .replace(/-/g, "_")
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
  @moduledoc false

  use Moon.StatelessComponent
  ${(propsMap as any)[iconType] || propsMap.default}
  def render(assigns) do
    ~F"""
    ${(svgMap as any)[iconType] || svgMap.default}
    """
  end
end
`.replace("IconLoyalty-0", "IconLoyalty0")
  );
};

const singularMap = { currencies: "currency" };

const singularName = (pluralName: string) =>
  (singularMap as any)[pluralName] ||
  pluralName.substring(0, pluralName.length - 1);

["crests", "currencies", "duotones", "icons", "logos", "patterns"].forEach(
  (assetsFolder) => {
    const files = getFilesList(assetsFolder);

    console.log(files);

    writeAssetsMapFile({
      assetsFolder,
      iconType: singularName(assetsFolder),
      files,
    });

    files.map((file: string) => {
      createAssetComponentFile({
        assetsFolder,
        iconType: singularName(assetsFolder),
        file: file.replace(".svg", ""),
      });
    });
  }
);

const assetsDocDir = "../../lib/moon_web/pages/assets/";

const writeAssetsDocumentationPage = (type: string, pageContent?: string) => {
  if (!pageContent) {
    return console.error("no content");
  }
  fs.writeFileSync(assetsDocDir + type + "_page.ex", pageContent);
};

const generateAssetsDocumentationPageContent = (
  type: string,
  iconNames: string[]
): string => {
  if (type == "crests") {
    return `
defmodule MoonWeb.Pages.Assets.CrestsPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Assets.Crest
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.CodePreview
  alias Moon.Components.Heading
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page

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

  def mount(params, _session, socket) do
    {:ok, assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown>
      <Heading size={56} class="mb-4">Crests</Heading>
      ${iconNames
        .map(
          (x: string, i: number) => `
        <ExampleAndCode id="crest_${i + 1}" class="mt-4">
          <#template slot="example">
            <Crest name="${x}" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <Crest name="${x}" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      `
        )
        .join("\n")}
      </TopToDown>
    </Page>
    """
  end
end
    `;
  }

  if (type == "currencies") {
    console.log({ iconNames });
    return `
defmodule MoonWeb.Pages.Assets.CurrenciesPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Assets.Currency
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.CodePreview
  alias Moon.Components.Heading
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page

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

  def mount(params, _session, socket) do
    {:ok, assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown>
      <Heading size={56} class="mb-4">Currencies</Heading>
      ${iconNames
        .map(
          (x: string, i: number) => `
        <ExampleAndCode id="currency_${i + 1}" class="mt-4">
          <#template slot="example">
            <Currency name="${x}" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <Currency name="${x}" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      `
        )
        .join("\n")}
      </TopToDown>
    </Page>
    """
  end
end
    `;
  }

  if (type == "duotones") {
    return `
defmodule MoonWeb.Pages.Assets.DuotonesPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Assets.Duotone
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.CodePreview
  alias Moon.Components.Heading
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page

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

  def mount(params, _session, socket) do
    {:ok, assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown>
      <Heading size={56} class="mb-4">Duotones</Heading>
      ${iconNames
        .map(
          (x: string, i: number) => `
        <ExampleAndCode id="duotone_${i + 1}"  class="mt-4">
          <#template slot="example">
            <Duotone name="${x}" font_size="10rem" color="piccolo-100" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <Duotone name="${x}" font_size="10rem" color="piccolo-100" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      `
        )
        .join("\n")}
      </TopToDown>
    </Page>
    """
  end
end
    `;
  }

  if (type == "icons") {
    return `
defmodule MoonWeb.Pages.Assets.IconsPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Heading
  alias Moon.Helpers.Icons
  alias Moon.Icon
  alias MoonWeb.Components.Page

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

  def mount(params, _session, socket) do
    {:ok, assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown>
      <Heading size={56} class="mb-4">Icons</Heading>
      
      <div class="p-6 bg-gohan-100 rounded">
          <div
            class="grid gap-4 overflow-hidden"
            style="grid-template-columns: repeat(auto-fill, minmax(10rem, 1fr));"
          >
            {#for icon_name <- Icons.list_all()}
              <div class="w-40 h-28 flex flex-col items-center">
                <div class="flex grow justify-center items-center">
                  <Icon name={icon_name} class="h-8 w-8" />
                </div>
                <h3 class="text-xs mx-2 mb-2 text-trunks-100" title={icon_name}>{icon_name}</h3>
              </div>
            {/for}
          </div>
        </div>

      </TopToDown>
    </Page>
    """
  end
end
    `;
  }

  if (type == "logos") {
    return `
defmodule MoonWeb.Pages.Assets.LogosPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Assets.Logo
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.CodePreview
  alias Moon.Components.Heading
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page

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

  def mount(params, _session, socket) do
    {:ok, assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown>
      <Heading size={56} class="mb-4">Logos</Heading>
      ${iconNames
        .map(
          (x: string, i: number) => `
        <ExampleAndCode id="logo_${i + 1}" class="mt-4">
          <#template slot="example">
            <Logo name="${x}" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <Logo name="${x}" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      `
        )
        .join("\n")}
      </TopToDown>
    </Page>
    """
  end
end
    `;
  }

  if (type == "patterns") {
    return `
defmodule MoonWeb.Pages.Assets.PatternsPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Assets.Pattern
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.CodePreview
  alias Moon.Components.Heading
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page

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

  def mount(params, _session, socket) do
    {:ok, assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown>
      <Heading size={56} class="mb-4">Patterns</Heading>
      ${iconNames
        .map(
          (x: string, i: number) => `
        <ExampleAndCode id="pattern_${i + 1}" class="mt-4">
          <#template slot="example">
            <Pattern name="${x}" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <Pattern name="${x}" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      `
        )
        .join("\n")}
      </TopToDown>
    </Page>
    """
  end
end
    `;
  }

  console.log({ error: "unknown type", type });
  return "";
};

const generateAssetsDocumentationPage = (type: string, files: string[]) => {
  const iconNames = files.map((f: string) =>
    f.replace(".svg", "").replace("-", "_")
  );
  const pageContent = generateAssetsDocumentationPageContent(type, iconNames);

  writeAssetsDocumentationPage(type, pageContent);
};

["crests", "currencies", "duotones", "icons", "logos", "patterns"].forEach(
  (assetsFolder: string) => {
    const files = getFilesList(assetsFolder);
    generateAssetsDocumentationPage(assetsFolder, files);
  }
);
