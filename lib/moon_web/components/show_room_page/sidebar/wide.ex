defmodule MoonWeb.Components.ShowRoomPage.Sidebar.Wide do
  @moduledoc false

  use Moon.StatefulComponent

  alias Moon.Parts.Sidebar
  alias Moon.Parts.Avatar
  alias Moon.Icon

  prop(menu_items, :list, default: MoonWeb.Schema.Link.menu())
  prop(light_theme, :boolean, default: false)
  prop(editable_menu_items, :list, default: [])

  prop(active_page, :any)

  def render(assigns) do
    ~F"""
    <div>
      <Sidebar
        id="show_room_wide_sidebar"
        class={"remove:theme-moon-dark theme-moon-light": @light_theme}
      >
        <Sidebar.Slim>
          <Sidebar.SlimLogo src="/moon_icons/svgs/logos/logo-moon-design-short.svg#item" />
          {#for editable_menu_item <- @editable_menu_items}
            <Sidebar.SlimMenuLink
              route={editable_menu_item.link}
              icon_name={editable_menu_item.icon}
              tooltip_text={editable_menu_item.name}
              is_active={@active_page == editable_menu_item.link |> String.split("?") |> Enum.at(-1)}
            />
          {/for}
          <:bottom>
            <Sidebar.SlimMenuLink
              route="#"
              icon_name="generic_settings"
              tooltip_text="Settings"
              is_active={@active_page == "#"}
            />
            <Avatar name="md">
              <Avatar.Status />
            </Avatar>
          </:bottom>
        </Sidebar.Slim>

        <Sidebar.Generic>
          <Sidebar.Logo src="/moon/assets/svgs/moon_web/large_logo.svg#item" />
          <Sidebar.Section>
            <Sidebar.SectionTitle>Section 1 • Editable</Sidebar.SectionTitle>
            <div class="flex flex-col gap-1">
              {#for editable_menu_item <- @editable_menu_items}
                <Sidebar.MenuLink
                  is_active={@active_page == editable_menu_item.link |> String.split("?") |> Enum.at(-1)}
                  route={editable_menu_item.link}
                >
                  <Icon class="w-6 h-6" name={editable_menu_item.icon} />{editable_menu_item.name}
                </Sidebar.MenuLink>
              {/for}
            </div>
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
    Moon.Design.Drawer.open("show_room_wide_sidebar")
    {:noreply, socket}
  end

  def code() do
    """

    """
  end
end
