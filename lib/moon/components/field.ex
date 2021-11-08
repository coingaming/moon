defmodule Moon.Components.Field do
  @moduledoc false

  use Moon.StatelessComponent

  prop(name, :string)
  slot(default)

  def render(assigns) do
    ~F"""
    <Surface.Components.Form.Field {=@name}>
      <#slot />
      <Surface.Components.Form.ErrorTag  />
    </Surface.Components.Form.Field>
    """
  end
end
