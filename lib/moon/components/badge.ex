defmodule Moon.Components.Badge do
  use Moon.StatelessComponent

  property background_color, :string
  property color, :string
  property size, :string
  property style, :string
  property add_class, :string

  def render(assigns) do
    classname =
      get_class_name(
        "components-badge-#{assigns.background_color}-#{assigns.style}-#{assigns.color}-#{
          assigns.size
        }"
      )

    ~H"""
    <Context get={{ :theme }}>
      <style>
        .{{ classname }} {
          display: inline-flex;
          color: {{ get_color(@color, @theme) }};
          background-color: {{ get_color(@background_color, @theme) }};
          font-weight: {{ @theme.font_weight.semibold }};
          text-transform: uppercase;
          border-radius: {{ @theme.radius.largest }}rem;
          letterSpacing: 1rem;

          {{ @style }};
        }
      </style>

      <div class={{ "#{classname} #{@add_class}" }}>
        <slot />
      </div>
    </Context>
    """
  end
end
