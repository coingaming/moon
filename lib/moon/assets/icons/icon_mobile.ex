defmodule Moon.Assets.Icons.IconMobile do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconMobile-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M21.5 4C22.9 4 24 5.1 24 6.5V25.6C24 27 22.9 28.1 21.5 28.1H10.5C9.1 28 8 26.9 8 25.5V6.5C8 5.1 9.1 4 10.5 4H21.5ZM21.5 2H10.5C8 2 6 4 6 6.5V25.6C6 28 8 30 10.5 30H21.5C23.9 30 26 28 26 25.5V6.5C26 4 24 2 21.5 2Z" fill="currentColor"/> <path d="M20.3 25.4H11.7C11.1 25.4 10.7 25 10.7 24.4C10.7 23.8 11.1 23.4 11.7 23.4H20.3C20.9 23.4 21.3 23.8 21.3 24.4C21.3 25 20.9 25.4 20.3 25.4Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
