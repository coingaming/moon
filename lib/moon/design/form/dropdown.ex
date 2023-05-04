defmodule Moon.Design.Form.Dropdown do
  @moduledoc "Fully styled select component for the forms"

  use Moon.StatelessComponent

  alias Surface.Components.Form
  alias Moon.Design.Dropdown

  alias Moon.Design.Form.Checkbox
  alias Moon.Design.Form.Radio

  @doc "Name of the field, usually should be taken from context"
  prop(field, :atom, from_context: {Form.Field, :field})
  @doc "Form info, usually should be taken from context"
  prop(form, :form, from_context: {Form, :form})

  @doc "... format: [%{key: shown_label, value: option_value, disabled: bool}], diisabled is optional"
  prop(options, :list, required: true)

  @doc "Selected option(s) value - do not use it inside the form, just for away-from-form components"
  prop(value, :any)
  @doc "Well, disabled"
  prop(disabled, :boolean)

  @doc "Common moon size property"
  prop(size, :string, values!: ~w(sm md lg), default: "md")
  @doc "Additional classes for the <select> tag"
  prop(class, :css_class, from_context: :class)
  @doc "Some prompt to be shown on empty value"
  prop(prompt, :string, default: "...")

  @doc "Id to be given to the select tag"
  prop(id, :string)
  @doc "Data-testid attribute value"
  prop(testid, :string)

  @doc "Some additional styling will be set to indicate field is iinvalid"
  prop(error, :boolean, from_context: :error)

  @doc "If field does support multiselect, `multiple` attribute for select tag in HTML terms"
  prop(is_multiple, :boolean)

  @doc "Should dropdown be open"
  prop(is_open, :boolean)

  @doc "Option for custom stylings - use it to show icons or anything else"
  slot(default)

  @doc "Trigger element for the dropdown, default is Dropdown.Select"
  slot(trigger)

  def render(assigns) do
    ~F"""
    <Dropdown id={dropdown_id(assigns)} {=@is_open}>
      <:trigger :let={is_open: is_open}>
        <#slot {@trigger, is_open: is_open}>
          <Dropdown.Select
            {=@prompt}
            {=@size}
            {=is_open}
            {=@error}
            {=@disabled}
            value={select_value(assigns)}
            badge={select_badge(assigns)}
          />
        </#slot>
      </:trigger>
      <#slot {@default}>
        <Dropdown.Options on_change={option_click()}>
          <Dropdown.Option :for={option <- @options} {=@size}>
            <Checkbox
              checked_value={option[:value]}
              :if={@is_multiple}
              label={option[:key]}
              disabled={option[:disabled]}
              {=@size}
              hidden_input={false}
              is_multiple
            />
            <Radio.Button
              value={option[:value]}
              :if={!@is_multiple}
              label={option[:key]}
              disabled={option[:disabled]}
              {=@size}
            />
          </Dropdown.Option>
        </Dropdown.Options>
      </#slot>
    </Dropdown>
    """
  end

  defp dropdown_id(%{form: form, field: field, id: id}), do: "#{id || form[field].id}-dropdown"

  defp option_click(), do: Phoenix.LiveView.JS.dispatch("moon-empty-event")

  defp select_value(%{is_multiple: true}), do: nil

  defp select_value(%{form: form, field: field, options: options}) do
    (options |> Enum.find(&(&1[:value] == form[field].value)))[:key]
  end

  defp select_badge(%{is_multiple: true, form: form, field: field}),
    do:
      (form[field].value && Enum.count(form[field].value) > 0 && Enum.count(form[field].value)) ||
        nil

  defp select_badge(_), do: nil
end
