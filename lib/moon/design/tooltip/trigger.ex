defmodule Moon.Design.Tooltip.Trigger do
  @moduledoc false

  use Surface.Component, slot: "trigger"
  import Moon.Helpers.MergeClass

  prop class, :css_class
  slot default

  def render(assigns) do
    ~F"""
    <div aria-describedby="tooltip" class={merge([get_class(), @class])}>
      <#slot />
    </div>
    """
  end

  def get_class() do
    "group-focus:ring-2 group-focus:outline-none rounded-moon-s-sm"
  end
end
