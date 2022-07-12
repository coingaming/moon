defmodule Moon.Components.CardV2 do
  @moduledoc false

  use Moon.StatelessComponent

  prop rounded, :css_class, default: "rounded-md"
  prop class, :css_class
  prop background_color_class, :css_class, default: "bg-gohan-100"
  prop border_color_class, :css_class

  slot top, required: true
  slot left_bottom
  slot right_bottom

  def render(assigns) do
    ~F"""
    <div class={
      "w-full grid grid-cols-2 gap-6 p-6",
      @class,
      @background_color_class,
      @border_color_class,
      @rounded
    }>
      <div class="text-moon-18 text-bulma-100" style="grid-column-start: 1; grid-column-end: 3;">
        <#slot name="top" />
      </div>

      <div class="flex justify-between" style="grid-column-start: 1; grid-column-end: 3;">
        <div class="pt-4 text-moon-14 text-roshi-100">
          <#slot name="left_bottom" />
        </div>
        <div class="text-moon-48 text-bulma-100" style="justify-self: end;">
          <#slot name="right_bottom" />
        </div>
      </div>
    </div>
    """
  end
end
