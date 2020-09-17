defmodule Moon.Components.Label do
  use Moon.StatelessComponent
  alias Moon.Components.Text

  property background, :string
  property color, :string
  property style, :string
  property size, :integer, default: 14
  property is_bold, :boolean, default: false
  property add_class, :string

  def render(assigns) do
    classname =
      get_class_name("components-label-#{assigns.background}-#{assigns.style}-#{assigns.color}")

    ~H"""
    <style>
      .{{ classname }} {
        background-color: {{ @background }};
        border-radius: 4px;
        padding: 2px;
        padding-left: 5px;
        padding-right: 5px;
        display: inline-block;
        font-size: 12pt;
        color: {{ @color || "#fff" }};
        {{ @style }};
      }
    </style>

    <div class={{ "#{classname} #{@add_class}" }}>
      <Text size={{ @size }} is_bold={{ @is_bold }}>
        <slot />
      </Text>
    </div>
    """
  end
end
