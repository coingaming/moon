defmodule MoonWeb.Components.SidebarLink do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias Moon.Components.Chip

  prop route, :any
  slot default

  data active_page, :string, from_context: :active_page
  data theme_name, :string, from_context: :theme_name
  data direction, :string, from_context: :direction

  def render(assigns) do
    ~F"""
    <a
      data-phx-link="patch"
      data-phx-link-state="push"
      data-moon-active={@active_page == @route}
      href={live_path(MoonWeb.Endpoint, @route, theme_name: @theme_name, direction: @direction)}
    >
      <Chip active={@active_page == @route} variant="ghost">
        <#slot />
      </Chip>
    </a>
    """
  end
end
