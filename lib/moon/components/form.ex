defmodule Moon.Components.Form do
  @moduledoc false

  use Moon.StatelessComponent

  prop(for, :any)
  prop(change, :event)
  prop(submit, :event)
  prop(class, :string)
  prop(autocomplete, :string, default: "on", values: ["on", "off"])
  slot(default, args: [:form])

  def render(assigns) do
    ~F"""
    <Surface.Components.Form {=@for} {=@submit} {=@change} {=@class} opts={autocomplete: @autocomplete}>
      <#slot />
    </Surface.Components.Form>
    """
  end
end
