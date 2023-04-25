defmodule Moon.Design.Form.Radio.Button do
  @moduledoc "Single component of the Radio"

  use Moon.StatelessComponent, slot: "option"

  alias Moon.Design.Form.Field.Label
  alias Moon.Design.Form.Radio.Indicator
  alias Surface.Components.Form.RadioButton

  @doc "id to be given to the select tag"
  prop(id, :string)
  @doc "data-testid attribute value"
  prop(testid, :string)
  @doc "Additional CSS classes for the"
  prop(class, :css_class)

  prop(on_click, :event, from_context: :on_click)
  prop(is_selected, :boolean, from_context: :is_selected)
  prop(value, :string, from_context: :value)
  prop(disabled, :boolean, from_context: :disabled)

  @doc "Label to be shown when no default slot is given"
  prop(label, :string)
  @doc "Inner content - put label here"
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
      <#slot context_put={is_selected: @is_selected}>
        <Indicator {=@is_selected} />
        {@label}
      </#slot>
    </Label>
    """
  end
end
