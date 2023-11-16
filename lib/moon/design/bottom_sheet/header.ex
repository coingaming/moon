defmodule Moon.Design.BottomSheet.Header do
  @moduledoc false

  use Moon.StatelessComponent, slot: "header"

  @doc "Tailwind classes for customization"
  prop(class, :css_class)

  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)

  @doc "Id attribute for DOM element"
  prop(id, :string)

  @doc "Draghandle of BottomSheet, see BottomSheet.Draghandle"
  slot(drag_handle)

  @doc "Content of BottomSheet.Header"
  slot(default)

  def render(assigns) do
    ~F"""
    <div
      {=@id}
      class={merge([
        [
          "sticky top-0 z-10 bg-goku pt-1",
          "min-h-[48px]": slot_assigned?(:drag_handle)
        ],
        @class
      ])}
      data-testid={@testid}
    >
      <#slot {@drag_handle} />
      <#slot />
    </div>
    """
  end
end
