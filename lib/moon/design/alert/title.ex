defmodule Moon.Design.Alert.Title do
  @moduledoc false

  use Moon.StatelessComponent, slot: "title"

  prop(class, :css_class)

  slot(default)

  def render(assigns) do
    ~F"""
    <h6 class={merge(["flex gap-3 font-medium", @class])}>
      <#slot />
    </h6>
    """
  end
end
