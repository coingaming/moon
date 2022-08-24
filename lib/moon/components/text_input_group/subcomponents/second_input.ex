defmodule Moon.Components.TextInputGroup.SecondInput do
  @moduledoc false

  use Surface.Component, slot: "second_input"
  alias Moon.Components.TextInput

  prop t_background_color, :string, default: "gohan-100"

  prop t_orientation, :string,
    default: "horizontal",
    values: ["horizontal", "vertical"]

  prop t_dir, :string, default: "ltr", values: ["ltr", "rtl"]

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

  prop field, :atom

  slot hint_text_slot

  def render(assigns) do
    ~F"""
    <div>
      <Context
        get={Moon.Components.TextInputGroup, dir: dir}
        get={Moon.Components.TextInputGroup, orientation: orientation}
        get={Moon.Components.TextInputGroup, background_color: background_color}
      >
        {#if slot_assigned?(:hint_text_slot)}
          {get_input_with_hint(
            assigns,
            @id,
            @type,
            @placeholder,
            @is_error,
            @is_first,
            @disabled,
            @label,
            @required,
            @step,
            @readonly,
            @value,
            @focus,
            @keydown,
            @keyup,
            @blur,
            @show_password_text,
            @t_orientation,
            @t_dir,
            @t_background_color
          )}
        {#else}
          {get_input(
            assigns,
            @id,
            @type,
            @placeholder,
            @is_error,
            @is_first,
            @disabled,
            @label,
            @required,
            @step,
            @readonly,
            @value,
            @focus,
            @keydown,
            @keyup,
            @blur,
            @show_password_text,
            @t_orientation,
            @t_dir,
            @t_background_color
          )}
        {/if}
      </Context>
    </div>
    """
  end

  defp get_input(
         assigns,
         id,
         type,
         placeholder,
         is_error,
         is_first,
         disabled,
         label,
         required,
         step,
         readonly,
         value,
         focus,
         keydown,
         keyup,
         blur,
         show_password_text,
         orientation,
         dir,
         background_color
       ) do
    ~F"""
    <TextInput
      {=id}
      size="xl"
      {=type}
      {=placeholder}
      {=is_error}
      {=is_first}
      {=disabled}
      {=label}
      {=required}
      {=step}
      {=readonly}
      {=value}
      {=focus}
      {=keydown}
      {=keyup}
      {=blur}
      {=show_password_text}
      is_sharp_right_side={get_is_sharp_right_side(orientation, dir)}
      is_sharp_left_side={get_is_sharp_left_side(orientation, dir)}
      is_sharp_top_side={get_is_sharp_top_side(orientation)}
      is_top_bottom_border_hidden={get_is_top_bottom_border_hidden(orientation)}
      is_side_border_hidden={get_is_side_border_hidden(orientation)}
      {=background_color}
      {=dir}
    />
    """
  end

  defp get_input_with_hint(
         assigns,
         id,
         type,
         placeholder,
         is_error,
         is_first,
         disabled,
         label,
         required,
         step,
         readonly,
         value,
         focus,
         keydown,
         keyup,
         blur,
         show_password_text,
         orientation,
         dir,
         background_color
       ) do
    ~F"""
    <TextInput
      {=id}
      size="xl"
      {=type}
      {=placeholder}
      {=is_error}
      {=is_first}
      {=disabled}
      {=label}
      {=required}
      {=step}
      {=readonly}
      {=value}
      {=focus}
      {=keydown}
      {=keyup}
      {=blur}
      {=show_password_text}
      is_sharp_right_side={get_is_sharp_right_side(orientation, dir)}
      is_sharp_left_side={get_is_sharp_left_side(orientation, dir)}
      is_sharp_top_side={get_is_sharp_top_side(orientation)}
      is_top_bottom_border_hidden={get_is_top_bottom_border_hidden(orientation)}
      is_side_border_hidden={get_is_side_border_hidden(orientation)}
      {=background_color}
      {=dir}
    >
      <:hint_text_slot>
        <slot name="hint_text_slot" />
      </:hint_text_slot>
    </TextInput>
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
