defmodule Moon.Components.Field do
  @moduledoc false

  use Moon.StatelessComponent

  prop(name, :string)
  prop(class, :css_class)
  slot(default)

  def render(assigns) do
    ~F"""
    <Surface.Components.Form.Field {=@name} {=@class}>
      <#slot />
    </Surface.Components.Form.Field>
    """
  end
end
