defmodule MoonWeb.Components.SidebarLink do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias Moon.Components.MenuItem

  prop(route, :any)
  slot(default)

  data(active_page, :string, from_context: :active_page)
  data(theme_name, :string, from_context: :theme_name)
  data(direction, :string, from_context: :direction)

  def render(assigns) do
    ~F"""
    <MenuItem
      as="a"
      attrs={
        "data-phx-link": "redirect",
        "data-phx-link-state": "push"
      }
      is_active={@active_page == @route}
      href={live_path(MoonWeb.Endpoint, @route, theme_name: @theme_name, direction: @direction)}
    >
      <#slot />
    </MenuItem>
    """
  end
end
