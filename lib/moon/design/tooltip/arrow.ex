defmodule Moon.Design.Tooltip.Arrow do
  @moduledoc false

  use Surface.Component, slot: "arrow"
  import Moon.Helpers.MergeClass

  prop(class, :css_class)

  # internal API
  prop(parent_class, :css_class, from_context: :parent_class)

  def render(assigns) do
    ~F"""
    <div class={merge([
      "h-3 w-3  bg-gohan -rotate-45",
      "shadow-[0_6px_6px_-6px_rgba(0,0,0,0.16)]",
      @parent_class,
      @class
    ])} />
    """
  end
end
