defmodule Moon.Components.TextInput.Password do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.TextInput.Utils

  prop id, :string
  prop field, :atom
  prop value, :string
  prop on_keyup, :string
  prop input_password_id, :string

  prop type, :string,
    values: [
      "password",
      "text"
    ],
    default: "text"

  data placeholder, :string, from_context: {Moon.Components.TextInput, :placeholder}
  data disabled, :boolean, from_context: {Moon.Components.TextInput, :disabled}
  data required, :boolean, from_context: {Moon.Components.TextInput, :required}
  data readonly, :boolean, from_context: {Moon.Components.TextInput, :readonly}
  data size, :string, from_context: {Moon.Components.TextInput, :size}
  data is_error, :boolean, from_context: {Moon.Components.TextInput, :is_error}
  data background_color, :string, from_context: {Moon.Components.TextInput, :background_color}
  data label, :string, from_context: {Moon.Components.TextInput, :label}
  data focus, :event, from_context: {Moon.Components.TextInput, :focus}
  data keydown, :event, from_context: {Moon.Components.TextInput, :keydown}
  data blur, :event, from_context: {Moon.Components.TextInput, :blur}
  data has_left_icon, :boolean, from_context: {Moon.Components.TextInput, :has_left_icon}
  data has_right_icon, :boolean, from_context: {Moon.Components.TextInput, :has_right_icon}

  def render(assigns) do
    ~F"""
    <Surface.Components.Form.PasswordInput
      opts={
        placeholder: @placeholder,
        disabled: @disabled,
        required: @required && !@disabled,
        "data-lpignore": "true",
        readonly: @readonly,
        type: @type
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
        "shadow-input-err hover:shadow-input-err focus:shadow-input-err": @is_error,
        "bg-#{@background_color}": @background_color,
        "bg-transparent": !@background_color,
        "input-xl-dt-shared": @size == "xl",
        "input-xl pt-[1.125rem] input-xl-dt-label": @size == "xl" && @label,
        "input-lg-dt-shared": @size == "lg",
        "pl-12": @has_left_icon,
        "pr-12": @has_right_icon
      }
      id={"#{@id}_input"}
      keyup={@on_keyup, target: "##{@input_password_id}"}
      {=@field}
      {=@focus}
      {=@keydown}
      {=@blur}
    />
    """
  end
end
