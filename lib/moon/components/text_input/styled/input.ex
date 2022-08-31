defmodule Moon.Components.TextInput.Input do
  @moduledoc false

  use Moon.StatelessComponent

  prop id, :string
  prop field, :atom

  def render(assigns) do
    ~F"""
    <Context
      get={Moon.Components.TextInput, placeholder: placeholder}
      get={Moon.Components.TextInput, disabled: disabled}
      get={Moon.Components.TextInput, required: required}
      get={Moon.Components.TextInput, type: type}
      get={Moon.Components.TextInput, step: step}
      get={Moon.Components.TextInput, readonly: readonly}
      get={Moon.Components.TextInput, dir: dir}
      get={Moon.Components.TextInput, value: value}
      get={Moon.Components.TextInput, size: size}
      get={Moon.Components.TextInput, is_error: is_error}
      get={Moon.Components.TextInput, background_color: background_color}
      get={Moon.Components.TextInput, label: label}
      get={Moon.Components.TextInput, focus: focus}
      get={Moon.Components.TextInput, keyup: keyup}
      get={Moon.Components.TextInput, keydown: keydown}
      get={Moon.Components.TextInput, blur: blur}
    >
      <Surface.Components.Form.TextInput
        {=@id}
        {=@field}
        opts={
          placeholder: placeholder,
          disabled: disabled,
          required: required && !disabled,
          type: type,
          "data-lpignore": "true",
          step: step,
          readonly: readonly,
          dir: dir
        }
        {=value}
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
          "h-14 leading-[3.5rem] rounded-moon-i-md hover:rounded-moon-i-md focus:rounded-moon-i-md invalid:rounded-moon-i-md",
          get_class_for_date_type(type, dir == "rtl"),
          get_class_for_time_type(type, dir == "rtl"),
          "input-number-clear": type == "number",
          "shadow-input-err hover:shadow-input-err focus:shadow-input-err": is_error,
          "bg-#{background_color}": background_color,
          "bg-transparent": !background_color,
          "input-xl-dt-shared": size == "xl",
          "input-xl pt-[1.125rem] input-xl-dt-label": size == "xl" && label,
          "input-lg-dt-shared": size == "lg"
        }
        {=focus}
        {=keyup}
        {=keydown}
        {=blur}
      />
    </Context>
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
end
