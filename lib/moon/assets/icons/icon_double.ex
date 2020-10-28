defmodule Moon.Assets.Icons.IconDouble do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconDouble-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
      )

    ~H"""
    <Context get={{ theme: theme }}>
    <style>
      .{{ class_name }} {
        vertical-align: middle;
        width: 1em;
        color: {{ get_color(@color, theme) }};
        background-color: {{ get_color(@background_color, theme) }};
        font-size: {{ @font_size }};
        display: inline-block;
        overflow: hidden;
        
      }
    </style>

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M24.1 10.9C23.8 10.9 23.6 10.8 23.4 10.6L17.4 4.6C16.6 3.8 15.4 3.8 14.6 4.6L8.60002 10.6C8.20002 11 7.60002 11 7.20002 10.6C6.80002 10.2 6.80002 9.6 7.20002 9.2L13.2 3.2C14.7 1.7 17.3 1.7 18.8 3.2L24.8 9.2C25.2 9.6 25.2 10.2 24.8 10.6C24.6 10.8 24.4 10.9 24.1 10.9Z" fill="currentColor"/> <path d="M16 30C15 30 14 29.6 13.2 28.8L7.20002 22.8C6.80002 22.4 6.80002 21.8 7.20002 21.4C7.60002 21 8.20002 21 8.60002 21.4L14.6 27.4C15.4 28.2 16.6 28.2 17.4 27.4L23.4 21.4C23.8 21 24.4 21 24.8 21.4C25.2 21.8 25.2 22.4 24.8 22.8L18.8 28.8C18 29.6 17 30 16 30Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
