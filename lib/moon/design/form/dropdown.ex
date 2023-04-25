defmodule Moon.Design.Form.Dropdown do
  @moduledoc false

  use Moon.StatelessComponent

  alias Surface.Components.Dynamic.Component
  alias Surface.Components.Form
  alias Moon.Design.Dropdown
  alias Moon.Lego

  import Moon.Helpers.MakeList, only: [make_list: 1]
  import Moon.Helpers.Form, only: [has_error: 2]
  import Phoenix.HTML.Form, only: [input_id: 2]

  @doc "Name of the field, usually should be taken from context"
  prop(field, :atom, from_context: {Surface.Components.Form.Field, :field})
  @doc "Form info, usually should be taken from context"
  prop(form, :form, from_context: {Surface.Components.Form, :form})

  @doc "... format: [%{key: shown_label, value: option_value, disabled: bool}], diisabled is optional"
  prop(options, :generator, required: true)

  @doc "Selected option(s) value - do not use it inside the form, just for away-from-form components"
  prop(value, :any)
  @doc "Well, disabled"
  prop(disabled, :boolean)

  @doc "Common moon size property"
  prop(size, :string, values!: ~w(sm md lg), default: "md")
  @doc "additional classes for the <select> tag"
  prop(class, :css_class, from_context: :class)
  @doc "Some prompt to be shown on empty value"
  prop(prompt, :string)

  @doc "id to be given to the select tag"
  prop(id, :string)
  @doc "data-testid attribute value"
  prop(testid, :string)

  @doc "some additional styling will be set to indicate field is iinvalid. generally should be set by Form.Field component"
  prop(error, :boolean, from_context: :error)

  @doc "if field does support multiselect, `multiple` attribute for select tag in HTML terms"
  prop(is_multiple, :boolean)

  slot(option, generator_prop: :options)

  def render(assigns) do
    ~F"""
    <Dropdown id={"#{@id || input_id(@form, @field)}-dropdown"}>
      <Dropdown.Trigger>
        <Component
          module={(@is_multiple && Form.MultipleSelect) || Form.Select}
          class="hidden"
          {=@field}
          {=@id}
          options={options_with_selected(@options, @value)}
          opts={%{disabled: @disabled, "data-testid": @testid}}
        />
        <input
          class={merge([
            "focus:ring-0 border-0 py-0 px-4 m-0",
            "block w-full max-w-full appearance-none text-[1rem] text-bulma transition-shadow box-border before:box-border after:box-border",
            "relative z-[2] shadow-input hover:shadow-input-hov focus:shadow-input-focus focus:outline-none bg-gohan h-10",
            "placeholder:text-trunks placeholder:opacity-100 placeholder:transition-opacity placeholder:delay-75",
            "read-only:outline-0 read-only:border-none read-only:cursor-not-allowed read-only:hover:shadow-input read-only:focus:shadow-input",
            "moon-error:shadow-input-err moon-error:hover:shadow-input-err moon-error:focus:shadow-input-err",
            "invalid:shadow-input-err invalid:hover:shadow-input-err invalid:focus:shadow-input-err",
            [
              "leading-8 rounded-moon-i-xs": @size == "sm",
              "leading-10 rounded-moon-i-sm": @size == "md",
              "leading-[3rem] rounded-moon-i-sm": @size == "lg",
              "opacity-30": @disabled
            ],
            @class
          ])}
          type="text"
          placeholder={@prompt}
          value={make_value(@form, @field, @options)}
          {=@disabled}
          error={@error || has_error(@form, @field)}
          data-testid={@testid}
        />
      </Dropdown.Trigger>
      <Dropdown.Options>
        <#slot {@option} :for={option <- @options} generator_value={option}>
          <Dropdown.Option value={option[:value]} disabled={option[:disabled]}>
            <Lego.Checkbox :if={@is_multiple} />
            <Lego.Title>{option[:key]}</Lego.Title>
          </Dropdown.Option>
        </#slot>
      </Dropdown.Options>
    </Dropdown>
    """
  end

  defp make_value(_form, value, _options) do
    value
  end

  defp options_with_selected(options, value) do
    Enum.map(options, fn row ->
      [
        key: row[:key],
        value: row[:value],
        selected: Enum.member?(make_list(value), row[:value]),
        disabled: row[:disabled]
      ]
    end)
  end
end
