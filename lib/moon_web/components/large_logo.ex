defmodule MoonWeb.Components.LargeLogo do
  @moduledoc false

  use Moon.StatelessComponent

  def render(assigns) do
    ~F"""
    <img src="/moon/assets/svgs/moon_web/large_icon.svg">
    """
  end
end
