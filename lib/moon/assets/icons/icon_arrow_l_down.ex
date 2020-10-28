defmodule Moon.Assets.Icons.IconArrowLDown do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconArrowLDown-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M16 30C15.2 30 14.3 29.7 13.7 29L3.3 18.6C2.9 18.2 2.9 17.6 3.3 17.2C3.7 16.8 4.3 16.8 4.7 17.2L15.1 27.6C15.6 28.1 16.5 28.1 16.9 27.6L27.3 17.2C27.7 16.8 28.3 16.8 28.7 17.2C29.1 17.6 29.1 18.2 28.7 18.6L18.3 29C17.7 29.6 16.8 30 16 30Z" fill="currentColor"/> <path d="M16 29.9C15.4 29.9 15 29.5 15 28.9V3C15 2.4 15.4 2 16 2C16.6 2 17 2.4 17 3V28.8C17 29.4 16.6 29.9 16 29.9Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
