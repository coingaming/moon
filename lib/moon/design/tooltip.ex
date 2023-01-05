defmodule Moon.Design.Tooltip do
  @moduledoc false

  use Moon.StatelessComponent

  slot(default, required: true)
  slot(trigger, required: true)

  def render(assigns) do
    # do not be afraid of x-* attrs, it's a simple alpine.js - related stuff
    ~F"""
    <div class="relative inline-block" x-data="{ tooltip: false, timeout: null }">
      <div x-cloak x-show="tooltip" role="tooltip">
        <#slot />
      </div>
      <div
        aria-describedby="tooltip"
        class="inline-block"
        x-on:mouseover="!!timeout && clearTimeout(timeout)
          timeout = setTimeout(() => {
            tooltip = true
          }, 500)"
        x-on:mouseleave="!!timeout && clearTimeout(timeout)
          timeout = null
          tooltip = false"
        x-on:click="tooltip_ = true"
      >
        <#slot {@trigger} />
      </div>
    </div>
    """
  end
end
