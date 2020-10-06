defmodule Moon.Components.Badge do
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
      get_class_name("components-badge-#{assigns.background}-#{assigns.style}-#{assigns.color}")

    ~H"""
    <Context get={{ :theme }}>
      <style>
        .{{ classname }} {
          background-color: {{ @background || @theme.color.text }};
          border-radius: 4px;
          padding: 2px;
          padding-left: 5px;
          padding-right: 5px;
          display: inline-block;
          font-size: 12pt;
          color: {{ @color || @theme.color.gohan_100 }};
          {{ @style }};
        }
      </style>

      <div class={{ "#{classname} #{@add_class}" }}>
        <Text size={{ @size }} is_bold={{ @is_bold }}>
          <slot />
        </Text>
      </div>
    </Context>
    """
  end
end
