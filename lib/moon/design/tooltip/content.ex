defmodule Moon.Design.Tooltip.Content do
  @moduledoc false

  use Surface.Component, slot: "default"

  import Moon.Helpers.MergeClass

  prop(class, :css_class)

  # prop(position, :string,
  #   values!: [
  #     "top-start",
  #     "top-center",
  #     "top-end",
  #     "bottom-start",
  #     "bottom-center",
  #     "bottom-end",
  #     "right",
  #     "left"
  #   ],
  #   default: "top-center"
  # )

  prop(position, :string,
    values: ["top", "right", "bottom", "left"],
    default: "top"
  )

  slot(default, required: true)

  def render(assigns) do
    ~F"""
    {#case @position}
      {#match "top"}
        <div x-cloak x-show="tooltip" class="absolute left-0 top-0 right-0 flex flex-col items-center">
          <div class="-translate-y-full">
            <div class={content_class(@class)}>
              <#slot />
            </div>
            <div class="w-full overflow-hidden">
              <div class="h-3 w-3 mx-auto bg-gohan -rotate-45 -translate-y-1/2 shadow" />
            </div>
          </div>
        </div>
      {#match "right"}
        <div x-cloak x-show="tooltip" class="absolute left-0 top-0 right-0 z-30">
          <div class="flex items-center translate-x-full">
            <div class="p-1 overflow-hidden">
              <div class="h-3 w-3 bg-gohan -rotate-45 -translate-x-1/4 shadow" />
            </div>
            <div class={content_class(@class)}>
              <#slot />
            </div>
          </div>
        </div>
      {#match "bottom"}
        <div x-cloak x-show="tooltip" class="absolute left-0 bottom-0 right-0 flex flex-col items-center">
          <div class="translate-y-full">
            <div class="w-full overflow-hidden">
              <div class="h-3 w-3 mx-auto bg-gohan -rotate-45 translate-y-1/2 shadow" />
            </div>
            <div class={content_class(@class)}>
              <#slot />
            </div>
          </div>
        </div>
      {#match "left"}
        <div x-cloak x-show="tooltip" class="absolute left-0 bottom-0 right-0 z-30">
          <div class="absolute -translate-x-full -translate-y-full">
            <div class="flex items-center top-0 right-0">
              <div class={content_class(@class)}>
                <#slot />
              </div>
              <div class="py-1 overflow-hidden">
                <div class="h-3 w-3 bg-gohan -rotate-45 -translate-x-1/2 shadow" />
              </div>
            </div>
          </div>
        </div>
    {/case}
    """
  end

  defp content_class1(class) do
    merge([
      "w-48 p-4 text-moon-14 text-center bg-gohan shadow rounded",
      # "shadow-[0_6px_6px_-6px_rgba(0,0,0,0.16)] drop-shadow-[0_0_1px_rgba(0,0,0,0.4)]",
      class
    ])
  end

  defp content_class(class) do
    merge([
      "p-3 rounded-moon-s-xs text-moon-12 text-bulma bg-gohan whitespace-nowrap",
      "shadow-[0_6px_6px_-6px_rgba(0,0,0,0.16)]",
      # "drop-shadow-[0_0_1px_rgba(0,0,0,0.4)]"
      class
    ])
  end
end
