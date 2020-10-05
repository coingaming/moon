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
          display: inline-block;
          min-height: 1.5rem;
          font-family: inherit;
          font-weight: {{ @theme.font_weight.semibold }};
          text-decoration: none;
          curson: pointer;
          border: {{ @theme.border }};
          border-color: transparent;
          border-radius: {{ @theme.radius.largest }};
          transition: `background-color {{ @theme.transition_duration.default }}s`,
          white-space: nowrap;
        }
      </style>

      <div class={{ class_name }}>
        <slot />
      </div>
    </Context>
    """
  end
end
