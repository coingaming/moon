defmodule Moon.Design.Drawer.Panel do
  @moduledoc false

  # TODO
  # Add "drawer leave" animations.

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

  # inner API
  prop(on_close, :event, from_context: :on_close)

  def render(assigns) do
    ~F"""
    <div
      class={merge([
        [
          "fixed w-full bg-gohan text-bulma shadow-moon-xl",
          "top-0 animate-drawerentertop": @position == "top",
          "bottom-0 animate-drawerenterbottom": @position == "bottom",
          "inset-y-0 ltr:left-0 rtl:right-0 w-5/6 max-w-md ltr:animate-drawerenterleft rtl:animate-drawerenterright":
            @position == "start",
          "inset-y-0 ltr:right-0 rtl:left-0 w-5/6 max-w-md ltr:animate-drawerenterright rtl:animate-drawerenterleft":
            @position == "end"
        ],
        @class
      ])}
      :on-click-away={@on_close}
    >
      <#slot />
    </div>
    """
  end
end
