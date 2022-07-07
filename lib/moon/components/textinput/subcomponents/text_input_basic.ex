defmodule Moon.Components.TextInput.TextInputBasic do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.TextInput.Container
  alias Moon.Components.TextInput.Input
  alias Moon.Components.TextInput.HintText

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
    ],
    default: "text"

  prop id, :string
  prop size, :string, values: ["md", "lg", "xl"]
  prop placeholder, :string
  prop is_error, :boolean
  prop dir, :string, values: ["ltr", "rtl"], default: "ltr"
  prop background_color, :string, values: Moon.colors(), default: "gohan-100"
  prop is_first, :boolean
  prop disabled, :boolean
  prop label, :string
  prop required, :boolean
  prop step, :string, default: "1"
  prop readonly, :boolean
  prop value, :string

  prop is_sharp_left_side, :boolean
  prop is_sharp_right_side, :boolean
  prop is_sharp_top_side, :boolean
  prop is_sharp_bottom_side, :boolean
  prop is_top_bottom_border_hidden, :boolean
  prop is_side_border_hidden, :boolean

  prop focus, :event
  prop keydown, :event
  prop keyup, :event
  prop blur, :event

  slot hint_text_slot

  def render(assigns) do
    ~F"""
    <Container disabled={@disabled} size={@size}>
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
        dir={@dir}
        with_label={@label}
        placeholder={@placeholder}
        required={@required}
        readonly={@readonly}
        value={@value}
        step={@step}
        background_color={@background_color}
        is_sharp_left_side={@is_sharp_left_side}
        is_sharp_right_side={@is_sharp_right_side}
        is_sharp_top_side={@is_sharp_top_side}
        is_sharp_bottom_side={@is_sharp_bottom_side}
        is_top_bottom_border_hidden={@is_top_bottom_border_hidden}
        is_side_border_hidden={@is_side_border_hidden}
        is_first={@is_first}
        focus={@focus}
        keyup={@keyup}
        keydown={@keydown}
        blur={@blur}
      />
      <HintText :if={slot_assigned?(:hint_text_slot)}>
        <#slot name="hint_text_slot" />
      </HintText>
    </Container>
    """
  end
end
