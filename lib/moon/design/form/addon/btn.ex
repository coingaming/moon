defmodule Moon.Design.Form.Addon.Btn do
  @moduledoc false

  use Moon.StatelessComponent, slot: "default"

  alias Moon.Design.Button

  prop(attrs, :map, default: %{})
  prop(class, :css_class, default: "absolute bottom-3 right-1")

  slot(default)

  def render(assigns) do
    ~F"""
    <div {=@class}>
      <Button {...@attrs}><#slot /></Button>
    </div>
    """
  end
end
