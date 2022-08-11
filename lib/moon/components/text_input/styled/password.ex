defmodule Moon.Components.TextInput.Password do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.TextInput.Utils

  prop id, :string
  prop value, :string
  prop on_keyup, :string
  prop input_password_id, :string

  prop type, :string,
    values: [
      "password",
      "text"
    ],
    default: "text"

  def render(assigns) do
    ~F"""
    <Context
      get={Moon.Components.TextInput, placeholder: placeholder}
      get={Moon.Components.TextInput, disabled: disabled}
      get={Moon.Components.TextInput, required: required}
      get={Moon.Components.TextInput, readonly: readonly}
      get={Moon.Components.TextInput, dir: dir}
      get={Moon.Components.TextInput, type: type}
      get={Moon.Components.TextInput, size: size}
      get={Moon.Components.TextInput, is_top_bottom_border_hidden: is_top_bottom_border_hidden}
      get={Moon.Components.TextInput, is_side_border_hidden: is_side_border_hidden}
      get={Moon.Components.TextInput, is_first: is_first}
      get={Moon.Components.TextInput, is_error: is_error}
      get={Moon.Components.TextInput, is_sharp_left_side: is_sharp_left_side}
      get={Moon.Components.TextInput, is_sharp_right_side: is_sharp_right_side}
      get={Moon.Components.TextInput, is_sharp_top_side: is_sharp_top_side}
      get={Moon.Components.TextInput, is_sharp_bottom_side: is_sharp_bottom_side}
      get={Moon.Components.TextInput, background_color: background_color}
      get={Moon.Components.TextInput, focus: focus}
      get={Moon.Components.TextInput, keydown: keydown}
      get={Moon.Components.TextInput, blur: blur}
      get={Moon.Components.TextInput, label: label}
    >
      <Surface.Components.Form.PasswordInput
        opts={
          placeholder: placeholder,
          disabled: disabled,
          required: required && !disabled,
          "data-lpignore": "true",
          readonly: readonly,
          dir: dir,
          type: type
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
          Utils.get_size_styles(size),
          "#{Utils.make_border_left(is_side_border_hidden,
          is_first,
          dir == "rtl")}": !is_error,
          "#{Utils.make_border_right(is_side_border_hidden,
          is_first,
          dir == "rtl")}": !is_error,
          "#{Utils.make_border_top_bottom(is_top_bottom_border_hidden,
          is_first)}": !is_error,
          "#{get_class_left(is_sharp_left_side,
          is_sharp_top_side,
          is_sharp_bottom_side)}": !is_error,
          "#{get_class_right(is_sharp_right_side,
          is_sharp_top_side,
          is_sharp_bottom_side)}": !is_error,
          "shadow-input-err hover:shadow-input-err focus:shadow-input-err": is_error,
          "bg-#{background_color}": background_color,
          "bg-transparent": !background_color,
          "input-xl-dt-shared": size == "xl",
          "input-xl pt-[1.125rem] input-xl-dt-label": size == "xl" && label,
          "input-lg-dt-shared": size == "lg"
        }
        id={"#{@id}_input"}
        keyup={@on_keyup, target: "##{@input_password_id}"}
        {=focus}
        {=keydown}
        {=blur}
      />
    </Context>
    """
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
