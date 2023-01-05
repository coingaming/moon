defmodule Moon.Design.Tooltip.Content do
  @moduledoc false

  use Surface.Component, slot: "default"

  import Moon.Helpers.MergeClass

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
  slot(arrow)

  def render(assigns) do
    ~F"""
    <div class={
      "absolute left-0 right-0 z-30",
      (@position in ~w(bottom-start bottom-center bottom-end) && "bottom-0") || "top-0",
      # TODO: fix shadow (bottom, left & right) and unmark no-shadow example as hidden
      "drop-shadow-[0_0_1px_rgba(0,0,0,0.4)]",
      "flex flex-col items-center": !(@position in ~w(left right))
    }>
      {#case @position}
        {#match "top-" <> align}
          <div class="-translate-y-full">
            <div class={content_class(@class, align)}>
              <#slot />
            </div>
            <div class="w-full overflow-hidden">
              <#slot {@arrow} context_put={parent_class: ["mx-auto -translate-y-1/2", @class]}>
                <div class="w-3 h-3 bg-transparent" />
              </#slot>
            </div>
          </div>
        {#match "right"}
          <div class="flex items-center translate-x-full">
            <div class="p-1 overflow-hidden">
              <#slot {@arrow} context_put={parent_class: ["-translate-x-1/4", @class]}>
                <div class="w-3 h-3 bg-transparent" />
              </#slot>
            </div>
            <div class={content_class(@class)}>
              <#slot />
            </div>
          </div>
        {#match "bottom-" <> align}
          <div class="translate-y-full">
            <div class="w-full overflow-hidden">
              <#slot {@arrow} context_put={parent_class: ["mx-auto translate-y-1/2", @class]}>
                <div class="w-3 h-3 bg-transparent" />
              </#slot>
            </div>
            <div class={content_class(@class, align)}>
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
                <#slot {@arrow} context_put={parent_class: ["-translate-x-1/2", @class]}>
                  <div class="w-3 h-3 bg-transparent" />
                </#slot>
              </div>
            </div>
          </div>
      {/case}
    </div>
    """
  end

  defp content_class(class, align \\ "center") do
    merge([
      "p-3 rounded-moon-s-xs text-moon-12 text-bulma bg-gohan whitespace-nowrap",
      "shadow-[0_6px_6px_-6px_rgba(0,0,0,0.16)]",
      [
        "ltr:-translate-x-1/3 rtl:translate-x-1/3": align == "end",
        "ltr:translate-x-1/3 rtl:-translate-x-1/3": align == "start"
      ],
      class
    ])
  end
end
