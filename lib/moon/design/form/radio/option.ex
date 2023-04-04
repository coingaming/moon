defmodule Moon.Design.Form.Radio.Option do
  @moduledoc false
  use Moon.StatelessComponent, slot: "option"

  alias Moon.Design.Form.Field.Label
  alias Surface.Components.Form.RadioButton

  prop(id, :string)
  prop(testid, :string)
  prop(class, :css_class)

  prop(field, :atom, from_context: {Surface.Components.Form.Field, :field})
  prop(form, :any, from_context: {Surface.Components.Form, :form})

  prop(on_click, :event, from_context: :on_click)
  prop(is_selected, :boolean, from_context: :is_selected)

  prop(value, :string)
  prop(disabled, :boolean)

  slot(default)

  def render(assigns) do
    ~F"""
    <Label
      {=@form}
      {=@field}
      {=@id}
      {=@testid}
      class={merge(["flex gap-2 pb-0", ["opacity-30": @disabled], @class])}
    >
      <RadioButton
        {=@field}
        {=@form}
        class="hidden"
        {=@value}
        opts={
          disabled: @disabled
        }
      />
      <#slot context_put={is_selected: @is_selected} />
    </Label>
    """
  end
end
