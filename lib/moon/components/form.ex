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
    <.form :let={form} {=@for} {=@submit} {=@change} {=@class} {=@autocomplete}>
      <Context put={__MODULE__, form: form}>
        <#slot :args={form: form} />
      </Context>
    </.form>
    """
  end
end
