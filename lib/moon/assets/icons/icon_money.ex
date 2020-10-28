defmodule Moon.Assets.Icons.IconMoney do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconMoney-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M21.7 2.39999C17 2.39999 13.4 4.29999 13.4 6.79999V11.6C12.4 11.4 11.4 11.3 10.2 11.3C5.50002 11.3 1.90002 13.2 1.90002 15.7V25.3C1.90002 27.8 5.50002 29.7 10.2 29.7C14.8 29.7 18.2 27.9 18.5 25.6C19.5 25.8 20.6 25.9 21.7 25.9C26.4 25.9 30 24 30 21.5V6.69999C30 4.19999 26.4 2.39999 21.7 2.39999ZM21.7 4.39999C25.5 4.39999 28 5.79999 28 6.79999C28 7.79999 25.6 9.19999 21.7 9.19999C17.8 9.19999 15.4 7.79999 15.4 6.79999C15.4 5.79999 17.9 4.39999 21.7 4.39999ZM10.3 13.3C14.1 13.3 16.6 14.7 16.6 15.7C16.6 16.7 14.1 18 10.3 18C6.50002 18 4.00002 16.6 4.00002 15.6C4.00002 14.6 6.50002 13.3 10.3 13.3ZM4.00002 18.5C5.50002 19.4 7.70003 20 10.3 20C12.9 20 15.1 19.4 16.6 18.5V20.1C16.6 21.1 14.2 22.5 10.3 22.5C6.40002 22.5 4.00002 21.1 4.00002 20.1V18.5ZM10.3 27.6C6.50002 27.6 4.00002 26.2 4.00002 25.2V23C5.50002 23.9 7.70003 24.5 10.3 24.5C12.9 24.5 15.1 23.9 16.6 23V25.3C16.6 26.2 14.1 27.6 10.3 27.6ZM21.7 23.8C20.6 23.8 19.5 23.7 18.5 23.4V20.3C19.5 20.5 20.6 20.6 21.7 20.6C24.3 20.6 26.5 20 28 19.1V21.4C28 22.4 25.5 23.8 21.7 23.8ZM21.7 18.6C20.6 18.6 19.5 18.5 18.5 18.2V15.5C18.5 15.4 18.5 15.3 18.5 15.1C19.5 15.3 20.5 15.4 21.7 15.4C24.3 15.4 26.5 14.8 28 13.9V16.1C28 17.3 25.5 18.6 21.7 18.6ZM21.7 13.6C17.9 13.6 15.4 12.2 15.4 11.2V9.59999C16.9 10.5 19.1 11.1 21.7 11.1C24.3 11.1 26.5 10.5 28 9.59999V11.2C28 12.2 25.5 13.6 21.7 13.6Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
