defmodule Moon.Components.Button do
  use Moon.StatelessComponent
  use Moon.Components.Context

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
    <Context get={{ :theme }}>
      <style>
        .{{ class_name }} {
          padding: 10px;
          padding-left: 20px;
          padding-right: 20px;
          text-align: center;
          border-radius: 100px;
          color: {{ @color || @theme.colors["some-test.100"] }};
          background-color: {{ @background || @theme.colors["some-test.100"] }};
          {{ @style }};
          display: inline-block;
        }
      </style>

      <div class={{ class_name }}>
        <slot />
      </div>
    </Context>
    """
  end
end
