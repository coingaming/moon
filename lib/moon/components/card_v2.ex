defmodule Moon.Components.CardV2 do
  @moduledoc false

  use Moon.StatelessComponent

  prop(testid, :string)
  prop(rounded, :css_class, default: "rounded-md")
  prop(class, :css_class)
  prop(background_color_class, :css_class, default: "bg-gohan-100")
  prop(border_color_class, :css_class)
  prop(top_class, :css_class)
  prop(left_bottom_class, :css_class)
  prop(right_bottom_class, :css_class)

  slot(top, required: true)
  slot(left_bottom)
  slot(right_bottom)

  def render(assigns) do
    ~F"""
    <div
      data-testid={@testid}
      class={
        "w-full grid grid-cols-2 gap-6 p-6 text-bulma-100",
        @class,
        @background_color_class,
        @border_color_class,
        @rounded
      }
    >
      <div class={@top_class} style="grid-column-start: 1; grid-column-end: 3;">
        <#slot {@top} />
      </div>

      <div class="flex justify-between items-center" style="grid-column-start: 1; grid-column-end: 3;">
        <div class={
          "pt-4",
          @left_bottom_class
        }>
          <#slot {@left_bottom} />
        </div>
        <div class={@right_bottom_class} style="justify-self: end;">
          <#slot {@right_bottom} />
        </div>
      </div>
    </div>
    """
  end
end
