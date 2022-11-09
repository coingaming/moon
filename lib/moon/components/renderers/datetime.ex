defmodule Moon.Components.Renderers.Datetime do
  @moduledoc false
  use Surface.Component

  prop(value, :any)

  def render(assigns) do
    ~F"""
    {@value && Timex.format!(@value, "%b %d, %Y, %H:%M:%S", :strftime)}
    """
  end
end
