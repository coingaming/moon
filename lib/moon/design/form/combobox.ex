defmodule Moon.Design.Form.Combobox do
  @moduledoc "Fully customized select component for the forms with input for filtering"

  use Moon.StatelessComponent

  alias Surface.Components.Form
  alias Moon.Design.Dropdown
  alias Moon.Design.Form.Checkbox
  alias Moon.Design.Form.Radio

  import Moon.Helpers.Form

  @doc "Name of the field, usually should be taken from context"
  prop(field, :atom, from_context: {Form.Field, :field})
  @doc "Form info, usually should be taken from context"
  prop(form, :form, from_context: {Form, :form})

  @doc "... format: [%{key: shown_label, value: option_value, disabled: bool}], diisabled is optional"
  prop(options, :list, required: true)

  @doc "Selected option(s) value - do not use it inside the form, just for away-from-form components"
  prop(value, :any)
  @doc "HTML disabled attribute for the input & some additional classes"
  prop(disabled, :boolean)

  @doc "Common moon size property"
  prop(size, :string, values!: ~w(sm md lg), default: "md")
  @doc "Additional classes for the <select> tag"
  prop(class, :css_class, from_context: :class)
  @doc "Some prompt to be shown on empty value"
  prop(prompt, :string)

  @doc "Id to be given to the select tag"
  prop(id, :string)
  @doc "Data-testid attribute value"
  prop(testid, :string)

  @doc "Some additional styling will be set to indicate field is invalid"
  prop(error, :boolean, from_context: :error)

  @doc "If field does support multiselect, `multiple` attribute for select tag in HTML terms"
  prop(is_multiple, :boolean)

  @doc "Should dropdown be open"
  prop(is_open, :boolean)

  @doc "Option for custom stylings - use it to show icons or anything else"
  slot(default)

  @doc "Trigger element for the dropdown, default is Dropdown.Select"
  slot(trigger)

  @doc "On key up event for the input - use it for filter options outside the form"
  prop(on_keyup, :event)

  @doc "Filtering value for the options"
  prop(filter, :string)

  @doc "Slot used for rendering single option. option[:key] will be used if not given"
  slot(option)

  def render(assigns) do
    ~F"""
    <Dropdown id={dropdown_id(assigns)} {=@is_open} hook="Combobox">
      <:trigger :let={is_open: is_open}>
        <#slot {@trigger, is_open: is_open} context_put={on_keyup: @on_keyup}>
          <Dropdown.Input
            placeholder={@prompt}
            {=@size}
            {=is_open}
            {=@error}
            {=@disabled}
            {=@on_keyup}
            badge={select_badge(assigns)}
            value={(select_value(assigns) && select_value(assigns)[:key]) || @filter}
          />
        </#slot>
      </:trigger>
      <#slot {@default}>
        <Dropdown.Options>
          <Dropdown.Option :for={option <- @options} {=@size}>
            <Checkbox
              checked_value={option[:value]}
              :if={@is_multiple}
              disabled={option[:disabled]}
              {=@size}
              hidden_input={false}
              is_multiple
            >
              <#slot {@option, option: option}>{option[:key]}</#slot>
            </Checkbox>
            <Radio.Button value={option[:value]} :if={!@is_multiple} disabled={option[:disabled]} {=@size}>
              <Radio.Indicator class="hidden" />
              <#slot {@option, option: option}>{option[:key]}</#slot>
            </Radio.Button>
          </Dropdown.Option>
        </Dropdown.Options>
      </#slot>
    </Dropdown>
    """
  end

  @doc """
  Default filtering function - just filter option[:key] to start with filter regardless case
  Use own function if you need other filtering mechanisms or additional DB requests
  """
  def filter_options(options, filter) do
    import String
    Enum.filter(options, &starts_with?(downcase(&1[:key]), downcase(filter)))
  end
end
