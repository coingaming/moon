defmodule Moon.Assets.Icons.IconVolatility do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconVolatility-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M16.4 28.9C14.6 28.9 13.2 27.5 13.2 25.7V6.3C13.2 5.7 12.7 5.1 12 5.1C11.1 5.1 10.9 5.9 10.8 6.4L9.6 18.1C9.4 19.9 8.1 21.2 6.4 21.2H3C2.4 21.2 2 20.8 2 20.2C2 19.6 2.4 19.2 3 19.2H6.4C7.3 19.2 7.5 18.2 7.6 17.9L8.9 6.1C9.2 4.2 10.4 3 12.1 3C13.9 3 15.3 4.4 15.3 6.2V25.7C15.3 26.3 15.8 26.9 16.5 26.9C17.2 26.9 17.7 26.4 17.7 25.7V14.2C17.7 12.5 19.1 11 20.9 11C22.5 11 23.7 12.2 24.1 14L24.8 17.8C25 19.1 25.6 19.1 26 19.1H29C29.6 19.1 30 19.5 30 20.1C30 20.7 29.6 21.1 29 21.1H25.8C24.1 21.1 23 20 22.6 18.1L21.9 14.3C21.9 14 21.6 13 20.7 13C20.1 13 19.5 13.5 19.5 14.2V25.8C19.6 27.5 18.2 28.9 16.4 28.9Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
