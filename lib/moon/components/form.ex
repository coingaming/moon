defmodule Moon.Components.Form do
  use Moon.StatelessComponent

  prop(for, :any)
  prop(change, :event)
  prop(submit, :event)
  prop(class, :string)
  prop(autocomplete, :string, default: "on", values: ["on", "off"])
  slot(default, args: [:form])

  def render(assigns) do
    ~F"""
    <Surface.Components.Form
      {=@for}
      {=@change}
      {=@submit}
      opts={autocomplete: @autocomplete, class: @class}
    >
      <Context get={Surface.Components.Form, form: form}>
        <#slot :args={form: form} />
      </Context>
    </Surface.Components.Form>
    """
  end
end
