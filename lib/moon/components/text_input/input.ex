defmodule Moon.Components.TextInput.Input do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.TextInput.Utils

  prop id, :string
  prop field, :atom

  data placeholder, :string, from_context: {Moon.Components.TextInput, :placeholder}
  data disabled, :boolean, from_context: {Moon.Components.TextInput, :disabled}
  data required, :boolean, from_context: {Moon.Components.TextInput, :required}
  data type, :string, from_context: {Moon.Components.TextInput, :type}
  data step, :string, from_context: {Moon.Components.TextInput, :step}
  data readonly, :boolean, from_context: {Moon.Components.TextInput, :readonly}
  data value, :string, from_context: {Moon.Components.TextInput, :value}
  data size, :string, from_context: {Moon.Components.TextInput, :size}
  data is_error, :boolean, from_context: {Moon.Components.TextInput, :is_error}
  data background_color, :string, from_context: {Moon.Components.TextInput, :background_color}
  data label, :string, from_context: {Moon.Components.TextInput, :label}
  data focus, :event, from_context: {Moon.Components.TextInput, :focus}
  data keyup, :event, from_context: {Moon.Components.TextInput, :keyup}
  data keydown, :event, from_context: {Moon.Components.TextInput, :keydown}
  data blur, :event, from_context: {Moon.Components.TextInput, :blur}
  data has_left_icon, :boolean, from_context: {Moon.Components.TextInput, :has_left_icon}
  data has_right_icon, :boolean, from_context: {Moon.Components.TextInput, :has_right_icon}

  def render(assigns) do
    ~F"""
    <Surface.Components.Form.TextInput
      {=@id}
      {=@field}
      opts={
        placeholder: @placeholder,
        disabled: @disabled,
        required: @required && !@disabled,
        type: @type,
        "data-lpignore": "true",
        step: @step,
        readonly: @readonly
      }
      {=@value}
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
        get_class_for_date_type(@type),
        @background_color,
        "bg-#{@background_color}",
        "ltr:input-t rtl:input-t-rtl": @type == "time",
        "input-number-clear": @type == "number",
        "shadow-input-err hover:shadow-input-err focus:shadow-input-err": @is_error,
        "bg-transparent": !@background_color,
        "input-xl-dt-shared": @size == "xl",
        "input-xl pt-[1.125rem] input-xl-dt-label": @size == "xl" && @label,
        "input-lg-dt-shared": @size == "lg",
        "pl-12": @has_left_icon,
        "pr-12": @has_right_icon
      }
      {=@focus}
      {=@keyup}
      {=@keydown}
      {=@blur}
    />
    """
  end

  defp get_class_for_date_type(type) do
    cond do
      type == "date" -> "ltr:input-d rtl:input-d-rtl"
      type == "datetime-local" -> "ltr:input-d rtl:input-dt-local-rtl"
      true -> ""
    end
  end
end
