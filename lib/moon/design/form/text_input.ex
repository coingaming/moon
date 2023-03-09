defmodule Moon.Design.Form.TextInput do
  @moduledoc false

  use Moon.StatelessComponent

  prop(field, :atom, from_context: {Surface.Components.Form.Field, :field})
  data(form, :form, from_context: {Surface.Components.Form, :form})

  prop(size, :string, values!: ["sm", "md", "lg", "xl"], default: "md")

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
        "leading-10 rounded-moon-i-xs hover:rounded-moon-i-xs focus:rounded-moon-i-xs invalid:rounded-moon-i-xs",
        "before:box-border after:box-border placeholder:text-trunks placeholder:opacity-100 placeholder:transition-opacity",
        "placeholder:delay-75 read-only:outline-0 read-only:border-none read-only:cursor-not-allowed read-only:hover:shadow-input",
        "read-only:focus:shadow-input invalid:shadow-input-err invalid:hover:shadow-input-err invalid:focus:shadow-input-err",
        [
          "h-8": @size == "sm",
          "h-10": @size == "md",
          "h-12": @size == "lg",
          "h-14": @size == "xl",
          "opacity-30": @disabled
        ],
        @class
      ])}
      {=@type}
      {=@placeholder}
      {=@value}
      {=@id}
      {=@disabled}
      {=@readonly}
      data-test_id={@test_id}
    />
    """
  end
end
