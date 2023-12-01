defmodule MoonWeb.Components.ShowRoomPage.Sidebar.Generic do
  @moduledoc false

  use Moon.StatefulComponent

  alias Moon.Parts.Sidebar
  alias Moon.Icon

  prop(active_page, :any)
  prop(menu_items, :list, default: MoonWeb.Schema.Link.menu())
  prop(editable_menu_items, :list, default: [])
  prop(light_theme, :boolean, default: false)

  def render(assigns) do
    ~F"""
    <div>
      <Sidebar
        id="show_room_generic_sidebar"
        class={"remove:theme-moon-dark theme-moon-light": @light_theme}
      >
        <Sidebar.Generic>
          <Sidebar.Logo src="/moon/assets/svgs/moon_web/large_logo.svg#item" />
          <Sidebar.Section>
            <Sidebar.SectionTitle>Section 1 • Editable</Sidebar.SectionTitle>
            <div class="flex flex-col gap-1">
              {#for editable_menu_item <- @editable_menu_items}
                <Sidebar.MenuLink route={editable_menu_item.link}><Icon class="w-6 h-6" name={editable_menu_item.icon} />{editable_menu_item.name}</Sidebar.MenuLink>
              {/for}
            </div>
          </Sidebar.Section>
          <Sidebar.Section>
            <Sidebar.SectionTitle>Section 2 • Components</Sidebar.SectionTitle>
            {#for menu_item <- @menu_items, menu_item[:icon] == nil}
              {#if menu_item[:children]}
                <Sidebar.Accordion id={"sidebar-#{menu_item[:key]}"} accordion_header={menu_item[:key]}>
                  {#for child_menu_item <- menu_item[:children]}
                    <Sidebar.MenuLink route={child_menu_item[:page]}>{child_menu_item[:key]}</Sidebar.MenuLink>
                  {/for}
                </Sidebar.Accordion>
              {#else}
                <Sidebar.MenuLink route={menu_item[:page]}>{menu_item[:key]}</Sidebar.MenuLink>
              {/if}
            {/for}
          </Sidebar.Section>
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
    Moon.Design.Drawer.open("show_room_generic_sidebar")
    {:noreply, socket}
  end

  def code() do
    """

    """
  end
end
