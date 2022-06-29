defmodule Moon.Components.TextInput.TextInputBasic do
  @moduledoc false

  use Moon.StatelessComponent

  prop id, :string
  prop inputSize, :string, values: ["md", "lg", "xl"]

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
  prop dir, :string, value: ["ltf", "rtl"]
  prop background_color, :string, values: Moon.colors()
  prop is_first, :boolean

  slot label_slot
  slot hint_text_slot
  slot show_password_text

  def render(assigns) do
    ~F"""

    """
  end
end
