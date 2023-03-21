defmodule Moon.Design.Form.Input do
  @moduledoc false

  use Moon.StatelessComponent

  import Phoenix.HTML.Form, only: [input_value: 2]

  prop(field, :atom, from_context: {Surface.Components.Form.Field, :field})
  data(form, :form, from_context: {Surface.Components.Form, :form})

  prop(size, :string, values!: ["sm", "md", "lg"], default: "md")

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
  prop(class, :css_class)
  prop(value, :string)
  prop(test_id, :string)
  prop(id, :string)
  prop(disabled, :boolean)
  prop(readonly, :boolean)

  def render(assigns) do
    ~F"""
    <input
      class={merge([
        "focus:ring-0 border-0 py-0 px-4 m-0",
        "block w-full max-w-full appearance-none text-[1rem] text-bulma transition-shadow box-border",
        "relative z-[2] shadow-input hover:shadow-input-hov focus:shadow-input-focus focus:outline-none bg-gohan h-10",
        "before:box-border after:box-border placeholder:text-trunks placeholder:opacity-100 placeholder:transition-opacity",
        "placeholder:delay-75 read-only:outline-0 read-only:border-none read-only:cursor-not-allowed read-only:hover:shadow-input",
        "read-only:focus:shadow-input invalid:shadow-input-err invalid:hover:shadow-input-err invalid:focus:shadow-input-err",
        [
          "h-8 leading-8 rounded-moon-i-xs": @size == "sm",
          "h-10 leading-10 rounded-moon-i-sm": @size == "md",
          "h-12 leading-[3rem] rounded-moon-i-sm": @size == "lg",
          "opacity-30": @disabled
        ],
        @class
      ])}
      {=@type}
      {=@placeholder}
      value={@value || input_value(@form, @field)}
      {=@id}
      {=@disabled}
      {=@readonly}
      data-test_id={@test_id}
    />
    """
  end
end
