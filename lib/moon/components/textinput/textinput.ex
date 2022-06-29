defmodule Moon.Components.TextInput do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.FieldLabel

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

  defp get_password_component(assigns) do
    ~F"""

    """
  end

  defp get_input_inner_label_component(assigns) do
    ~F"""

    """
  end

  defp get_text_input_basic_component(assigns) do
    ~F"""

    """
  end
end
