defmodule Moon.Design.Drawer.Backdrop do
  @moduledoc false

  use Moon.StatelessComponent, slot: "backdrop"

  prop(class, :css_class)

  prop(testid, :string)
  prop(id, :string)

  def render(assigns) do
    ~F"""
    <div {=@id} class={merge(["fixed inset-0 bg-zeno", @class])} data-testid={@testid} />
    """
  end
end
