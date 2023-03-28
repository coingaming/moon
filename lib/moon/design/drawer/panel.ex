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
      "top" -> "animate-drawerentertop"
      "bottom" -> "animate-drawerenterbottom"
      "start" -> "ltr:animate-drawerenterleft rtl:animate-drawerenterright"
      "end" -> "ltr:animate-drawerenterright rtl:animate-drawerenterleft"
    end
  end

  defp animate_leave_class(position) do
    case position do
      "top" -> "animate-drawerleavetop"
      "bottom" -> "animate-drawerleavebottom"
      "start" -> "ltr:animate-drawerleaveleft rtl:ltr:animate-drawerleaveright"
      "end" -> "ltr:animate-drawerleaveright rtl:ltr:animate-drawerleaveleft"
    end
  end
end
