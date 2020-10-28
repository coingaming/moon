defmodule Moon.Assets.Icons.IconPin do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconPin-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path fill-rule="evenodd" clip-rule="evenodd" d="M14 2C11.2386 2 9 4.23858 9 7L9 13.1542C9 13.4832 8.81737 13.853 8.44657 14.1497C6.12324 16.0087 5 18.7651 5 22C5 22.5523 5.44772 23 6 23H15V29C15 29.5523 15.4477 30 16 30C16.5523 30 17 29.5523 17 29V23H26C26.5523 23 27 22.5523 27 22C27 18.7651 25.8768 16.0087 23.5534 14.1497C23.1826 13.853 23 13.4832 23 13.1542V7C23 4.23858 20.7614 2 18 2H14ZM24.9566 21C24.7536 18.7275 23.8434 16.9432 22.3039 15.7113C21.5785 15.1308 21 14.2291 21 13.1542V7C21 5.34315 19.6569 4 18 4H14C12.3431 4 11 5.34315 11 7L11 13.1542C11 14.2291 10.4215 15.1308 9.69612 15.7113C8.15661 16.9432 7.24639 18.7275 7.04345 21H24.9566Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
