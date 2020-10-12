defmodule Moon.Components.Inline do
  use Moon.StatelessComponent

  prop(style, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name = get_class_name("components-inline-#{assigns.style}-#{assigns.font_size}")

    ~H"""
    <style>
      .{{ class_name }} {
        font-size: {{ @font_size }};
        {{ @style }};
      }

      .{{ class_name }} > div, .{{ class_name }} > img {
        display: inline-block;
        padding-right: 10px;
        vertical-align: top;
      }
    </style>

    <div class={{ class_name }}>
      <slot />
    </div>
    """
  end
end
