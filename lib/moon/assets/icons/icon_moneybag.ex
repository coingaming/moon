defmodule Moon.Assets.Icons.IconMoneybag do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconMoneybag-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M15.5999 30C9.6999 30 2.3999 30 2.3999 22.2C2.3999 15 12.4999 9.69999 12.8999 9.39999C13.3999 9.09999 13.9999 9.29999 14.1999 9.79999C14.4999 10.3 14.2999 10.9 13.7999 11.1C13.6999 11.1 4.2999 16.1 4.2999 22.1C4.2999 27.5 8.4999 27.9 15.4999 27.9C22.5999 27.9 27.5999 27.5 27.5999 22.2C27.5999 16.3 18.2999 11.2 18.1999 11.2C17.6999 10.9 17.4999 10.3 17.7999 9.79999C18.0999 9.29999 18.6999 9.09999 19.1999 9.39999C19.5999 9.59999 29.6999 15.1 29.6999 22.2C29.5999 30 21.4999 30 15.5999 30Z" fill="currentColor"/> <path d="M16.0999 12.4C13.9999 12.4 11.8999 10.8 10.6999 8.19999C9.89986 6.59999 9.39986 4.39999 10.3999 3.09999C11.5999 1.59999 13.1999 1.99999 14.2999 2.39999C14.8999 2.59999 15.4999 2.79999 16.0999 2.79999C16.6999 2.79999 17.2999 2.59999 17.8999 2.39999C19.0999 2.09999 20.5999 1.59999 21.7999 3.09999C22.7999 4.29999 22.1999 6.59999 21.4999 8.19999C20.2999 10.8 18.2999 12.4 16.0999 12.4ZM12.4999 3.99999C12.1999 3.99999 12.0999 4.09999 11.8999 4.29999C11.6999 4.49999 11.6999 5.69999 12.4999 7.29999C13.1999 8.79999 14.5999 10.3 16.0999 10.3C17.6999 10.3 18.9999 8.69999 19.6999 7.29999C20.4999 5.69999 20.3999 4.49999 20.2999 4.29999C19.9999 3.89999 19.6999 3.89999 18.4999 4.29999C17.7999 4.49999 16.9999 4.69999 16.0999 4.69999C15.1999 4.69999 14.3999 4.49999 13.6999 4.29999C13.0999 4.09999 12.7999 3.99999 12.4999 3.99999Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
