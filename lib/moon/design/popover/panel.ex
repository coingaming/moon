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

  slot(default)

  def render(assigns) do
    ~F"""
    <div class="w-72 z-[999999] p-1 rounded-moon-i-md box-border bg-gohan shadow-moon-lg overflow-y-auto focus:outline-none absolute">
      {#case @position}
        {#match "top-" <> align}
          <div class="relative">
            <div class={align}>
              <#slot />
            </div>
          </div>
        {#match "right"}
          <div class="relative">
            <div>
              <#slot />
            </div>
          </div>
        {#match "bottom-" <> align}
          <div class="relative">
            <div class={align}>
              <#slot />
            </div>
          </div>
        {#match "left"}
          <div class="relative">
            <div class="flex items-center top-0 right-0">
              <div>
                <#slot />
              </div>
            </div>
          </div>
      {/case}
    </div>
    """
  end
end

# right
# position: absolute; inset: 0px auto auto 0px; transform: translate3d(75px, -84px, 0px);

# top
# position: absolute; inset: auto auto 0px 0px; transform: translate3d(-116px, -48px, 0px);

# left
# position: absolute; inset: 0px 0px auto auto; transform: translate3d(-66px, -84px, 0px);
