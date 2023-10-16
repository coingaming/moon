defmodule MoonWeb.Examples.Parts.SidebarExample.Wide do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Parts.Sidebar.Avatar
  alias Moon.Parts.Sidebar

  prop(active_page, :any)
  prop(menu_items, :list, default: MoonWeb.Schema.Link.menu())

  def render(assigns) do
    ~F"""
    <div>
      <Sidebar.BottomNavigation
        src="/moon_icons/svgs/logos/logo-moon-design-short.svg#item"
        href="#"
        on_click="open_sidebar"
      />
      <Sidebar.Wide id="wide_sidebar">
        <Sidebar.SlimLogo src="/moon_icons/svgs/logos/logo-moon-design-short.svg#item" />
        <:slim_top>
          {#for menu_item <- Enum.filter(@menu_items, &(&1[:icon] != nil))}
            <Sidebar.SlimMenuLink
              route={menu_item[:page]}
              icon_name={menu_item[:icon]}
              tooltip_text={menu_item[:key]}
            />
          {/for}
        </:slim_top>
        <:slim_bottom>
          <Sidebar.SlimMenuLink route="#" icon_name="generic_settings" tooltip_text="Settings" />
          <Avatar name="ET" />
        </:slim_bottom>
        <:generic>
          <Sidebar.Section>
            <Sidebar.SectionTitle>Section 1 • Components</Sidebar.SectionTitle>
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
        </:generic>
      </Sidebar.Wide>
    </div>
    """
  end

  def handle_event("open_sidebar", _, socket) do
    Moon.Design.Drawer.open("wide_sidebar")
    {:noreply, socket}
  end

  def code() do
    """
    alias Moon.Design.Button
    alias Moon.Parts.Sidebar

    prop(active_page, :any)
    prop(menu_items, :list, default: MoonWeb.Schema.Link.menu())

    def render(assigns) do
      ~F\"""
      <div>
        <Sidebar.BottomNavigation
          src="/moon_icons/svgs/logos/logo-moon-design-short.svg#item"
          href="#"
          on_click="open_sidebar"
        />
        <Sidebar.Wide id="wide_sidebar">
          <Sidebar.SlimLogo src="/moon_icons/svgs/logos/logo-moon-design-short.svg#item" />
          <:slim_top>
            {#for menu_item <- Enum.filter(@menu_items, &(&1[:icon] != nil))}
              <Sidebar.SlimMenuLink
                route={menu_item[:page]}
                icon_name={menu_item[:icon]}
                tooltip_text={menu_item[:key]}
              />
            {/for}
          </:slim_top>
          <:slim_bottom>
            <Sidebar.SlimMenuLink route="#" icon_name="generic_settings" tooltip_text="Settings" />
            <Avatar class="rounded-full rounded-moon-i-xx bg-cell" name="ET" />
          </:slim_bottom>
          <:generic>
            <Sidebar.Section>
              <Sidebar.SectionTitle>Section 1 • Components</Sidebar.SectionTitle>
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
            </Sidebar.Section>
          </:generic>
        </Sidebar.Wide>
      </div>
      \"""
    end

    def handle_event("open_sidebar", _, socket) do
      Moon.Design.Drawer.open("wide_sidebar")
      {:noreply, socket}
    end
    """
  end
end
