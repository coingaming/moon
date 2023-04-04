defmodule Moon.Design.Form.Radio.Option do
  @moduledoc false
  use Moon.StatelessComponent, slot: "option"

  alias Moon.Design.Form.Field.Label

  prop(id, :string)
  prop(testid, :string)
  prop(class, :css_class)

  prop(field, :atom, from_context: {Surface.Components.Form.Field, :field})
  prop(form, :form, from_context: {Surface.Components.Form, :form})

  prop(on_click, :event, from_context: :on_click)
  prop(is_selected, :boolean, from_context: :is_selected)

  slot(default)

  def render(assigns) do
    ~F"""
    <Label {=@form} {=@field} {=@id} {=@testid} class={merge(["flex gap-2", @class])} :on-click={@on_click || on_click()}>
      <#slot/>
    </Label>
    """
  end

  defp on_click() do

  end
end
