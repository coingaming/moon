defmodule Moon.Design.Drawer.Panel do
  @moduledoc false

  # TODO
  # Add "drawer leave" animations.

  use Moon.StatelessComponent, slot: "panel"

  alias Phoenix.LiveView.JS

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
      :on-click={JS.dispatch("moon:close-drawer", detail: %{drawer_panel_id: "#{@id}-panel"})}
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
      "start" -> "animate-drawerenterleft"
      "end" -> "animate-drawerenterright"
    end
  end

  defp animate_leave_class(position) do
    case position do
      "top" -> "animate-drawerleavetop"
      "bottom" -> "animate-drawerleavebottom"
      "start" -> "animate-drawerleaveleft"
      "end" -> "animate-drawerleaveright"
    end
  end
end
