defmodule MoonWeb.Examples.Parts.SidebarExample.Slim do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Button
  alias Moon.Design.Avatar
  alias Moon.Parts.Sidebar

  prop(menu_items, :list, default: MoonWeb.Schema.Link.menu())

  def render(assigns) do
    ~F"""
    <div>
      <Button left_icon="generic_menu" variant="outline" on_click="open_sidebar">Open Slim Sidebar on small screens</Button>
      <Sidebar.Slim id="slim_sidebar" links={Enum.filter(@menu_items, &(&1[:icon] != nil))}>
        <Sidebar.SlimLogo src="/moon_icons/svgs/logos/logo-moon-design-short.svg#item" />
        <:bottom>
          <Sidebar.SlimMenuLink route="#" icon_name="generic_settings" tooltip_text="Settings" />
          <Avatar class="rounded-full rounded-moon-i-xx bg-cell" name="ET" />
        </:bottom>
      </Sidebar.Slim>
    </div>
    """
  end

  def handle_event("open_sidebar", _, socket) do
    Moon.Design.Drawer.open("slim_sidebar")
    {:noreply, socket}
  end

  def code() do
    """
    alias Moon.Design.Button
    alias Moon.Design.Avatar
    alias Moon.Parts.Sidebar

    prop(menu_items, :list, default: MoonWeb.Schema.Link.menu())

    def render(assigns) do
      ~F\"""
      <div>
        <Button left_icon="generic_menu" variant="outline" on_click="open_sidebar">Open Slim Sidebar on small screens</Button>
        <Sidebar.Slim id="slim_sidebar" links={Enum.filter(@menu_items, &(&1[:icon] != nil))}>
          <Sidebar.SlimLogo src="/moon_icons/svgs/logos/logo-moon-design-short.svg#item" />
          <:bottom>
            <Sidebar.SlimMenuLink route="#" icon_name="generic_settings" tooltip_text="Settings" />
            <Avatar class="rounded-full rounded-moon-i-xx bg-cell" name="ET" />
          </:bottom>
        </Sidebar.Slim>
      </div>
      \"""
    end
    """
  end
end
