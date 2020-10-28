defmodule Moon.Components.Link do
  use Moon.StatelessComponent
  use Moon.Components.Context

  property(add_class, :string)
  property(color, :string)
  property(background, :string)
  property(margin, :string)
  property(padding, :string)
  property(style, :string)
  property(to, :any)

  def render(assigns) do
    class_name =
      get_class_name(
        "components-link-#{assigns.color}-#{assigns.background}-#{assigns.margin}-#{assigns.style}"
      )

    ~H"""
    <Context get={{ theme: theme }}>
      <style>
        .{{ class_name }} {
          color: {{ @color || theme.color.text }};
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
