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

  data selected_icons, :list, default: []

  data breadcrumbs, :any,
    default: [
      %{
        to: "/icons",
        name: "Icons"
      }
    ]

  def mount(params, _session, socket) do
    {:ok,
     assign(socket,
       theme_name: params["theme_name"] || "moon-design-light",
       active_page: __MODULE__
     )}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <ComponentPageDescription title="Icons" />

      <ExampleAndCode title="Sizes and colors" id="icons">
        <:example>
          <Icon name="files_copy" />
          <Icon name="files_copy" font_size="2rem" />
          <Icon name="files_copy" font_size="3rem" class="text-chi-chi-100" />
          <Icon name="files_copy" font_size="3rem" class="text-piccolo-100" />
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

      <PageSection title="Arrows">
        <IconsBlock>
          {#for icon_name <- Icons.list_arrows()}
            <IconItem click="add_selected_icon" value={icon_name} name={icon_name} />
          {/for}
        </IconsBlock>
      </PageSection>

      <PageSection title="Chart">
        <IconsBlock>
          {#for icon_name <- Icons.list_chart()}
            <IconItem click="add_selected_icon" value={icon_name} name={icon_name} />
          {/for}
        </IconsBlock>
      </PageSection>

      <PageSection title="Chat">
        <IconsBlock>
          {#for icon_name <- Icons.list_chat()}
            <IconItem click="add_selected_icon" value={icon_name} name={icon_name} />
          {/for}
        </IconsBlock>
      </PageSection>

      <PageSection title="Controls">
        <IconsBlock>
          {#for icon_name <- Icons.list_controls()}
            <IconItem click="add_selected_icon" value={icon_name} name={icon_name} />
          {/for}
        </IconsBlock>
      </PageSection>

      <PageSection title="Devices">
        <IconsBlock>
          {#for icon_name <- Icons.list_devices()}
            <IconItem click="add_selected_icon" value={icon_name} name={icon_name} />
          {/for}
        </IconsBlock>
      </PageSection>

      <PageSection title="Files">
        <IconsBlock>
          {#for icon_name <- Icons.list_files()}
            <IconItem click="add_selected_icon" value={icon_name} name={icon_name} />
          {/for}
        </IconsBlock>
      </PageSection>

      <PageSection title="Generic">
        <IconsBlock>
          {#for icon_name <- Icons.list_generic()}
            <IconItem click="add_selected_icon" value={icon_name} name={icon_name} />
          {/for}
        </IconsBlock>
      </PageSection>

      <PageSection title="Mail">
        <IconsBlock>
          {#for icon_name <- Icons.list_mail()}
            <IconItem click="add_selected_icon" value={icon_name} name={icon_name} />
          {/for}
        </IconsBlock>
      </PageSection>

      <PageSection title="Maps">
        <IconsBlock>
          {#for icon_name <- Icons.list_maps()}
            <IconItem click="add_selected_icon" value={icon_name} name={icon_name} />
          {/for}
        </IconsBlock>
      </PageSection>

      <PageSection title="Media">
        <IconsBlock>
          {#for icon_name <- Icons.list_media()}
            <IconItem click="add_selected_icon" value={icon_name} name={icon_name} />
          {/for}
        </IconsBlock>
      </PageSection>

      <PageSection title="Notifications">
        <IconsBlock>
          {#for icon_name <- Icons.list_notifications()}
            <IconItem click="add_selected_icon" value={icon_name} name={icon_name} />
          {/for}
        </IconsBlock>
      </PageSection>

      <PageSection title="Other">
        <IconsBlock>
          {#for icon_name <- Icons.list_other()}
            <IconItem click="add_selected_icon" value={icon_name} name={icon_name} />
          {/for}
        </IconsBlock>
      </PageSection>

      <PageSection title="Security">
        <IconsBlock>
          {#for icon_name <- Icons.list_security()}
            <IconItem click="add_selected_icon" value={icon_name} name={icon_name} />
          {/for}
        </IconsBlock>
      </PageSection>

      <PageSection title="Shop">
        <IconsBlock>
          {#for icon_name <- Icons.list_shop()}
            <IconItem click="add_selected_icon" value={icon_name} name={icon_name} />
          {/for}
        </IconsBlock>
      </PageSection>

      <PageSection title="Software">
        <IconsBlock>
          {#for icon_name <- Icons.list_software()}
            <IconItem click="add_selected_icon" value={icon_name} name={icon_name} />
          {/for}
        </IconsBlock>
      </PageSection>

      <PageSection title="Sport">
        <IconsBlock>
          {#for icon_name <- Icons.list_sport()}
            <IconItem click="add_selected_icon" value={icon_name} name={icon_name} />
          {/for}
        </IconsBlock>
      </PageSection>

      <PageSection title="Text">
        <IconsBlock>
          {#for icon_name <- Icons.list_text()}
            <IconItem click="add_selected_icon" value={icon_name} name={icon_name} />
          {/for}
        </IconsBlock>
      </PageSection>

      <PageSection title="Time">
        <IconsBlock>
          {#for icon_name <- Icons.list_time()}
            <IconItem click="add_selected_icon" value={icon_name} name={icon_name} />
          {/for}
        </IconsBlock>
      </PageSection>

      <PageSection title="Travel">
        <IconsBlock>
          {#for icon_name <- Icons.list_travel()}
            <IconItem click="add_selected_icon" value={icon_name} name={icon_name} />
          {/for}
        </IconsBlock>
      </PageSection>

      <PageSection title="Type">
        <IconsBlock>
          {#for icon_name <- Icons.list_type()}
            <IconItem click="add_selected_icon" value={icon_name} name={icon_name} />
          {/for}
        </IconsBlock>
      </PageSection>
    </Page>
    """
  end

  def icons_code do
    """
    <Icon name="files_copy" />
    <Icon name="files_copy" font_size="2rem" />
    <Icon name="files_copy" font_size="3rem" class="text-chi-chi-100" />
    <Icon name="files_copy" font_size="3rem" class="text-piccolo-100" />
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
