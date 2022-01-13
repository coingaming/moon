defmodule Moon.Components.Tooltip do
  @moduledoc false

  use Moon.StatelessComponent

  prop text, :string, required: true

  prop placement, :string,
    values: ["top", "right", "bottom", "left"],
    required: true

  slot default, required: true

  # TODO:
  # Right now the tooltip does not align properly for "left" and "right" placements.
  # we need to figure out another way to position it properly.

  def render(assigns) do
    ~F"""
    <div class="relative inline-block" x-data="{ tooltip: false, timeout: null }">
      {#case @placement}
        {#match "top"}
          <div x-cloak x-show="tooltip" class="absolute left-0 top-0 right-0 flex flex-col items-center">
            <div class="-translate-y-full">
              <div class="w-48 p-4 text-sm text-center bg-gohan-100 shadow rounded">
                {@text}
              </div>
              <div class="w-full overflow-hidden">
                <div class="h-3 w-3 mx-auto bg-gohan-100 -rotate-45 -translate-y-1/2 shadow" />
              </div>
            </div>
          </div>
        {#match "right"}
          <div x-cloak x-show="tooltip" class="absolute left-0 top-0 right-0">
            <div class="flex items-center translate-x-full -translate-y-1/4">
              <div class="p-1 overflow-hidden">
                <div class="h-4 w-4 bg-gohan-100 -rotate-45 translate-x-1/2 shadow" />
              </div>
              <div class="w-48 p-4 text-sm text-center bg-gohan-100 shadow rounded">
                {@text}
              </div>
            </div>
          </div>
        {#match "bottom"}
          <div x-cloak x-show="tooltip" class="absolute left-0 bottom-0 right-0 flex flex-col items-center">
            <div class="translate-y-full">
              <div class="w-full overflow-hidden">
                <div class="h-3 w-3 mx-auto bg-gohan-100 -rotate-45 translate-y-1/2 shadow" />
              </div>
              <div class="w-48 p-4 text-sm text-center bg-gohan-100 shadow rounded">
                {@text}
              </div>
            </div>
          </div>
        {#match "left"}
          <div x-cloak x-show="tooltip" class="absolute left-0 bottom-0 right-0">
            <div class="absolute -translate-x-full -translate-y-full">
              <div class="flex items-center top-0 right-0">
                <div class="w-48 p-4 text-sm text-center bg-gohan-100 shadow rounded">
                  {@text}
                </div>
                <div class="py-1 overflow-hidden">
                  <div class="h-3 w-3 bg-gohan-100 -rotate-45 -translate-x-1/2 shadow" />
                </div>
              </div>
            </div>
          </div>
      {/case}

      <div
        class="inline-block"
        x-on:mouseover="!!timeout && clearTimeout(timeout)
          timeout = setTimeout(() => {
            tooltip = true
          }, 500)"
        x-on:mouseleave="!!timeout && clearTimeout(timeout)
          timeout = null
          tooltip = false"
      >
        <#slot />
      </div>
    </div>
    """
  end
end
