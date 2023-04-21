defmodule Moon.Design.Form.Select do
  @moduledoc false

  use Moon.StatelessComponent

  alias Surface.Components.Dynamic.Component
  alias Surface.Components.Form

  import Moon.Helpers.MakeList, only: [make_list: 1]

  @doc "Name of the field"
  prop(field, :atom)

  @doc "... format: [%{key: shown_label, value: option_value, disabled: bool}], diisabled is optional"
  prop(options, :list, default: [])
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

  @doc "if field does support multiselect, multiple attribute for select tag in HTML terms"
  prop(is_multiple, :boolean)

  def render(assigns) do
    ~F"""
    <Component
      module={(@is_multiple && Form.MultipleSelect) || Form.Select}
      class={merge([
        "text-trunks flex justify-between w-full bg-gohan border-0 duration-200 transition-shadow",
        "shadow-input hover:shadow-input-hov focus:shadow-input-focus focus:outline-none focus:ring-0",
        "items-start text-ellipsis whitespace-nowrap overflow-hidden",
        "moon-error:shadow-input-err moon-error:hover:shadow-input-err moon-error:focus:shadow-input-err",
        "invalid:shadow-input-err invalid:hover:shadow-input-err invalid:focus:shadow-input-err",
        [
          "py-0 px-4": !@is_multiple,
          "leading-8 rounded-moon-i-xs": @size == "sm",
          "leading-10 rounded-moon-i-sm": @size == "md",
          "leading-[3rem] rounded-moon-i-sm": @size == "lg",
          "cursor-not-allowed opacity-30": @disabled
        ],
        @class
      ])}
      {=@field}
      {=@id}
      options={options_with_selected(@options, @value)}
      opts={%{prompt: @prompt, disabled: @disabled, "data-testid": @testid, error: @error}}
    />
    """
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
