defmodule Moon.Assets.Icons.IconChartBar do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconChartBar-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M12.6667 5C12.6667 5.55228 12.219 6 11.6667 6L5.00003 6C4.44774 6 4.00003 5.55228 4.00003 5C4.00003 4.44772 4.44774 4 5.00003 4H11.6667C12.219 4 12.6667 4.44772 12.6667 5Z" fill="currentColor"/> <path d="M2 29C2 28.4477 2.44772 28 3 28H29C29.5523 28 30 28.4477 30 29C30 29.5523 29.5523 30 29 30H3C2.44772 30 2 29.5523 2 29Z" fill="currentColor"/> <path d="M18.3333 12C18.8856 12 19.3333 11.5523 19.3333 11C19.3333 10.4477 18.8856 10 18.3333 10H5C4.44772 10 4 10.4477 4 11C4 11.5523 4.44772 12 5 12H18.3333Z" fill="currentColor"/> <path d="M19.3333 23C19.3333 23.5523 18.8856 24 18.3333 24H5C4.44772 24 4 23.5523 4 23C4 22.4477 4.44772 22 5 22H18.3333C18.8856 22 19.3333 22.4477 19.3333 23Z" fill="currentColor"/> <path d="M25 18C25.5523 18 26 17.5523 26 17C26 16.4477 25.5523 16 25 16C17.1895 16.0754 12.8105 16.0883 5 16C4.44772 16 4 16.4477 4 17C4 17.5523 4.44772 18 5 18H25Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
