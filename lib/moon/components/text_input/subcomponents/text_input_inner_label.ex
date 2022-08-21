defmodule Moon.Components.TextInput.TextInputInnerLabel do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.TextInput.Container
  alias Moon.Components.TextInput.Input
  alias Moon.Components.TextInput.HintText
  alias Moon.Components.TextInput.Utils
  alias Moon.Components.ErrorTag

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
  prop class, :css_class
  prop field, :atom
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

  prop use_error_tag, :boolean

  slot hint_text_slot

  def render(assigns) do
    ~F"""
    <Container disabled={@disabled} size={@size}>
      <div class={
        "w-full max-w-full relative",
        Utils.get_border_radius(@size),
        "bg-transparent": !@background_color,
        "bg-#{@background_color}": @background_color
      }>
        <Input
          class={@class}
          field={@field}
          is_error={@is_error}
          size={@size}
          type={@type}
          dir={@dir}
          with_label={@label}
          placeholder={@placeholder}
          required={@required}
          step={@step}
          readonly={@readonly}
          value={@value}
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
      <HintText :if={slot_assigned?(:hint_text_slot)} is_error={@is_error}>
        <#slot name="hint_text_slot" />
      </HintText>
      <div class="inline-block mt-2 text-moon-12">
        <ErrorTag :if={@use_error_tag && @is_error} />
      </div>
    </Container>
    """
  end
end
