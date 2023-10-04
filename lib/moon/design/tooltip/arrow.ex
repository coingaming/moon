defmodule Moon.Design.Tooltip.Arrow do
  @moduledoc false

  use Surface.Component, slot: "arrow"
  import Moon.Helpers.MergeClass

  prop(class, :css_class)

  # internal API
  prop(parent_class, :css_class, from_context: :parent_class)
  prop(has_no_shadow, :boolean, from_context: :has_no_shadow)

  def render(assigns) do
    ~F"""
    <div class={merge([
      "h-3 w-3  bg-goku -rotate-45",
      (@has_no_shadow && "") || "shadow-[0_6px_6px_-6px_rgba(0,0,0,0.16)]",
      @parent_class,
      @class
    ])} />
    """
  end
end
