defmodule Moon.Design.Form.Addon.Btn do
  @moduledoc false

  use Moon.StatelessComponent, slot: "default"

  alias Moon.Design.Button

  prop(attrs, :map, default: %{})
  prop(class, :css_class, default: "absolute bottom-3 right-1")

  slot(default)

  def render(assigns) do
    ~F"""
    <Button {=@class} {...@attrs}><#slot /></Button>
    """
  end
end
