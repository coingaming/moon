defmodule MoonWeb.Examples.Parts.SidebarExample.Generic do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Parts.Sidebar
  alias Moon.Design.Button
  alias Moon.Icon

  prop(active_page, :any)
  prop(menu_items, :list, default: MoonWeb.Schema.Link.menu())

  def render(assigns) do
    ~F"""
    <div>
      <Button left_icon="generic_menu" variant="outline" on_click="open_sidebar">Open Generic Sidebar on small screens</Button>
      <Sidebar id="generic_sidebar">
        <Sidebar.Logo src="/moon/assets/svgs/moon_web/large_logo.svg#item" />
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
      </Sidebar>
    </div>
    """
  end

  def handle_event("open_sidebar", _, socket) do
    Moon.Design.Drawer.open("generic_sidebar")
    {:noreply, socket}
  end

  def active_page_contains(active_page, module_path) do
    String.contains?(to_string(active_page), to_string(module_path))
  end

  def code() do
    """
    alias Moon.Parts.Sidebar
    alias Moon.Design.Button
    alias Moon.Icon

    prop(menu_items, :list, default: MoonWeb.Schema.Link.menu())

    def render(assigns) do
      ~F\"""
      <Button left_icon="generic_menu" variant="outline" on_click="open_sidebar">Open Generic Sidebar on small screens</Button>
      <Sidebar id="generic_sidebar">
        <Sidebar.Logo src="/moon/assets/svgs/moon_web/large_logo.svg#item" />
        <Sidebar.Menu>
          <Sidebar.SectionTitle>Section title • 1</Sidebar.SectionTitle>
          <div class="flex flex-col gap-1">
            {#for menu_item <- @menu_items, menu_item[:icon] != nil}
              <Sidebar.MenuLink route={menu_item[:page]}><Icon class="w-6 h-6" name={menu_item[:icon]} />{menu_item[:key]}</Sidebar.MenuLink>
            {/for}
          </div>
        </Sidebar.Menu>
        <Sidebar.Menu>
          <Sidebar.SectionTitle>Section title • 2</Sidebar.SectionTitle>
          {#for menu_item <- @menu_items, menu_item[:icon] == nil}
            {#if menu_item[:children]}
              <Sidebar.Accordion id={"sidebar-#\{menu_item[:key]}"} accordion_header={menu_item[:key]}>
                {#for child_menu_item <- menu_item[:children]}
                  <Sidebar.MenuLink route={menu_item[:page]}>{child_menu_item[:key]}</Sidebar.MenuLink>
                {/for}
              </Sidebar.Accordion>
            {#else}
              <Sidebar.MenuLink route={menu_item[:page]}>{menu_item[:key]}</Sidebar.MenuLink>
            {/if}
          {/for}
        </Sidebar.Menu>
      </Sidebar>
      \"""
    end

    def handle_event("open_sidebar", _, socket) do
      Moon.Design.Drawer.open("generic_sidebar")
      {:noreply, socket}
    end
    """
  end
end
