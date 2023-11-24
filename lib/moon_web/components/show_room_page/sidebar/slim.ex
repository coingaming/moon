defmodule MoonWeb.Components.ShowRoomPage.Sidebar.Slim do
  @moduledoc false

  use Moon.StatefulComponent

  alias Moon.Parts.Sidebar
  alias Moon.Parts.Avatar

  prop(menu_items, :list, default: MoonWeb.Schema.Link.menu())
  prop(light_theme, :boolean, default: false)

  def render(assigns) do
    ~F"""
    <div>
      <Sidebar {=@id} class={"remove:theme-moon-dark theme-moon-light": @light_theme}>
        <Sidebar.Slim links={Enum.filter(@menu_items, &(&1[:icon] != nil))}>
          <Sidebar.SlimLogo src="/moon_icons/svgs/logos/logo-moon-design-short.svg#item" />
          <:bottom>
            <Sidebar.SlimMenuLink route="#" icon_name="generic_settings" tooltip_text="Settings" />
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
