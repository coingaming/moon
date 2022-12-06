defmodule Moon.Components.Renderers.Date do
  @moduledoc false
  use Surface.Component

  prop(value, :any)
  prop(format, :string, default: "%b %d, %Y")

  def render(assigns) do
    ~F"""
    {@value && Timex.format!(@value, @format, :strftime)}
    """
  end
end
