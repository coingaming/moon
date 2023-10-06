defmodule MoonWeb.Examples.Parts.SidebarExample.Slim do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Button
  alias Moon.Design.Avatar
  alias Moon.Parts.Sidebar
  alias Moon.Icon

  prop(menu_items, :list, default: MoonWeb.Schema.Link.menu())

  def render(assigns) do
    ~F"""
    <div>
      <Button left_icon="generic_menu" variant="outline" on_click="open_sidebar">Open Slim Sidebar on small screens</Button>
      <Sidebar variant="slim" id="slim_sidebar">
        <Sidebar.Logo src="/moon_icons/svgs/logos/logo-moon-design-short.svg#item" />
        <Sidebar.Menu>
          <:top>
            {#for menu_item <- @menu_items, menu_item[:icon] != nil}
              <Sidebar.SlimMenuLink
                route={menu_item[:page]}
                icon_name={menu_item[:icon]}
                tooltip_text={menu_item[:key]}
              />
            {/for}
          </:top>
          <:bottom>
            <Sidebar.SlimMenuLink route="#" icon_name="generic_settings" tooltip_text="Settings" />
            <Avatar class="rounded-full rounded-moon-i-xx bg-cell" name="ET" />
          </:bottom>
        </Sidebar.Menu>
      </Sidebar>
    </div>
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
