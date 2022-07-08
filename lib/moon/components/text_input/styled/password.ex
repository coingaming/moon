defmodule Moon.Components.TextInput.Password do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.TextInput.Utils

  prop type, :string,
    values: [
      "password",
      "text"
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
  prop id, :string
  prop on_keyup, :string
  prop input_password_id, :string

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
    <Surface.Components.Form.PasswordInput
      opts={
        placeholder: @placeholder,
        disabled: @disabled,
        required: @required && !@disabled,
        "data-lpignore": "true",
        step: @step,
        readonly: @readonly,
        dir: @dir,
        type: @type
      }
      value={@value}
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
          @dir == "rtl",
          @is_error
        ),
        get_class_sides(
          @is_sharp_left_side,
          @is_sharp_right_side,
          @is_sharp_top_side,
          @is_sharp_bottom_side,
          @is_error
        ),
        "shadow-input-err hover:shadow-input-err focus:shadow-input-err": @is_error,
        "bg-#{@background_color}": @background_color,
        "bg-transparent": !@background_color,
        "input-xl-dt-shared": @size == "xl",
        "input-xl pt-[1.125rem] input-xl-dt-label": @size == "xl" && @with_label,
        "input-lg-dt-shared": @size == "lg"
      }
      id={"#{@id}_input"}
      keyup={@on_keyup, target: "##{@input_password_id}"}
      focus={@focus}
      keydown={@keydown}
      blur={@blur}
      field={@field}
    />
    """
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
