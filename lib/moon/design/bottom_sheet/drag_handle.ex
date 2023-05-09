defmodule Moon.Design.BottomSheet.DragHandle do
  @moduledoc false

  use Moon.StatelessComponent, slot: "drag_handle"

  @doc "Tailwind classes for customization"
  prop(class, :css_class)

  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)

  @doc "Id attribute for DOM element"
  prop(id, :string)

  def render(assigns) do
    ~F"""
    <div
      {=@id}
      class={merge([
        "flex items-center justify-center",
        "absolute left-1/2 transform -translate-x-1/2",
        "w-10 h-1 rounded bg-beerus",
        "moon-drag-handle",
        @class
      ])}
      data-testid={@testid}
    />
    """
  end
end
