defmodule MoonWeb.Components.Facing.FigmaIcon do
  @moduledoc false

  use Moon.StatelessComponent

  def render(assigns) do
    ~F"""
    <img src="/moon/assets/svgs/moon_web/figma_icon.svg">
    """
  end
end
