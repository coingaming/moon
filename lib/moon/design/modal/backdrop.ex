defmodule Moon.Design.Modal.Backdrop do
  @moduledoc false

  use Surface.Component, slot: "backdrop"

  import Moon.Helpers.MergeClass

  prop(class, :css_class)

  def render(assigns) do
    ~F"""
    <div class={merge(["fixed inset-0 bg-popo opacity-[.6]", @class])} />
    """
  end
end
