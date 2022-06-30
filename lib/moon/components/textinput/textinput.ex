defmodule Moon.Components.TextInput2 do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.FieldLabel
  alias Moon.Components.TextInput.TextInputBasic

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

  slot label_slot
  slot hint_text_slot
  slot show_password_text

  def render(assigns) do
    ~F"""
    {get_text_input_basic_component(assigns)}
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
    <TextInputBasic />
    """
  end
end
