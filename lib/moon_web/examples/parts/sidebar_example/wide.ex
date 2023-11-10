defmodule MoonWeb.Examples.Parts.SidebarExample.Wide do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Parts.Sidebar

  prop(menu_items, :list, default: MoonWeb.Schema.Link.menu())

  def render(assigns) do
    ~F"""
    <div>
      <Sidebar id="generic_sidebar">
        <Sidebar.Slim links={Enum.filter(@menu_items, &(&1[:icon] != nil))}>
          <Sidebar.SlimLogo src="/moon_icons/svgs/logos/logo-moon-design-short.svg#item" />
          <:bottom>
            <Sidebar.SlimMenuLink route="#" icon_name="generic_settings" tooltip_text="Settings" />
            <Sidebar.Avatar name="ET" />
          </:bottom>
        </Sidebar.Slim>

        <Sidebar.Generic sections={[
          %{
            title: "Section 1 • Generic",
            links: Enum.filter(@menu_items, &(&1[:icon] != nil))
          },
          %{
            title: "Section 2 • Components",
            links: Enum.filter(@menu_items, &(&1[:icon] == nil))
          }
        ]}>
          <Sidebar.Logo src="/moon/assets/svgs/moon_web/large_logo.svg#item" />
        </Sidebar.Generic>
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
    Moon.Design.Drawer.open("generic_sidebar")
    {:noreply, socket}
  end

  def code() do
    """
    """
  end
end
