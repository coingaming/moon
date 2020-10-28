defmodule Moon.Components.TextInput do
  use Moon.StatelessComponent

  import Moon.Utils.Rem

  alias Surface.Components.Form.TextInput
  alias Moon.Components.Label

  prop(field, :atom)
  prop(label, :string)

  prop(type, :string,
    default: "text",
    values: [
      "date",
      "datetime-local",
      "email",
      "number",
      "password",
      "search",
      "tel",
      "text",
      "url",
      "time",
      "url"
    ]
  )

  prop(value, :string)
  prop(placeholder, :string)
  prop(error, :string)
  prop(rounded, :boolean)
  prop(disabled, :boolean)
  prop(required, :boolean)
  prop(icon, :any)


  def render(assigns) do
    ~H"""
    <Context get={{ theme: theme }}>
      <TextInput class="moon-text-input" field={{ @field }} opts={{ [placeholder: @placeholder]}} value={{ @value }} :if={{ !@label }} />

      <Label text={{ @label }} :if={{ @label }}>
        <TextInput class="moon-text-input" field={{ @field }} opts={{ [placeholder: @placeholder]}} value={{ @value }} />
      </Label>
    </Context>
    """
  end
end
