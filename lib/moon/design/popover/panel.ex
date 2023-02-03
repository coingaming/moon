defmodule Moon.Design.Popover.Panel do
  @moduledoc false

  use Moon.StatelessComponent, slot: "default"

  prop(class, :css_class)

  prop(position, :string,
    values!: [
      "top-start",
      "top",
      "top-end",
      "bottom-start",
      "bottom",
      "bottom-end",
      "right-start",
      "right",
      "right-end",
      "left-start",
      "left",
      "left-end"
    ],
    default: "top"
  )

  slot(default, required: true)

  def render(assigns) do
    ~F"""
    <div class={merge([
      [
        "absolute z-[9999999] w-72 overflow-y-auto rounded-moon-i-md box-border bg-gohan shadow-moon-lg",
        "left-full top-1/2  ml-2 -translate-y-1/2": @position == "right",
        "left-full top-0    ml-2": @position == "right-start",
        "left-full bottom-0 ml-2": @position == "right-end",
        "right-full top-1/2 mr-2 -translate-y-1/2": @position == "left",
        "right-full top-0 mr-2": @position == "left-start",
        "right-full bottom-0 mr-2": @position == "left-end",
        "top-full left-1/2 mt-2 -translate-x-1/2": @position == "bottom",
        "top-full left-0 mt-2": @position == "bottom-start",
        "top-full right-0 mt-2": @position == "bottom-end",
        "bottom-full left-1/2 mb-2 -translate-x-1/2": @position == "top",
        "bottom-full left-0 mb-2": @position == "top-start",
        "bottom-full right-0 mb-2": @position == "top-end"
      ],
      @class
    ])}>
      <#slot />
    </div>
    """
  end
end
