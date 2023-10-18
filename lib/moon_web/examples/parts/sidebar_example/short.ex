defmodule MoonWeb.Examples.Parts.SidebarExample.Short do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Parts.Sidebar
  alias Moon.Design.Button

  prop(menu_items, :list, default: MoonWeb.Schema.Link.menu())

  def render(assigns) do
    ~F"""
    <div>
      <Button left_icon="generic_menu" variant="outline" on_click="open_sidebar">Open Generic Sidebar on small screens</Button>
      <Sidebar
        id="generic_sidebar"
        sections={[
          %{
            title: "Section 1 • Generic",
            links: Enum.filter(@menu_items, &(&1[:icon] != nil))
          },
          %{
            title: "Section 2 • Components",
            links: Enum.filter(@menu_items, &(&1[:icon] == nil))
          }
        ]}
      >
        <Sidebar.Logo src="/moon/assets/svgs/moon_web/large_logo.svg#item" />
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
