defmodule Moon.Components.TextInputGroup.SecondInput do
  @moduledoc false

  use Surface.Component, slot: "second_input"
  alias Moon.Components.TextInput

  prop id, :string

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
  prop is_first, :boolean
  prop disabled, :boolean
  prop label, :string
  prop required, :boolean
  prop step, :string, default: "1"

  prop readonly, :boolean
  prop value, :string

  prop focus, :event
  prop keydown, :event
  prop keyup, :event
  prop blur, :event

  prop show_password_text, :string, default: "Show"

  prop use_error_tag, :boolean

  prop group_info, :any, required: true

  slot hint_text_slot

  def render(assigns) do
    ~F"""
    <div>
      {#if slot_assigned?(:hint_text_slot)}
        <TextInput
          {=@id}
          size="xl"
          dir={@group_info.dir}
          background_color={@group_info.background_color}
          {=@type}
          {=@placeholder}
          {=@is_error}
          {=@is_first}
          {=@disabled}
          {=@label}
          {=@required}
          {=@step}
          {=@readonly}
          {=@value}
          {=@focus}
          {=@keydown}
          {=@keyup}
          {=@blur}
          {=@show_password_text}
          is_sharp_right_side={get_is_sharp_right_side(@group_info.orientation, @group_info.dir)}
          is_sharp_left_side={get_is_sharp_left_side(@group_info.orientation, @group_info.dir)}
          is_sharp_top_side={get_is_sharp_top_side(@group_info.orientation)}
          is_top_bottom_border_hidden={get_is_top_bottom_border_hidden(@group_info.orientation)}
          is_side_border_hidden={get_is_side_border_hidden(@group_info.orientation)}
        >
          <:hint_text_slot>
            <slot name="hint_text_slot" />
          </:hint_text_slot>
        </TextInput>
      {#else}
        <TextInput
          {=@id}
          size="xl"
          dir={@group_info.dir}
          background_color={@group_info.background_color}
          {=@type}
          {=@placeholder}
          {=@is_error}
          {=@is_first}
          {=@disabled}
          {=@label}
          {=@required}
          {=@step}
          {=@readonly}
          {=@value}
          {=@focus}
          {=@keydown}
          {=@keyup}
          {=@blur}
          {=@show_password_text}
          is_sharp_right_side={get_is_sharp_right_side(@group_info.orientation, @group_info.dir)}
          is_sharp_left_side={get_is_sharp_left_side(@group_info.orientation, @group_info.dir)}
          is_sharp_top_side={get_is_sharp_top_side(@group_info.orientation)}
          is_top_bottom_border_hidden={get_is_top_bottom_border_hidden(@group_info.orientation)}
          is_side_border_hidden={get_is_side_border_hidden(@group_info.orientation)}
        />
      {/if}
    </div>
    """
  end

  defp get_is_sharp_right_side(orientation, dir) do
    orientation == "horizontal" && is_rtl(dir)
  end

  defp get_is_sharp_left_side(orientation, dir) do
    orientation == "horizontal" && !is_rtl(dir)
  end

  defp get_is_sharp_top_side(orientation) do
    orientation == "vertical"
  end

  defp get_is_top_bottom_border_hidden(orientation) do
    orientation == "vertical"
  end

  defp get_is_side_border_hidden(orientation) do
    orientation == "horizontal"
  end

  defp is_rtl(dir) do
    dir == "rtl"
  end
end
