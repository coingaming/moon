defmodule Moon.Design.Drawer.Backdrop do
  @moduledoc false

  use Moon.StatelessComponent, slot: "backdrop"

  prop(class, :css_class)

  def render(assigns) do
    ~F"""
    <div class={merge(["fixed inset-0 bg-zeno animate-backdropenter", @class])} />
    """
  end
end
