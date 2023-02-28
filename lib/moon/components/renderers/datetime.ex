defmodule Moon.Components.Renderers.Datetime do
  @moduledoc false
  use Surface.Component

  prop(value, :any)
  prop(format, :string, default: "%b %d, %Y, %H:%M:%S")

  def render(assigns) do
    ~F"""
    {@value && Timex.format!(@value, @format, :strftime)}
    """
  end
end
