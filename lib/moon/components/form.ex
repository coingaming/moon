defmodule Moon.Components.Form do
  @moduledoc false

  use Moon.StatelessComponent

  prop(id, :string)
  prop(test_id, :string)
  prop(for, :any)
  prop(change, :event)
  prop(submit, :event)
  prop(class, :string)
  prop(autocomplete, :string, default: "on", values: ["on", "off"])
  prop(target, :any)
  slot(default)

  def render(assigns) do
    ~F"""
    <Surface.Components.Form
      {=@for}
      {=@submit}
      {=@change}
      {=@class}
      opts={autocomplete: @autocomplete, id: @id, "data-test-id": @test_id, "phx-target": @target}
    >
      <#slot />
    </Surface.Components.Form>
    """
  end
end
