defmodule Moon.Design.Tooltip.Arrow do
  @moduledoc false

  use Surface.Component, slot: "arrow"

  prop(class, :css_class)

  # internal API
  prop(direction_class, :css_class, from_context: :direction_class)

  def render(assigns) do
    ~F"""
    <div class={
      "h-3 w-3  bg-gohan -rotate-45 shadow",
      @direction_class,
      @class
      } />
    """
  end
end
