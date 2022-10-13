defmodule MoonWeb.Components.SidebarLink do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias Moon.Components.Chip

  prop route, :any
  slot default

  def render(assigns) do
    ~F"""
    <Context get={active_page: active_page, theme_name: theme_name, direction: direction}>
      <a
        data-phx-link="patch"
        data-phx-link-state="push"
        data-moon-active={active_page == @route}
        href={live_path(MoonWeb.Endpoint, @route, theme_name: theme_name, direction: direction)}
      >
        <Chip active={active_page == @route} variant="ghost">
          <#slot />
        </Chip>
      </a>
    </Context>
    """
  end
end
