defmodule Moon.Components.TextInput.Input do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.TextInput.Utils

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

  prop field, :atom
  prop is_error, :boolean, default: false
  prop background_color, :string, values: Moon.colors()
  prop size, :string, values: ["md", "lg", "xl"]
  prop dir, :string, values: ["ltr", "rtl"], default: "ltr"
  prop with_label, :boolean, default: false
  prop disabled, :boolean
  prop placeholder, :string
  prop required, :boolean
  prop step, :string, default: "1"
  prop is_first, :boolean
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

  def render(assigns) do
    ~F"""
    <Surface.Components.Form.TextInput
      opts={
        placeholder: @placeholder,
        disabled: @disabled,
        required: @required && !@disabled,
        type: @type,
        "data-lpignore": "true",
        step: @step,
        readonly: @readonly,
        dir: @dir
      }
      value={@value}
      class={
        "focus:ring-0 border-0",
        "block w-full max-w-full py-0 px-4 m-0 appearance-none",
        "text-[1rem] text-bulma transition-shadow box-border relative z-[2]",
        "shadow-input hover:shadow-input-hov",
        "focus:shadow-input-focus focus:outline-none",
        "before:box-border after:box-border",
        "placeholder:text-trunks placeholder:opacity-100 placeholder:transition-opacity placeholder:delay-75",
        "read-only:outline-0 read-only:border-none read-only:cursor-not-allowed read-only:hover:shadow-input read-only:focus:shadow-input",
        "input-dt-shared",
        "invalid:shadow-input-err invalid:hover:shadow-input-err invalid:focus:shadow-input-err",
        Utils.get_size_styles(@size),
        get_class_left(
          @is_sharp_left_side,
          @is_sharp_top_side,
          @is_sharp_bottom_side
        ),
        get_class_right(
          @is_sharp_right_side,
          @is_sharp_top_side,
          @is_sharp_bottom_side
        ),
        get_class_for_date_type(@type, @dir == "rtl"),
        get_class_for_time_type(@type, @dir == "rtl"),
        "#{Utils.make_border_left(@is_side_border_hidden,
        @is_first,
        @dir == "rtl")}": !@is_error,
        "#{Utils.make_border_right(@is_side_border_hidden,
        @is_first,
        @dir == "rtl")}": !@is_error,
        "#{Utils.make_border_top_bottom(@is_top_bottom_border_hidden,
        @is_first)}": !@is_error,
        "input-number-clear": @type == "number",
        "shadow-input-err hover:shadow-input-err focus:shadow-input-err": @is_error,
        "bg-#{@background_color}": @background_color,
        "bg-transparent": !@background_color,
        "input-xl-dt-shared": @size == "xl",
        "input-xl pt-[1.125rem] input-xl-dt-label": @size == "xl" && @with_label,
        "input-lg-dt-shared": @size == "lg"
      }
      focus={@focus}
      keyup={@keyup}
      keydown={@keydown}
      blur={@blur}
      field={@field}
    />
    """
  end

  defp get_class_for_date_type(type, is_rtl) do
    cond do
      type == "date" || type == "datetime-local" -> "input-d"
      type == "date" && is_rtl -> "input-d-rtl"
      type == "datetime-local" && is_rtl -> "input-dt-local-rtl"
      true -> ""
    end
  end

  defp get_class_for_time_type(type, is_rtl) do
    cond do
      type == "time" -> "input-t"
      type == "time" && is_rtl -> "input-t-rtl"
      true -> ""
    end
  end

  defp get_class_left(
         is_sharp_left_side,
         is_sharp_top_side,
         is_sharp_bottom_side
       ) do
    cond do
      is_sharp_left_side || is_sharp_top_side -> "rounded-tl-none"
      is_sharp_left_side || is_sharp_bottom_side -> "rounded-bl-none"
      true -> ""
    end
  end

  defp get_class_right(
         is_sharp_right_side,
         is_sharp_top_side,
         is_sharp_bottom_side
       ) do
    cond do
      is_sharp_right_side || is_sharp_top_side -> "rounded-tr-none"
      is_sharp_right_side || is_sharp_bottom_side -> "rounded-br-none"
      true -> ""
    end
  end
end
