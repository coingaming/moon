defmodule Moon.Components.TextInput do
  use Moon.StatelessComponent

  alias Surface.Components.Form.TextInput

  property name, :string
  property style, :string
  property label, :string
  property type, :string, default: "text",
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
  property placeholder, :string
  property error, :string
  property rounded, :boolean
  property disabled, :boolean

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
