defmodule Moon.Design.Popover.Panel do
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

  def render(assigns) do
    ~F"""
    <div class={
      "absolute left-0 right-0 z-30",
      (@position in ~w(bottom-start bottom-center bottom-end) && "bottom-0") || "top-0",
      "flex flex-col items-center": !(@position in ~w(left right))
    }>
      {#case @position}
        {#match "top-" <> align}
          <div class="-translate-y-full py-2">
            <div class={content_class(@class, align)}>
              <#slot />
            </div>
          </div>
        {#match "right"}
          <div class="items-center ltr:translate-x-full -translate-y-1/3 rtl:translate-x-full px-2">
            <div class={content_class(@class)}>
              <#slot />
            </div>
          </div>
        {#match "bottom-" <> align}
          <div class="translate-y-full py-2">
            <div class={content_class(@class, align)}>
              <#slot />
            </div>
          </div>
        {#match "left"}
          <div class="absolute ltr:-translate-x-full rtr:translate-x-3/4 -translate-y-1/3 px-2">
            <div class="flex items-center top-0 right-0">
              <div class={content_class(@class)}>
                <#slot />
              </div>
            </div>
          </div>
      {/case}
    </div>
    """
  end

  defp content_class(class, align \\ "center") do
    merge([
      "w-72 z-[999999] p-1 rounded-moon-i-md box-border bg-gohan shadow-moon-lg",
      [
        "ltr:-translate-x-1/3 rtl:translate-x-1/3": align == "start",
        "ltr:translate-x-1/3 rtl:-translate-x-1/3": align == "end"
      ],
      class
    ])
  end
end
