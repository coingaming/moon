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
      <ComponentPageDescription title="Icons">
        <p>
          Please select icons for Import.
        </p>
      </ComponentPageDescription>

      <ExampleAndCode title="Sizes and colors" id="icons">
        <:example>
          <Icon name="files_copy" />
          <Icon name="files_copy" font_size="2rem" />
          <Icon name="files_copy" font_size="3rem" class="text-chi-chi-100" />
          <Icon name="files_copy" font_size="3rem" class="text-piccolo-100" />
        </:example>

        <:code>{icons_code()}</:code>
      </ExampleAndCode>

      <PageSection title="Arrows">
        <IconsBlock>
          {#for icon_name <- Icons.list_arrows()}
            <IconItem name={icon_name} />
          {/for}
        </IconsBlock>
      </PageSection>

      <PageSection title="Chart">
        <IconsBlock>
          {#for icon_name <- Icons.list_chart()}
            <IconItem name={icon_name} />
          {/for}
        </IconsBlock>
      </PageSection>

      <PageSection title="Chat">
        <IconsBlock>
          {#for icon_name <- Icons.list_chat()}
            <IconItem name={icon_name} />
          {/for}
        </IconsBlock>
      </PageSection>

      <PageSection title="Controls">
        <IconsBlock>
          {#for icon_name <- Icons.list_controls()}
            <IconItem name={icon_name} />
          {/for}
        </IconsBlock>
      </PageSection>

      <PageSection title="Devices">
        <IconsBlock>
          {#for icon_name <- Icons.list_devices()}
            <IconItem name={icon_name} />
          {/for}
        </IconsBlock>
      </PageSection>

      <PageSection title="Files">
        <IconsBlock>
          {#for icon_name <- Icons.list_files()}
            <IconItem name={icon_name} />
          {/for}
        </IconsBlock>
      </PageSection>

      <PageSection title="Generic">
        <IconsBlock>
          {#for icon_name <- Icons.list_generic()}
            <IconItem name={icon_name} />
          {/for}
        </IconsBlock>
      </PageSection>

      <PageSection title="Mail">
        <IconsBlock>
          {#for icon_name <- Icons.list_mail()}
            <IconItem name={icon_name} />
          {/for}
        </IconsBlock>
      </PageSection>

      <PageSection title="Maps">
        <IconsBlock>
          {#for icon_name <- Icons.list_maps()}
            <IconItem name={icon_name} />
          {/for}
        </IconsBlock>
      </PageSection>

      <PageSection title="Media">
        <IconsBlock>
          {#for icon_name <- Icons.list_media()}
            <IconItem name={icon_name} />
          {/for}
        </IconsBlock>
      </PageSection>

      <PageSection title="Notifications">
        <IconsBlock>
          {#for icon_name <- Icons.list_notifications()}
            <IconItem name={icon_name} />
          {/for}
        </IconsBlock>
      </PageSection>

      <PageSection title="Other">
        <IconsBlock>
          {#for icon_name <- Icons.list_other()}
            <IconItem name={icon_name} />
          {/for}
        </IconsBlock>
      </PageSection>

      <PageSection title="Security">
        <IconsBlock>
          {#for icon_name <- Icons.list_security()}
            <IconItem name={icon_name} />
          {/for}
        </IconsBlock>
      </PageSection>

      <PageSection title="Shop">
        <IconsBlock>
          {#for icon_name <- Icons.list_shop()}
            <IconItem name={icon_name} />
          {/for}
        </IconsBlock>
      </PageSection>

      <PageSection title="Software">
        <IconsBlock>
          {#for icon_name <- Icons.list_software()}
            <IconItem name={icon_name} />
          {/for}
        </IconsBlock>
      </PageSection>

      <PageSection title="Sport">
        <IconsBlock>
          {#for icon_name <- Icons.list_sport()}
            <IconItem name={icon_name} />
          {/for}
        </IconsBlock>
      </PageSection>

      <PageSection title="Text">
        <IconsBlock>
          {#for icon_name <- Icons.list_text()}
            <IconItem name={icon_name} />
          {/for}
        </IconsBlock>
      </PageSection>

      <PageSection title="Time">
        <IconsBlock>
          {#for icon_name <- Icons.list_time()}
            <IconItem name={icon_name} />
          {/for}
        </IconsBlock>
      </PageSection>

      <PageSection title="Travel">
        <IconsBlock>
          {#for icon_name <- Icons.list_travel()}
            <IconItem name={icon_name} />
          {/for}
        </IconsBlock>
      </PageSection>

      <PageSection title="Type">
        <IconsBlock>
          {#for icon_name <- Icons.list_type()}
            <IconItem name={icon_name} />
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
end
