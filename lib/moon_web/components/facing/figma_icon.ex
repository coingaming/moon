defmodule MoonWeb.Components.Facing.FigmaIcon do
  @moduledoc false

  use Moon.StatelessComponent

  def render(assigns) do
    ~F"""
    <svg
      class="moon-icon"
      viewBox="0 0 32 32"
      style={get_style(color: "gohan", background_color: "gohan", font_size: "2rem")}
    >
      <use href="/moon/assets/svgs/moon_web/figma_icon.svg#item" />
    </svg>
    """
  end
end
