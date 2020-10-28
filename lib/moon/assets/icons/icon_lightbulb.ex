defmodule Moon.Assets.Icons.IconLightbulb do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconLightbulb-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M15.9999 4C20.4999 4 24.0999 7.6 24.0999 12.1C24.0999 14.1 23.2999 15.8 21.6999 17.4C20.8999 18.2 20.3999 19.3 20.0999 20.2C19.3999 22 18.9999 23 15.9999 23C12.9999 23 12.5999 22 11.8999 20.2C11.4999 19.3 11.0999 18.2 10.2999 17.4C8.6999 15.8 7.8999 14.1 7.8999 12.1C7.8999 7.6 11.4999 4 15.9999 4ZM15.9999 2C10.3999 2 5.8999 6.5 5.8999 12.1C5.8999 14.9 6.9999 17 8.8999 18.8C10.6999 20.6 9.7999 25.1 15.9999 25.1C22.2999 25.1 21.2999 20.7 23.0999 18.8C24.8999 17 26.0999 14.8 26.0999 12.1C26.0999 6.5 21.5999 2 15.9999 2Z" fill="currentColor"/> <path d="M15.9999 30C13.9999 30 12.3999 28.6 12.3999 26.8V24.2H14.3999V26.8C14.3999 27.5 15.0999 28 15.9999 28C16.8999 28 17.5999 27.4 17.5999 26.8V24.2H19.5999V26.8C19.5999 28.5 17.9999 30 15.9999 30Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
