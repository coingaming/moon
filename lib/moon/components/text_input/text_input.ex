defmodule Moon.Components.TextInput2 do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.TextInput.TextInputBasic
  alias Moon.Components.TextInput.TextInputInnerLabel
  alias Moon.Components.TextInput.TextInputPassword

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
  prop readonly, :boolean
  prop value, :string

  prop focus, :event
  prop keydown, :event
  prop keyup, :event
  prop blur, :event

  slot hint_text_slot
  slot show_password_text

  def render(assigns) do
    ~F"""
    {#if @size == "xl"}
      <TextInputInnerLabel
        disabled={@disabled}
        dir={@dir}
        label={@label}
        is_error={@is_error}
        size={@size}
        type={@type}
        step={@step}
        required={@required}
        placeholder={@placeholder}
        readonly={@readonly}
        value={@value}
        background_color={@background_color}
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
      </TextInputInnerLabel>
    {#elseif @type == "password"}
      <TextInputPassword
        id={@id}
        disabled={@disabled}
        dir={@dir}
        label={@label}
        is_error={@is_error}
        size={@size}
        step={@step}
        required={@required}
        placeholder={@placeholder}
        readonly={@readonly}
        value={@value}
        background_color={@background_color}
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
      </TextInputPassword>
    {#else}
      <TextInputBasic
        disabled={@disabled}
        dir={@dir}
        label={@label}
        is_error={@is_error}
        size={@size}
        type={@type}
        step={@step}
        readonly={@readonly}
        value={@value}
        required={@required}
        placeholder={@placeholder}
        background_color={@background_color}
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
    {/if}
    """
  end
end
