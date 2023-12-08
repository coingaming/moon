defmodule MoonWeb.Components.ShowRoomPage.Sidebar.Slim do
  @moduledoc false

  use Moon.StatefulComponent

  alias Moon.Parts.Sidebar
  alias Moon.Parts.Avatar

  prop(light_theme, :boolean, default: false)
  prop(editable_menu_items, :list, default: [])

  prop(active_page, :any)

  def render(assigns) do
    ~F"""
    <div>
      <Sidebar {=@id} class={"remove:theme-moon-dark theme-moon-light": @light_theme}>
        <Sidebar.Slim>
          <Sidebar.SlimLogo src="/moon_icons/svgs/logos/logo-moon-design-short.svg#item" />
          {#for editable_menu_item <- @editable_menu_items}
            <Sidebar.SlimMenuLink
              route={editable_menu_item.link}
              icon_name={editable_menu_item.icon}
              tooltip_text={editable_menu_item.name}
              is_active={@active_page == editable_menu_item.link |> String.split("?") |> Enum.at(-1)}
            />
          {/for}
          <:bottom>
            <Sidebar.SlimMenuLink
              route="#"
              is_active={@active_page == "#"}
              icon_name="generic_settings"
              tooltip_text="Settings"
            />
            <Avatar name="md">
              <Avatar.Status />
            </Avatar>
          </:bottom>
        </Sidebar.Slim>
        <Sidebar.BottomNavigation
          src="/moon_icons/svgs/logos/logo-moon-design-short.svg#item"
          href="#"
          on_click="open_sidebar"
        />
      </Sidebar>
    </div>
    """
  end

  def handle_event("open_sidebar", _, socket) do
    Moon.Design.Drawer.open("show_room_slim_sidebar")
    {:noreply, socket}
  end

  def code() do
    """

    """
  end
end
