defmodule Moon.Design.Form.Addon do
  @moduledoc false

  use Moon.StatelessComponent, slot: "default"

  prop(class, :css_class, default: "absolute top-1 right-1")

  slot(default)

  def render(assigns) do
    ~F"""
    <div {=@class}>
      <#slot />
    </div>
    """
  end
end
