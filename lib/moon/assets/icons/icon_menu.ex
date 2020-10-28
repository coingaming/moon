defmodule Moon.Assets.Icons.IconMenu do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconMenu-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M26.7001 14.2V17.8H5.30005V14.2H26.7001ZM26.7001 12.2H5.30005C4.20005 12.2 3.30005 13.1 3.30005 14.2V17.8C3.30005 18.9 4.20005 19.8 5.30005 19.8H26.7001C27.8001 19.8 28.7001 18.9 28.7001 17.8V14.2C28.7001 13.1 27.8001 12.2 26.7001 12.2Z" fill="currentColor"/> <path d="M16 4C22.4 4 24.4 4.5 24.4 4.5H24.5H24.6C25.6 4.8 26.8 5.3 26.8 6.4V7.5H5.30005V6.5C5.30005 5.6 6.00005 5 7.50005 4.6H7.60005C7.60005 4.6 9.50005 4 16 4ZM16 2C8.90005 2 6.90005 2.7 6.90005 2.7C5.00005 3.2 3.30005 4.4 3.30005 6.5V7.8C3.30005 8.8 4.10005 9.6 5.00005 9.6H27C28 9.6 28.7001 8.8 28.7001 7.8V6.5C28.7001 4.4 27 3.2 25 2.6C25.1 2.7 23.1 2 16 2Z" fill="currentColor"/> <path d="M26.7001 24.4V25.5C26.7001 26.4 26 27 24.5 27.4H24.4C24.4 27.4 22.4 28 15.9 28C9.50005 28 7.50005 27.5 7.50005 27.5H7.40005H7.30005C6.30005 27.2 5.10005 26.7 5.10005 25.6V24.5H26.7001V24.4ZM27 22.4H5.00005C4.00005 22.4 3.30005 23.2 3.30005 24.2V25.5C3.30005 27.6 5.00005 28.8 7.00005 29.4C7.00005 29.4 8.90005 30.1 16.1 30.1C23.3 30.1 25.2001 29.4 25.2001 29.4C27.2001 28.9 28.9 27.7 28.9 25.5V24.2C28.7 23.2 27.9 22.4 27 22.4Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
