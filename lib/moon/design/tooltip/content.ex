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
  slot(arrow)

  def render(assigns) do
    ~F"""
    <div class={
      "absolute left-0 right-0 z-30",
      (@position == "bottom" && "bottom-0") || "top-0",
      "flex flex-col items-center": @position in ~w(top bottom)
    }>
      {#case @position}
        {#match "top"}
          <div class="-translate-y-full">
            <div class={content_class(@class)}>
              <#slot />
            </div>
            <div class="w-full overflow-hidden">
              <#slot {@arrow} context_put={direction_class: "mx-auto -translate-y-1/2"} />
            </div>
          </div>
        {#match "right"}
          <div class="flex items-center translate-x-full">
            <div class="p-1 overflow-hidden">
              <#slot {@arrow} context_put={direction_class: "-translate-x-1/4"} />
            </div>
            <div class={content_class(@class)}>
              <#slot />
            </div>
          </div>
        {#match "bottom"}
          <div class="translate-y-full">
            <div class="w-full overflow-hidden">
              <#slot {@arrow} context_put={direction_class: "mx-auto translate-y-1/2"} />
            </div>
            <div class={content_class(@class)}>
              <#slot />
            </div>
          </div>
        {#match "left"}
          <div class="absolute -translate-x-full">
            <div class="flex items-center top-0 right-0">
              <div class={content_class(@class)}>
                <#slot />
              </div>
              <div class="py-1 overflow-hidden">
                <#slot {@arrow} context_put={direction_class: "-translate-x-1/2"} />
              </div>
            </div>
          </div>
      {/case}
    </div>
    """
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
