defmodule Moon.Design.Drawer.Panel do
  @moduledoc false

  use Moon.StatelessComponent, slot: "panel"

  slot(default)

  prop(class, :css_class)

  prop(testid, :string)
  prop(id, :string)

  prop(position, :string,
    values!: [
      "top",
      "bottom",
      "start",
      "end"
    ],
    default: "end"
  )

  # inner API
  prop(on_close, :event, from_context: :on_close)

  def render(assigns) do
    ~F"""
    <div
      {=@id}
      data-animate_enter_class={animate_enter_class(@position)}
      data-animate_leave_class={animate_leave_class(@position)}
      class={merge([
        [
          "fixed w-full bg-gohan text-bulma shadow-moon-xl",
          "top-0 ": @position == "top",
          "bottom-0": @position == "bottom",
          "inset-y-0 ltr:left-0 rtl:right-0 w-5/6 max-w-md ": @position == "start",
          "inset-y-0 ltr:right-0 rtl:left-0 w-5/6 max-w-md ": @position == "end"
        ],
        @class
      ])}
      :on-click-away={@on_close}
      data-testid={@testid}
    >
      <#slot />
    </div>
    """
  end

  defp animate_enter_class(position) do
    case position do
      "top" -> "animate-drawer_enter_top"
      "bottom" -> "animate-drawer_enter_bottom"
      "start" -> "ltr:animate-drawer_enter_left rtl:animate-drawer_enter_right"
      "end" -> "ltr:animate-drawer_enter_right rtl:animate-drawer_enter_left"
    end
  end

  defp animate_leave_class(position) do
    case position do
      "top" -> "animate-drawer_leave_top"
      "bottom" -> "animate-drawer_leave_bottom"
      "start" -> "ltr:animate-drawer_leave_left rtl:animate-drawer_leave_right"
      "end" -> "ltr:animate-drawer_leave_right rtl:animate-drawer_leave_left"
    end
  end
end
