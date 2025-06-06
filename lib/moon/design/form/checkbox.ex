defmodule Moon.Design.Form.Checkbox do
  @moduledoc "Checkbox to be rendered on form. Label is the root component. For rebdering outside the from please use Moon.Lego.Checkbox"

  use Moon.StatelessComponent

  alias Moon.Lego.Checkbox
  alias Moon.Design.Form.Field.Label

  @doc "Field name, surface-style"
  prop(field, :atom, from_context: {Surface.Components.Form.Field, :field})
  @doc "Form, surface-style"
  prop(form, :form, from_context: {Surface.Components.Form, :form})
  @doc "Label to be shown to user"
  prop(label, :string)
  @doc "If the field is disabled"
  prop(disabled, :boolean)
  @doc "If the field is read-only"
  prop(readonly, :boolean)

  @doc "Id to be given to the HTML tag"
  prop(id, :string)
  @doc "Data-testid attribute value"
  prop(testid, :string)

  @doc "Class to be given to the visible checkbox"
  prop(class, :css_class)

  @doc "Additional Tailwind classes for checkbox label"
  prop(checkbox_label_class, :css_class)

  @doc "On_click event for the checkbox"
  prop(on_click, :event)

  @doc "The value to be sent when the checkbox is checked. Defaults to \"true\""
  prop(checked_value, :any, default: true)

  @doc "Controls if this function will generate a hidden input to submit the unchecked value or not, defaults to \"true\"."
  prop(hidden_input, :boolean, default: true)

  @doc "The value to be sent when the checkbox is unchecked, defaults to \"false\"."
  prop(unchecked_value, :any, default: false)

  @doc "Adding [] to the field name for support multiple checkboxes with the same name"
  prop(is_multiple, :boolean)

  @doc "Size of the label"
  prop(size, :string, values!: ~w(sm md lg), default: "md")

  @doc "Inner content - put label here"
  slot(default)

  def render(assigns) do
    ~F"""
    <Label
      {=@size}
      class={merge([
        [
          "relative inline-flex items-center select-none font-normal",
          "opacity-disabled": @disabled,
          "cursor-not-allowed select-none": @readonly || @disabled
        ],
        get_config(:default_label_class),
        @checkbox_label_class
      ])}
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
        opts={[
          disabled: @disabled || @readonly,
          readonly: @readonly,
          "data-testid": @testid
        ] ++ maybe_multiple_opts(assigns)}
      />
      <Checkbox
        is_selected={is_selected(assigns)}
        class={merge([
          "absolute start-0",
          get_config(:default_class),
          @class
        ])}
      />
      <#slot>{@label}</#slot>
    </Label>
    """
  end

  defp is_selected(%{form: form, field: field, checked_value: checked_value, is_multiple: true}) do
    checked_value in (form[field].value || [])
  end

  defp is_selected(%{form: form, field: field, checked_value: checked_value}) do
    "#{checked_value}" === "#{form[field].value}"
  end

  defp maybe_multiple_opts(assigns = %{form: form, field: field, is_multiple: true}),
    do: [name: form[field].name <> "[]", checked: is_selected(assigns)]

  defp maybe_multiple_opts(_), do: []
end
