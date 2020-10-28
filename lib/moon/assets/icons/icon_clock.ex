defmodule Moon.Assets.Icons.IconClock do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconClock-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M15.3598 17.7682C15.1318 17.5782 15 17.2968 15 17V8C15 7.44771 15.4477 7 16 7C16.5523 7 17 7.44771 17 8V16.5316L22.6402 21.2318C23.0644 21.5853 23.1218 22.2159 22.7682 22.6402C22.4146 23.0645 21.7841 23.1218 21.3598 22.7682L15.3598 17.7682Z" fill="currentColor"/> <path fill-rule="evenodd" clip-rule="evenodd" d="M16 2C8.26801 2 2 8.26801 2 16C2 23.732 8.26801 30 16 30C23.732 30 30 23.732 30 16C30 8.26801 23.732 2 16 2ZM4 16C4 9.37258 9.37258 4 16 4C22.6274 4 28 9.37258 28 16C28 22.6274 22.6274 28 16 28C9.37258 28 4 22.6274 4 16Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
