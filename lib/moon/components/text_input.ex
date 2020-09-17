defmodule Moon.Components.TextInput do
  use Moon.StatelessComponent

  alias Surface.Components.Form.TextInput

  property name, :string, required: true
  property placeholder, :string
  property style, :string
  property size, :integer, default: 14

  def render(assigns) do
    class_name = get_classname("components-text-input-#{assigns.size}-#{assigns.style}")

    ~H"""
    <style>
      .{{ class_name }} {
        font-size: {{ @size }}px;
        {{ @style }};
      }
    </style>

    <TextInput class="{{ class_name }}" field={{ @name }} opts={{ [placeholder: @placeholder]}} />
    """
  end
end
