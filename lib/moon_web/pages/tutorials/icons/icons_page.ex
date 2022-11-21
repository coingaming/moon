defmodule MoonWeb.Pages.IconsPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Helpers.Icons
  alias Moon.Icon
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.IconsBlock
  alias MoonWeb.Components.IconItem
  alias MoonWeb.Components.PageSection
  alias MoonWeb.Pages.IconsPage.IconsImportDisplay

  data(selected_icons, :list, default: [])

  data(breadcrumbs, :any,
    default: [
      %{
        to: "/icons",
        name: "Icons"
      }
    ]
  )

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Icons" />

      <ExampleAndCode title="Sizes and colors" id="icons">
        <:example>
          <Icon name="files_copy" />
          <Icon name="files_copy" class="text-moon-32" />
          <Icon name="files_copy" class="text-chi-chi-100 text-moon-48" />
          <Icon name="files_copy" class="text-piccolo-100 text-moon-48" />
        </:example>

        <:code>{icons_code()}</:code>
      </ExampleAndCode>

      <p>
        Please select icons for Import.
      </p>

      <PageSection
        title="Import code for selected icons (by attribute)"
        :if={!Enum.empty?(@selected_icons)}
      >
        <IconsImportDisplay>
          {get_import_text_by_attribute(assigns, @selected_icons)}
        </IconsImportDisplay>
      </PageSection>

      <PageSection title="Import code for selected icons (by name)" :if={!Enum.empty?(@selected_icons)}>
        <IconsImportDisplay>
          {get_import_text_by_name(assigns, @selected_icons)}
        </IconsImportDisplay>
      </PageSection>

      {#for name <- Icons.group_names()}
        <PageSection title={String.capitalize(name)}>
          <IconsBlock>
            {#for icon_name <- apply(Icons, String.to_existing_atom("list_#{name}"), [])}
              <IconItem click="add_selected_icon" value={icon_name} name={icon_name} />
            {/for}
          </IconsBlock>
        </PageSection>
      {/for}
    </Page>
    """
  end

  def icons_code do
    """
    <Icon name="files_copy" />
    <Icon name="files_copy" class="text-2xl" />
    <Icon name="files_copy" font_size="3rem" class="text-chi-chi-100 text-2xl" />
    <Icon name="files_copy" font_size="3rem" class="text-piccolo-100 text-2xl" />
    """
  end

  def handle_event(
        "add_selected_icon",
        %{"icon-value" => value},
        socket
      ) do
    selected_icons = Enum.concat(socket.assigns.selected_icons, [value])
    socket = socket |> assign(:selected_icons, selected_icons)
    {:noreply, socket}
  end

  defp get_import_text_by_attribute(assigns, selected_icons) do
    ~F"""
    alias Moon.Icon

    {#for icon <- selected_icons}{icon_string(icon)}{/for}
    """
  end

  defp icon_string(name) do
    """
      <Icon name="#{name}" />
    """
  end

  defp get_import_text_by_name(assigns, selected_icons) do
    case_converted_list = Enum.map(selected_icons, fn i -> Macro.camelize(i) end)
    import_name_string = Enum.join(case_converted_list, ", ")

    ~F"""
    {get_alias_string(import_name_string)}
    {#for icon <- case_converted_list}{get_icon_tag(icon)}{/for}
    """
  end

  defp get_alias_string(names) do
    # credo:disable-for-next-line Credo.Check.Consistency.SpaceInParentheses
    "alias Moon.Icons.{#{names}}"
  end

  defp get_icon_tag(name) do
    "<#{name} />\n"
  end
end
