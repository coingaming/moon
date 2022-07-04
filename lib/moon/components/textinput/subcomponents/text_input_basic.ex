defmodule Moon.Components.TextInput.TextInputBasic do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.TextInput.Container
  alias Moon.Components.TextInput.Input
  alias Moon.Components.TextInput.HintText

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
  prop required, :boolean
  prop step, :string, default: "1"

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
    <Container disabled={@disabled}>
      <label
        dir={@dir}
        :if={@label}
        class={"block text-moon-16 text-bulma pb-2", "opacity-30 cursor-not-allowed": @disabled}
      >
        {@label}
      </label>
      <Input
        is_error={@is_error}
        size={@size}
        type={@type}
        is_rtl={@dir == "rtl"}
        with_label={@label}
        placeholder={@placeholder}
        required={@required}
        step={@step}
        is_sharp_left_side={@is_sharp_left_side}
        is_sharp_right_side={@is_sharp_right_side}
        is_sharp_top_side={@is_sharp_top_side}
        is_sharp_bottom_side={@is_sharp_bottom_side}
        is_top_bottom_border_hidden={@is_top_bottom_border_hidden}
        is_side_border_hidden={@is_side_border_hidden}
        is_first={@is_first}
      />
      <HintText :if={slot_assigned?(:hint_text_slot)}>
        <#slot name="hint_text_slot" />
      </HintText>
    </Container>
    """
  end
end
