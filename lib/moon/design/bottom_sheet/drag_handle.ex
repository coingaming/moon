defmodule Moon.Design.BottomSheet.DragHandle do
  @moduledoc false

  use Moon.StatelessComponent, slot: "drag_handle"

  @doc "Tailwind classes for customization"
  prop(class, :css_class)

  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)

  @doc "Id attribute for DOM element"
  prop(id, :string)

  @doc """
  Experimental: makes BottomSheet behave as Modal on some screen widths,
  please reffer to https://tailwindcss.com/docs/screens
  In most cases got from context
  """
  prop(as_modal_on, :string, values: ~w(sm md lg xl 2xl), from_context: :as_modal_on)

  def render(assigns) do
    ~F"""
    <div
      {=@id}
      class={merge([
        "flex items-center justify-center",
        "absolute left-1/2 transform -translate-x-1/2",
        "w-10 h-1 rounded bg-beerus",
        "moon-drag-handle",
        ["#{@as_modal_on}:hidden": !!@as_modal_on],
        @class
      ])}
      data-testid={@testid}
    />
    """
  end
end
