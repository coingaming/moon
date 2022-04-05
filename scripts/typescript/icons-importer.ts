import * as fs from "fs";

console.log("Running assets importer");

const rawDirIcons = "../../priv/static/svgs/icons_new";
const exportDir = "../../lib/moon";

const getFilesList = () => fs.readdirSync(`${rawDirIcons}`);

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

const propsMap = `
  prop color, :string, values: Moon.colors
  prop background_color, :string, values: Moon.colors
  prop font_size, :string
  prop click, :event
  prop class, :string
`;

const propsMapKeys = [
  "color",
  "background_color",
  "font_size",
  "click",
  "class",
];

type WriteAssetsMapFileProps = {
  files: string[];
};

const getIconName = (s: string) =>
  s.replace(/([-_])/gi, "_").replace(".svg", "");

const writeAssetsMapFile = ({ files }: WriteAssetsMapFileProps) => {
  const newFilePath = `${exportDir}/icons.ex`;

  fs.writeFileSync(
    newFilePath,
    `defmodule Moon.Helpers.Icons do
    @moduledoc false
  
    def list_all do
      ~w(
        ${files
          .sort()
          .map((i) => getIconName(i))
          .join("\n      ")}
      )
    end
  end
  `
  );
};

type CreateAssetsComponentFileProps = {
  file: string;
};

const createAssetComponentFile = ({ file }: CreateAssetsComponentFileProps) => {
  const newFilePath = `${exportDir}/icons/${file
    .replace(/([-_])/gi, "_")
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
`.replace("IconLoyalty-0", "IconLoyalty0")
  );
};

const singularMap = { currencies: "currency" };

const singularName = (pluralName: string) =>
  (singularMap as any)[pluralName] ||
  pluralName.substring(0, pluralName.length - 1);

const files = getFilesList();

if (fs.existsSync(`${exportDir}/icon.ex`)) {
  fs.unlinkSync(`${exportDir}/icon.ex`);
  writeAssetsMapFile({
    files,
  });
}

files.map((file: string) => {
  createAssetComponentFile({
    file: file.replace(".svg", ""),
  });
});

const assetsDocDir = "../../lib/moon_web/pages/";

const writeAssetsDocumentationPage = (pageContent: string) => {
  if (!pageContent) {
    return console.error("no content");
  }
  fs.writeFileSync(assetsDocDir + "icons_page.ex", pageContent);
};

const generateAssetsDocumentationPageContent = (modules: string[]): string => {
  return `
defmodule MoonWeb.Pages.IconsPage do
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
        to: "/icons",
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
};

const generateAssetsDocumentationPage = (files: string[]) => {
  const modules = files
    .sort(caseInsensitiveCompare)
    .map((f: string) => getModuleName(f));
  const pageContent = generateAssetsDocumentationPageContent(modules);
  writeAssetsDocumentationPage(pageContent);
};

(() => {
  const files = getFilesList();
  generateAssetsDocumentationPage(files);
})();
