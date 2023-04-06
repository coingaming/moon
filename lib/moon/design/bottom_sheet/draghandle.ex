defmodule Moon.Design.BottomSheet.Draghandle do
  @moduledoc false

  use Moon.StatelessComponent, slot: "draghandle"

  prop(class, :css_class)

  prop(testid, :string)
  prop(id, :string)

  def render(assigns) do
    ~F"""
    <div
      {=@id}
      class={merge([
        "flex items-center justify-center",
        "absolute left-1/2 transform -translate-x-1/2",
        "my-2 w-10 h-1 rounded bg-beerus",
        @class
      ])}
      data-testid={@testid}
    />
    """
  end
end
