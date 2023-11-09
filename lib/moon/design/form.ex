defmodule Moon.Design.Form do
  @moduledoc false

  use Moon.StatelessComponent

  import Moon.Helpers.Form, only: [transfor: 1]

  prop(id, :string)
  prop(testid, :string)
  prop(for, :any)
  prop(change, :event)
  prop(submit, :event)
  prop(class, :string)
  prop(autocomplete, :string, default: "on", values: ["on", "off"])
  prop(target, :any)
  prop(trigger_action, :any)
  prop(is_horizontal, :boolean, default: false)
  slot(default)

  def render(assigns) do
    ~F"""
    <Surface.Components.Form
      for={transfor(@for)}
      {=@submit}
      {=@change}
      {=@class}
      {=@trigger_action}
      opts={autocomplete: @autocomplete, id: @id, "data-testid": @testid, "phx-target": @target}
    >
      <#slot context_put={is_horizontal: @is_horizontal} />
    </Surface.Components.Form>
    """
  end
end
