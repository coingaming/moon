defmodule Moon.Components.Text do
  use Moon.StatelessComponent

  property size, :integer, required: false, default: 14
  property is_bold, :boolean, required: false, default: false
  property weight, :integer
  property color, :string
  property padding, :string
  property margin, :string
  property style, :string

  def render(assigns) do
    class_name =
      get_class_name(
        "components-text-#{assigns.size}-#{assigns.weight || assigns.is_bold}-#{assigns.color}-#{
          assigns.padding
        }-#{assigns.margin}-#{assigns.style}"
      )

    ~H"""
    <style>
      .{{ class_name }} {
        font-size: {{ @size }}px;
        font-weight: {{ @weight || @is_bold && 800 || 100}};
        color:  {{ @color }};
        padding: {{ @padding }};
        margin: {{ @margin }};
        {{ @style }};
      }
    </style>

    <div class={{ class_name }}>
      <slot />
    </div>
    """
  end
end
