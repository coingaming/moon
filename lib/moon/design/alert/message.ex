defmodule Moon.Design.Alert.Message do
  @moduledoc false

  use Moon.StatelessComponent, slot: "message"

  prop(class, :css_class)

  slot(default)

  def render(assigns) do
    ~F"""
    <p class={merge(["flex gap-3", @class])}>
      <#slot />
    </p>
    """
  end
end
