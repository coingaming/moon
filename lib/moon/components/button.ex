defmodule Moon.Components.Button do
  use Moon.StatelessComponent

  alias Moon.Sites.Aposta10.Config

  property color, :string
  property background, :string
  property margin, :string
  property style, :string

  def render(assigns) do
    class_name =
      get_class_name(
        "components-button-#{assigns.color}-#{assigns.background}-#{assigns.margin}-#{
          assigns.style
        }"
      )

    ~H"""
    <style>
      .{{ class_name }} {
        padding: 10px;
        padding-left: 20px;
        padding-right: 20px;
        text-align: center;
        border-radius: 100px;
        color: {{ @color || Config.colors.color7 }};
        background-color: {{ @background || Config.colors.color4 }};
        {{ @style }};
        display: inline-block;
      }
    </style>

    <div class={{ class_name }}>
      <slot />
    </div>
    """
  end
end
