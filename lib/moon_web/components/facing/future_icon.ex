defmodule MoonWeb.Components.Facing.FutureIcon do
  @moduledoc false

  use Moon.StatelessComponent

  def render(assigns) do
    ~F"""
    <svg
      class="moon-icon"
      width="196" height="151"
      style={get_style(color: "gohan-100", background_color: "gohan-100", font_size: "12rem")}
    >
      <use href="/moon/assets/svgs/moon_web/future_icon.svg#item" />
    </svg>
    """
  end
end
