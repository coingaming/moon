defmodule Moon.Components.Form do
  @moduledoc false

  use Moon.StatelessComponent

  prop(id, :string)
  prop(for, :any)
  prop(change, :event)
  prop(submit, :event)
  prop(class, :string)
  prop(autocomplete, :string, default: "on", values: ["on", "off"])
  slot(default)

  def render(assigns) do
    ~F"""
    <Surface.Components.Form
      {=@id}
      {=@for}
      {=@submit}
      {=@change}
      {=@class}
      opts={autocomplete: @autocomplete}
    >
      <#slot />
    </Surface.Components.Form>
    """
  end
end
