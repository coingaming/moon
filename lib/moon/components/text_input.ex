defmodule Moon.Components.TextInput do
  use Moon.StatelessComponent

  alias Surface.Components.Form.TextInput

  prop(name, :string)
  prop(style, :string)
  prop(label, :string)

  prop(type, :string,
    default: "text",
    values: [
      "date",
      "datetime-local",
      "email",
      "number",
      "password",
      "search",
      "tel",
      "text",
      "url",
      "time",
      "url"
    ]
  )

  prop(placeholder, :string)
  prop(error, :string)
  prop(rounded, :boolean)
  prop(disabled, :boolean)

  def render(assigns) do
    class_name = get_class_name("components-text-input-#{assigns.style}")

    ~H"""
    <style>
      .{{ class_name }} {
        {{ @style }};
      }
    </style>

    <TextInput class="{{ class_name }}" field={{ @name }} opts={{ [placeholder: @placeholder]}} />
    """
  end
end
