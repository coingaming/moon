defmodule Moon.Assets.Icons.IconTimer do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconTimer-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M4 16C4 9.37258 9.37258 4 16 4C22.6274 4 28 9.37258 28 16C28 22.6274 22.6274 28 16 28C15.4477 28 15 28.4477 15 29C15 29.5523 15.4477 30 16 30C23.732 30 30 23.732 30 16C30 8.26801 23.732 2 16 2C8.26801 2 2 8.26801 2 16C2 16.5523 2.44772 17 3 17C3.55228 17 4 16.5523 4 16Z" fill="currentColor"/> <path d="M16.6402 18.7682C16.8682 18.5782 17 18.2968 17 18V9C17 8.44771 16.5523 8 16 8C15.4477 8 15 8.44771 15 9V17.5316L9.35981 22.2318C8.93554 22.5853 8.87821 23.2159 9.23178 23.6402C9.58534 24.0645 10.2159 24.1218 10.6402 23.7682L16.6402 18.7682Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
