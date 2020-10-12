defmodule Moon.Components.Badge do
  use Moon.StatelessComponent

  prop(background_color, :string)
  prop(color, :string)
  prop(size, :string)
  prop(style, :string)
  prop(add_class, :string)

  def render(assigns) do
    classname =
      get_class_name(
        "components-badge-#{assigns.background_color}-#{assigns.style}-#{assigns.color}-#{
          assigns.size
        }"
      )

    ~H"""
    <Context get={{ theme: theme }}>
      <style>
        .{{ classname }} {
          display: inline-flex;
          color: {{ get_color(@color, @theme) }};
          background-color: {{ get_color(@background_color, @theme) }};
          font-weight: {{ @theme.font_weight.semibold }};
          text-transform: uppercase;
          border-radius: {{ get_rem(@theme.radius.largest) }};
          letter-spacing: {{ get_rem(1) }};

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
