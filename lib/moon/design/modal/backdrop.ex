defmodule Moon.Design.Modal.Backdrop do
  @moduledoc false

  use Surface.Component, slot: "backdrop"

  prop(class, :css_class)

  def render(assigns) do
    ~F"""
    <div class={"fixed inset-0 bg-popo opacity-[.6]", @class} />
    """
  end
end
