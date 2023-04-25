defmodule Moon.Design.Form.Checkbox do
  @moduledoc "Checkbox to be rendered on form. Label is the root component"

  use Moon.StatelessComponent

  alias Moon.Lego.Checkbox
  alias Moon.Design.Form.Field.Label
  import Moon.Helpers.Form, only: [value_is_true: 2]

  @doc "Field name, surface-style"
  prop(field, :atom, from_context: {Surface.Components.Form.Field, :field})
  @doc "Form, surface-style"
  prop(form, :form, from_context: {Surface.Components.Form, :form})
  @doc "label to be shown to user"
  prop(label, :string)
  @doc "if the field is disabled"
  prop(disabled, :boolean)
  @doc "if the field is read-only"
  prop(readonly, :boolean)

  @doc "id to be given to the HTML tag"
  prop(id, :string)
  @doc "data-testid attribute value"
  prop(testid, :string)

  @doc "class to be given to the visible checkbox"
  prop(class, :string)
  @doc "on_click event for the checkbox"
  prop(on_click, :event)

  @doc "The value to be sent when the checkbox is checked. Defaults to \"true\""
  prop(checked_value, :any, default: true)

  @doc "Controls if this function will generate a hidden input to submit the unchecked value or not, defaults to \"true\"."
  prop(hidden_input, :boolean, default: true)

  @doc "The value to be sent when the checkbox is unchecked, defaults to \"false\"."
  prop(unchecked_value, :any, default: false)

  def render(assigns) do
    ~F"""
    <Label
      size="sm"
      class={
        "relative inline-flex items-center select-none",
        "opacity-disabled": @disabled,
        "cursor-not-allowed select-none": @readonly || @disabled
      }
      {=@field}
      {=@form}
    >
      <Surface.Components.Form.Checkbox
        {=@field}
        {=@form}
        {=@id}
        {=@checked_value}
        {=@unchecked_value}
        {=@hidden_input}
        click={(!@readonly && !@disabled && @on_click) || nil}
        class="opacity-0"
        opts={disabled: @disabled || @readonly, readonly: @readonly, "data-testid": @testid}
      />
      <Checkbox
        is_selected={value_is_true(@form, @field)}
        class={merge([
          "absolute top-1 ltr:left-0 rtl:right-0",
          @class
        ])}
      />
      {@label}
    </Label>
    """
  end
end
