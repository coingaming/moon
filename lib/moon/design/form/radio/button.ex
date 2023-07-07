defmodule Moon.Design.Form.Radio.Button do
  @moduledoc "Single component of the Radio, renders to a label"

  use Moon.StatelessComponent, slot: "option"

  alias Moon.Design.Form.Field.Label
  alias Moon.Design.Form.Radio.Indicator
  alias Surface.Components.Form.RadioButton

  import Phoenix.HTML.Form, only: [input_value: 2]

  @doc "Id to be given to the label tag"
  prop(id, :string)
  @doc "Data-testid attribute value"
  prop(testid, :string)
  @doc "Additional CSS classes for the label"
  prop(class, :css_class)
  @doc "Field name, surface-style"
  prop(field, :atom, from_context: {Surface.Components.Form.Field, :field})
  @doc "Form, surface-style"
  prop(form, :form, from_context: {Surface.Components.Form, :form})

  @doc "Making the radio selected, use it outside the form. In most cases is set by Radio component"
  prop(is_selected, :boolean, from_context: :is_selected)

  prop(on_click, :event, from_context: :on_click)
  prop(value, :string, from_context: :value)
  prop(disabled, :boolean, from_context: :disabled)

  @doc "Label to be shown when no default slot is given"
  prop(label, :string)
  @doc "Size of the label"
  prop(size, :string, values!: ~w(sm md lg), default: "md")
  @doc "Inner content - put label & <Indicator/> here"
  slot(default)

  def render(assigns) do
    ~F"""
    <Label
      {=@id}
      {=@testid}
      {=@value}
      {=@size}
      class={merge(["flex gap-2 p-0", ["opacity-60": @disabled], @class])}
      {=@on_click}
      attrs={role: "radio", "aria-checked": "#{is_selected(assigns)}"}
    >
      <RadioButton
        class="hidden"
        {=@value}
        opts={
          disabled: @disabled
        }
      />
      <#slot context_put={is_selected: @is_selected || is_selected(assigns)}>
        <Indicator is_selected={@is_selected || is_selected(assigns)} />
        {@label}
      </#slot>
    </Label>
    """
  end

  defp is_selected(%{value: value, form: form, field: field}) do
    "#{value}" == "#{input_value(form, field)}"
  end
end
