defmodule Moon.Design.Form.Input do
  @moduledoc false

  use Moon.StatelessComponent

  import Phoenix.HTML.Form
  import Moon.Helpers.Form

  prop(field, :atom, from_context: {Surface.Components.Form.Field, :field})
  prop(form, :form, from_context: {Surface.Components.Form, :form})

  prop(size, :string, values!: ["sm", "md", "lg"], default: "md")
  prop(error, :boolean, from_context: :error)

  prop(type, :string,
    values: [
      "date",
      "datetime-local",
      "email",
      "number",
      "password",
      "search",
      "tel",
      "text",
      "time",
      "url"
    ],
    default: "text"
  )

  prop(placeholder, :string, default: "")
  prop(class, :css_class, from_context: :class)
  prop(value, :string)
  prop(id, :string)
  prop(testid, :string)
  prop(disabled, :boolean)
  prop(readonly, :boolean)

  def render(assigns) do
    ~F"""
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
      {=@type}
      {=@placeholder}
      value={@value || input_value(@form, @field)}
      id={@id || input_id(@form, @field)}
      name={input_name(@form, @field)}
      {=@disabled}
      {=@readonly}
      error={@error || has_error(@form, @field)}
      data-testid={@testid}
    />
    """
  end
end
