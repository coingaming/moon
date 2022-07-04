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

  prop is_sharp_left_side, :boolean
  prop is_sharp_right_side, :boolean
  prop is_sharp_top_side, :boolean
  prop is_sharp_bottom_side, :boolean
  prop is_top_bottom_border_hidden, :boolean
  prop is_side_border_hidden, :boolean

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
    <TextInputBasic
      disabled={@disabled}
      dir={@dir}
      label={@label}
      is_error={@is_error}
      size={@size}
      type={@type}
      is_sharp_left_side={@is_sharp_left_side}
      is_sharp_right_side={@is_sharp_right_side}
      is_sharp_top_side={@is_sharp_top_side}
      is_sharp_bottom_side={@is_sharp_bottom_side}
      is_top_bottom_border_hidden={@is_top_bottom_border_hidden}
      is_side_border_hidden={@is_side_border_hidden}
      is_first={@is_first}
    >
      <:hint_text_slot>
        <#slot name="hint_text_slot" />
      </:hint_text_slot>
    </TextInputBasic>
    """
  end
end
