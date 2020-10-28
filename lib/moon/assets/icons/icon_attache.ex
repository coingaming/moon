defmodule Moon.Assets.Icons.IconAttache do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconAttache-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M20.8001 19.8C20.5001 19.8 20.3001 19.7 20.1001 19.5L16.5001 15.9C16.1001 15.5 15.3001 15.5 14.9001 15.9L11.3001 19.5C10.9001 19.9 10.3001 19.9 9.9001 19.5C9.5001 19.1 9.5001 18.5 9.9001 18.1L13.5001 14.5C14.7001 13.3 16.8001 13.3 18.0001 14.5L21.6001 18.1C22.0001 18.5 22.0001 19.1 21.6001 19.5C21.4001 19.7 21.1001 19.8 20.8001 19.8Z" fill="currentColor"/> <path d="M15.7001 28C15.1001 28 14.7001 27.6 14.7001 27V14.6C14.7001 14 15.1001 13.6 15.7001 13.6C16.3001 13.6 16.7001 14 16.7001 14.6V27C16.7001 27.5 16.3001 28 15.7001 28Z" fill="currentColor"/> <path d="M23 24.5C22.4 24.5 22 24.1 22 23.5C22 22.9 22.4 22.5 23 22.5C24.4 22.5 25.7001 21.9 26.7001 20.9C27.7001 19.9 28.1 18.5 28 17.1C27.8 14.6 25.5 12.6 22.8 12.6C21.8 12.6 21.1 12 21 11.1C20.5 8.2 18 6 15.0001 6C11.9001 6 9.60005 8.5 9.40005 11.9C9.40005 12.6 8.90005 13.1 8.30005 13.2C7.10005 13.4 4.30005 14.3 4.20005 17.8C4.00005 19 4.50005 20.1 5.30005 21C6.20005 22 7.50005 22.5 8.80005 22.5C9.40005 22.5 9.80005 22.9 9.80005 23.5C9.80005 24.1 9.40005 24.5 8.80005 24.5C6.90005 24.5 5.10005 23.7 3.80005 22.4C2.60005 21.1 1.90005 19.4 2.00005 17.7C2.20005 13.9 4.70005 12 7.30005 11.3C7.80005 7.1 10.9001 4 14.9001 4C18.8001 4 22.1 6.8 22.9 10.6C26.6 10.7 29.6 13.4 30 16.9C30.2001 18.9 29.6 20.8 28.2001 22.3C26.9001 23.7 25 24.5 23 24.5Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
