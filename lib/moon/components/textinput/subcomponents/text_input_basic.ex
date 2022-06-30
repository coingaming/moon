defmodule Moon.Components.TextInput.TextInputBasic do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.TextInput.Container
  alias Moon.Components.TextInput.Input

  prop id, :string
  prop size, :string, values: ["md", "lg", "xl"]

  prop type, :string,
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
    ]

  prop placeholder, :string
  prop is_error, :boolean
  prop dir, :string, values: ["ltr", "rtl"], default: "ltr"
  prop background_color, :string, values: Moon.colors()
  prop is_first, :boolean
  prop disabled, :boolean
  prop label, :string

  slot hint_text_slot
  slot show_password_text

  def render(assigns) do
    ~F"""
    <Container disabled={@disabled}>
      <label dir={@dir} :if={@label} class={"block text-moon-16 text-bulma pb-2",  "opacity-30 cursor-not-allowed": @disabled}>
        {@label}
      </label>
      <Input is_error={@is_error} size={@size}/>
    </Container>
    """
  end
end
