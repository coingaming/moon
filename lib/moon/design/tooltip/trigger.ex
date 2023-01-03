defmodule Moon.Design.Tooltip.Trigger do
  @moduledoc false

  use Surface.Component, slot: "trigger"

  prop(class, :css_class)

  prop(position, :string,
    values!: [
      "top-start",
      "top-center",
      "top-end",
      "bottom-start",
      "bottom-center",
      "bottom-end",
      "right",
      "left"
    ],
    default: "top-center"
  )

  slot(default, required: true)

  def render(assigns) do
    ~F"""
    <div
      class="inline-block"
      x-on:mouseover="!!timeout && clearTimeout(timeout)
        timeout = setTimeout(() => {
          tooltip = true
        }, 500)"
      x-on:mouseleave="!!timeout && clearTimeout(timeout)
        timeout = null
        tooltip = false
        clicked = false"
      x-on:click="clicked = true"
    >
      <#slot />
    </div>
    """
  end
end
