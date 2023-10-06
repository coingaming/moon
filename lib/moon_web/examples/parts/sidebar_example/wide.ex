defmodule MoonWeb.Examples.Parts.SidebarExample.Wide do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Button
  alias Moon.Design.Avatar
  alias Moon.Parts.Sidebar
  alias Moon.Icon

  prop(active_page, :any)

  prop(menu_items, :list, default: MoonWeb.Schema.Link.menu())

  def render(assigns) do
    ~F"""
    <div>
      <Button left_icon="generic_menu" variant="outline" on_click="open_sidebar">Open Wide Sidebar on small screens</Button>
      <Sidebar variant="wide" id="wide_sidebar">
        <Sidebar.WideMenu>
          <:slim>
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
          </:slim>
          <:generic>
            <Sidebar.Menu>
              <Sidebar.SectionTitle>Section 1 • Generic</Sidebar.SectionTitle>
              <div class="flex flex-col gap-1">
                {#for menu_item <- @menu_items, menu_item[:icon] != nil}
                  <Sidebar.MenuLink route={menu_item[:page]}><Icon class="w-6 h-6" name={menu_item[:icon]} />{menu_item[:key]}</Sidebar.MenuLink>
                {/for}
              </div>
            </Sidebar.Menu>
            <Sidebar.Menu>
              <Sidebar.SectionTitle>Section 2 • Components</Sidebar.SectionTitle>
              {#for menu_item <- @menu_items, menu_item[:icon] == nil}
                {#if menu_item[:children]}
                  <Sidebar.Accordion id={"sidebar-#{menu_item[:key]}"} accordion_header={menu_item[:key]}>
                    {#for child_menu_item <- menu_item[:children]}
                      <Sidebar.MenuLink route={menu_item[:page]}>{child_menu_item[:key]}</Sidebar.MenuLink>
                    {/for}
                  </Sidebar.Accordion>
                {#else}
                  <Sidebar.MenuLink route={menu_item[:page]}>{menu_item[:key]}</Sidebar.MenuLink>
                {/if}
              {/for}
            </Sidebar.Menu>
          </:generic>
        </Sidebar.WideMenu>
      </Sidebar>
    </div>
    """
  end

  def handle_event("open_sidebar", _, socket) do
    Moon.Design.Drawer.open("wide_sidebar")
    {:noreply, socket}
  end

  def code() do
    """

    """
  end
end
