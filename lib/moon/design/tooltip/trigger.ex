defmodule Moon.Design.Tooltip.Trigger do
  @moduledoc false

  use Surface.Component, slot: "trigger"

  prop(class, :css_class)

  slot(default, required: true)

  def render(assigns) do
    ~F"""
    <div
      class={"inline-block", @class}
      x-on:mouseover="!!timeout && clearTimeout(timeout)
        timeout = setTimeout(() => {
          tooltip = true
        }, 500)"
      x-on:mouseleave="!!timeout && clearTimeout(timeout)
        timeout = null
        tooltip = false"
      x-on:click="tooltip_ = true"
    >
      <#slot />
    </div>
    """
  end
end
