defmodule Moon.Components.Link do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(add_class, :string)
  prop(color, :string)
  prop(background, :string)
  prop(margin, :string)
  prop(padding, :string)
  prop(style, :string)
  prop(to, :any)

  def render(assigns) do
    class_name =
      get_class_name(
        "components-link-#{assigns.color}-#{assigns.background}-#{assigns.margin}-#{assigns.style}"
      )

    ~H"""
    <Context get={{ theme: theme }}>
      <style>
        .{{ class_name }} {
          color: {{ @color || @theme.color.text }};
          background: {{ @background }};
          margin: {{ @margin }};
          padding: {{ @padding }};
          {{ @style }};
        }
      </style>

      <a class="{{ class_name }} {{ @add_class }}" href={{ @to }}><slot /></a>
    </Context>
    """
  end
end

# Routes.live_path(@socket, MyLive, @page + 1)
