defmodule Moon.Design.Form.Radio.Option do
  @moduledoc false
  use Moon.StatelessComponent, slot: "option"

  alias Moon.Design.Form.Field.Label
  alias Surface.Components.Form.RadioButton

  prop(id, :string)
  prop(testid, :string)
  prop(class, :css_class)

  prop(on_click, :event, from_context: :on_click)
  prop(is_selected, :boolean, from_context: :is_selected)

  prop(value, :string, from_context: :value)
  prop(disabled, :boolean, from_context: :disabled)

  slot(default)

  def render(assigns) do
    ~F"""
    <Label
      {=@id}
      {=@testid}
      {=@value}
      class={merge(["flex gap-2 p-0", ["opacity-30": @disabled], @class])}
      {=@on_click}
      attrs={role: "radio", "aria-checked": "#{@is_selected}"}
    >
      <RadioButton
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
