defmodule Moon.Components.TextInput.TextInputInnerLabel do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.TextInput.Container
  alias Moon.Components.TextInput.Input
  alias Moon.Components.TextInput.HintText
  alias Moon.Components.TextInput.Utils

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
    ],
    default: "text"

  prop placeholder, :string
  prop is_error, :boolean
  prop dir, :string, values: ["ltr", "rtl"], default: "ltr"
  prop background_color, :string, values: Moon.colors(), default: "gohan-100"
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
    <Container disabled={@disabled} size={@size}>
      <div
        class={
          "w-full max-w-full relative",
          Utils.get_border_radius(@size),
          "bg-transparent": !@background_color,
          "bg-#{@background_color}": @background_color
        }
      >
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
        <label
          dir={@dir}
          :if={@label}
          class={
            "absolute text-[0.75rem] leading-3 text-trunks-100 top-3 z-[1] transition-all ease-in-out duration-200",
            "opacity-30 cursor-not-allowed": @disabled,
            "right-4": @dir == "rtl",
            "left-4": @dir != "rtl"
          }
        >
          {@label}
        </label>
        </div>
        <HintText :if={slot_assigned?(:hint_text_slot)}>
          <#slot name="hint_text_slot" />
        </HintText>
    </Container>
    """
  end
end
