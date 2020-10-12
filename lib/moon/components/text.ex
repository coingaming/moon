defmodule Moon.Components.Text do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(size, :integer, required: false, default: 16)
  prop(is_bold, :boolean, required: false, default: false)
  prop(color, :string, default: "bulma_100")
  prop(style, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "components-text-#{assigns.size}-#{assigns.is_bold}-#{assigns.color}-#{}-#{assigns.style}"
      )

    ~H"""
    <Context get={{ theme: theme }}>
      <style>
        .{{ class_name }} {
          font-size: {{ @size }}px;
          font-weight: {{ @is_bold && theme.font_weight.semibold }};
          color:  {{ get_color(@color, theme) }};
          {{ @style }};
        }
      </style>

      <div class={{ class_name }}>
        <slot />
      </div>
    </Context>
    """
  end
end
