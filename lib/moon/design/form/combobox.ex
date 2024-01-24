defmodule Moon.Design.Form.Combobox do
  @moduledoc "Fully customized select component for the forms with input for filtering"

  use Moon.StatelessComponent

  alias Surface.Components.Form
  alias Moon.Design.Dropdown
  alias Moon.Design.Form.Checkbox
  alias Moon.Design.Form.Radio
  alias Moon.Icon
  alias Moon.Design.Dropdown.Badge

  import Moon.Helpers.Form
  import Enum, only: [map: 2, filter: 2, member?: 2]

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

  @doc "Keyword | Map of additional attributes for the input"
  prop(attrs, :any, default: %{})

  @doc "Option for custom stylings - use it to show icons or anything else"
  slot(default)

  @doc "Trigger element for the dropdown, default is Dropdown.Select"
  slot(trigger)

  @doc "On key up event for the input - use it for filter options outside the form"
  prop(on_keyup, :event)

  @doc "Filtering value for the options"
  prop(filter, :string)

  @doc "Label for the not found option"
  prop(not_found_label, :string, default: "Nothing found.")

  @doc "Slot used for rendering single option. option[:key] will be used if not given"
  slot(option)

  defp hidden_selected_values(%{is_multiple: true, form: form, field: field, options: options}) do
    option_values = options |> map(& &1[:value])
    (form[field].value || []) |> filter(&(!member?(option_values, &1)))
  end

  defp hidden_selected_values(%{form: form, field: field, options: options}) do
    (form[field].value in map(options, & &1[:value]) && nil) || form[field].value
  end

  def render(assigns) do
    ~F"""
    <Dropdown id={dropdown_id(assigns)} {=@is_open} hook="Combobox" {=@testid} {=@class}>
      <:trigger :let={is_open: is_open, on_trigger: on_trigger}>
        <#slot {@trigger, is_open: is_open, on_trigger: on_trigger} context_put={on_keyup: @on_keyup}>
          <Dropdown.Input
            placeholder={@prompt}
            {=@attrs}
            {=@size}
            {=is_open}
            {=@error}
            {=@disabled}
            {=@on_keyup}
            value={(select_value(assigns) && select_value(assigns)[:key]) || @filter}
            class={
              input_classes(assigns) ++
                input_size_classes(assigns) ++
                ["ps-11": select_badge(assigns) && @size == "sm"],
              ["ps-[3.25rem]": select_badge(assigns) && @size == "md"],
              ["ps-14": select_badge(assigns) && @size == "lg"]
            }
          >
            <Icon
              name="controls_chevron_down"
              class={
                "transition-200 transition-transform cursor-pointer text-trunks text-moon-16",
                "absolute ltr:right-4 rtl:left-4 top-1/2 -translate-y-1/2 z-[3]",
                "rotate-180": is_open
              }
              click={on_trigger}
            />
            <Badge
              :if={select_badge(assigns)}
              {=@size}
              count={select_badge(assigns)}
              class={
                "absolute top-1/2 -translate-y-1/2 z-[3]",
                "rtl:right-2 ltr:left-2": @size in ~w(sm md),
                "rtl:right-3 ltr:left-3": @size == "lg"
              }
            />
          </Dropdown.Input>
        </#slot>
      </:trigger>
      <#slot {@default}>
        <Dropdown.Options>
          {#if @is_multiple}
            <Surface.Components.Form.HiddenInput
              :for={value <- hidden_selected_values(assigns)}
              name={"#{@form[@field].name}[]"}
              {=value}
              class="hidden"
            />
          {#else}
            <Surface.Components.Form.HiddenInput
              :if={hidden_selected_values(assigns)}
              name={"#{@form[@field].name}"}
              value={hidden_selected_values(assigns)}
              class="hidden"
            />
          {/if}
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
              <#slot {@option, option: option}>
                <Radio.Indicator class="hidden" />
                {option[:key]}
              </#slot>
            </Radio.Button>
          </Dropdown.Option>
          {#if @filter && @options == [] && @not_found_label != ""}
            <Moon.Design.Form.Combobox.NoResults {=@not_found_label} />
          {/if}
        </Dropdown.Options>
      </#slot>
    </Dropdown>
    """
  end
end
