defmodule MoonWeb.Examples.Parts.SidebarExample.Slim do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Button
  alias Moon.Parts.Sidebar
  alias Moon.Icon

  prop(menu_items, :list, default: MoonWeb.Schema.Link.menu())

  def render(assigns) do
    ~F"""
    <Button left_icon="generic_menu" variant="outline" on_click="open_sidebar">Open Slim Sidebar on small screens</Button>
    <Sidebar variant="slim" id="slim_sidebar">
      <Sidebar.Logo src="/moon_icons/svgs/logos/logo-moon-design-short.svg#item" />
      <Sidebar.Menu>
        {#for menu_item <- @menu_items, menu_item[:icon] != nil}
          <Sidebar.SlimMenuLink route={menu_item[:page]}><Icon class="w-6 h-6" name={menu_item[:icon]} /></Sidebar.SlimMenuLink>
        {/for}
      </Sidebar.Menu>
    </Sidebar>
    """
  end

  def handle_event("open_sidebar", _, socket) do
    Moon.Design.Drawer.open("slim_sidebar")
    {:noreply, socket}
  end

  def code() do
    """

    """
  end
end
