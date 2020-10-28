defmodule Moon.Assets.Icons.IconClock do
  use Moon.StatelessComponent
  use Moon.Components.Context

  property(color, :string)
  property(background_color, :string)
  property(font_size, :string)

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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg">  <path d="M13.3598 15.7682C13.1318 15.5782 13 15.2968 13 15V6C13 5.44771 13.4477 5 14 5C14.5523 5 15 5.44771 15 6V14.5316L20.6402 19.2318C21.0644 19.5853 21.1218 20.2159 20.7682 20.6402C20.4146 21.0645 19.7841 21.1218 19.3598 20.7682L13.3598 15.7682Z" fill="currentColor"/>  <path fill-rule="evenodd" clip-rule="evenodd" d="M14 0C6.26801 0 0 6.26801 0 14C0 21.732 6.26801 28 14 28C21.732 28 28 21.732 28 14C28 6.26801 21.732 0 14 0ZM2 14C2 7.37258 7.37258 2 14 2C20.6274 2 26 7.37258 26 14C26 20.6274 20.6274 26 14 26C7.37258 26 2 20.6274 2 14Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
