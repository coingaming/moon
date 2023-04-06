defmodule Moon.Design.BottomSheet.Backdrop do
  @moduledoc false

  use Moon.StatelessComponent, slot: "backdrop"

  alias Moon.Design.Modal.Backdrop

  prop(class, :css_class)

  prop(testid, :string)
  prop(id, :string)

  def render(assigns) do
    ~F"""
    <Backdrop {=@id} class={@class} testid={@testid} />
    """
  end
end
