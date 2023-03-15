defmodule Moon.Design.Drawer.Panel do
  @moduledoc false

  use Moon.StatelessComponent, slot: "panel"

  slot(default)

  prop(position, :string,
    values!: [
      "top",
      "bottom",
      "start",
      "end"
    ],
    default: "end"
  )

  prop(class, :css_class)

  def render(assigns) do
    ~F"""
    <div class={merge([
      [
        "fixed w-full bg-gohan text-bulma shadow-moon-xl",
        "top-0": @position == "top",
        "bottom-0": @position == "bottom",
        "inset-y-0 ltr:left-0 rtl:right-0 w-5/6 max-w-md": @position == "start",
        "inset-y-0 ltr:right-0 rtl:left-0 w-5/6 max-w-md": @position == "end"
      ],
      @class
    ])}>
      <#slot />
    </div>
    """
  end
end
