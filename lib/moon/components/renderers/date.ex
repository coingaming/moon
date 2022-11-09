defmodule Moon.Components.Renderers.Date do
  @moduledoc false
  use Surface.Component

  prop(value, :any)

  def render(assigns) do
    ~F"""
    {@value && Timex.format!(@value, "%b %d, %Y", :strftime)}
    """
  end
end
