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

  prop(has_no_shadow, :boolean)

  slot(default, required: true)
  slot(arrow)

  def render(assigns) do
    ~F"""
    <div class={
      "absolute left-0 right-0 z-30",
      (@position in ~w(bottom-start bottom-center bottom-end) && "bottom-0") || "top-0",
      "drop-shadow-[0_0_1px_rgba(0,0,0,0.4)]": !@has_no_shadow,
      "flex flex-col items-center": !(@position in ~w(left right))
    }>
      {#case @position}
        {#match "top-" <> align}
          <div class="-translate-y-full">
            <div class={content_class(@class, @has_no_shadow, align)}>
              <#slot />
            </div>
            <div class="w-full overflow-hidden">
              <#slot
                {@arrow}
                context_put={parent_class: ["mx-auto -translate-y-1/2", @class], has_no_shadow: @has_no_shadow}
              >
                <div class="w-3 h-3 bg-transparent" />
              </#slot>
            </div>
          </div>
        {#match "right"}
          <div class="flex items-center ltr:translate-x-full rtl:translate-x-1/2">
            <div class="p-1 overflow-hidden">
              <#slot
                {@arrow}
                context_put={parent_class: ["-translate-x-1/4", @class], has_no_shadow: @has_no_shadow}
              >
                <div class="w-3 h-3 bg-transparent" />
              </#slot>
            </div>
            <div class={content_class(@class, @has_no_shadow)}>
              <#slot />
            </div>
          </div>
        {#match "bottom-" <> align}
          <div class="translate-y-full">
            <div class="w-full overflow-hidden">
              <#slot
                {@arrow}
                context_put={parent_class: ["mx-auto translate-y-1/2", @class], has_no_shadow: @has_no_shadow}
              >
                <div class="w-3 h-3 bg-transparent" />
              </#slot>
            </div>
            <div class={content_class(@class, @has_no_shadow, align)}>
              <#slot />
            </div>
          </div>
        {#match "left"}
          <div class="absolute ltr:-translate-x-full rtl:-translate-x-1/2">
            <div class="flex items-center top-0 right-0">
              <div class={content_class(@class, @has_no_shadow)}>
                <#slot />
              </div>
              <div class="py-1 overflow-hidden">
                <#slot
                  {@arrow}
                  context_put={parent_class: ["-translate-x-1/2", @class], has_no_shadow: @has_no_shadow}
                >
                  <div class="w-3 h-3 bg-transparent" />
                </#slot>
              </div>
            </div>
          </div>
      {/case}
    </div>
    """
  end

  defp content_class(class, has_no_shadow, align \\ "center") do
    merge([
      "p-3 rounded-moon-s-xs text-moon-12 text-bulma bg-gohan whitespace-nowrap",
      (has_no_shadow && "") || "shadow-[0_6px_6px_-6px_rgba(0,0,0,0.16)]",
      [
        "ltr:-translate-x-1/3 rtl:translate-x-1/3": align == "end",
        "ltr:translate-x-1/3 rtl:-translate-x-1/3": align == "start"
      ],
      class
    ])
  end
end
