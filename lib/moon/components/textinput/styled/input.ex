defmodule Moon.Components.TextInput.Input do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.TextInput.Utils

  prop field, :atom
  prop is_error, :boolean, default: false
  prop background_color, :string, values: Moon.colors()
  prop size, :string, values: ["md", "lg", "xl"]
  prop is_rtl, :boolean, default: false
  prop with_label, :boolean, default: false

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

  prop disabled, :boolean
  prop placeholder, :string
  prop required, :boolean
  prop step, :string, default: "1"

  prop is_sharp_left_side, :boolean
  prop is_sharp_right_side, :boolean
  prop is_sharp_top_side, :boolean
  prop is_sharp_bottom_side, :boolean
  prop is_top_bottom_border_hidden, :boolean
  prop is_side_border_hidden, :boolean
  prop is_first, :boolean

  def render(assigns) do
    ~F"""
    <Surface.Components.Form.TextInput
    opts={
      placeholder: @placeholder,
      disabled: @disabled,
      required: @required && !@disabled,
      type: @type,
      "data-lpignore": "true",
      step: @step
    }
    class={
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
      Utils.make_border(
        @is_side_border_hidden,
        @is_top_bottom_border_hidden,
        @is_first,
        @is_rtl,
        @is_error
      ),
      get_class_sides(
        @is_sharp_left_side,
        @is_sharp_right_side,
        @is_sharp_top_side,
        @is_sharp_bottom_side,
        @is_error
      ),
      get_class_for_type(@type, @is_rtl),
      "shadow-input-err hover:shadow-input-err focus:shadow-input-err": @is_error,
      "bg-#{@background_color}": @background_color,
      "bg-transparent": !@background_color,
      "input-xl-dt-shared": @size == "xl",
      "input-xl pt-[1.125rem] input-xl-dt-label": @size == "xl" && @with_label,
      "input-lg-dt-shared": @size == "lg"
    } />
    """
  end

  defp get_class_for_type(type, is_rtl) do
    cond do
      type == "number" -> "input-number-clear"
      type == "date" || type == "datetime-local" -> "input-d"
      type == "date" && is_rtl -> "input-d-rtl"
      type == "time" -> "input-t"
      type == "time" && is_rtl -> "input-t-rtl"
      type == "datetime-local" && is_rtl -> "input-dt-local-rtl"
      true -> ""
    end
  end

  defp get_class_sides(
         is_sharp_left_side,
         is_sharp_right_side,
         is_sharp_top_side,
         is_sharp_bottom_side,
         is_error
       ) do
    cond do
      (is_sharp_left_side || is_sharp_top_side) && !is_error -> "rounded-tl-none"
      (is_sharp_right_side || is_sharp_top_side) && !is_error -> "rounded-tr-none"
      (is_sharp_left_side || is_sharp_bottom_side) && !is_error -> "rounded-bl-none"
      (is_sharp_right_side || is_sharp_bottom_side) && !is_error -> "rounded-br-none"
      true -> ""
    end
  end
end
