defmodule Moon.Assets.Icons.IconChartBar do
  use Moon.StatelessComponent
  use Moon.Components.Context

  property(color, :string)
  property(background_color, :string)
  property(font_size, :string)

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

    <svg class={{ class_name }} width="1em" height="auto"  viewBox="0 0 28 26" fill="none" xmlns="http://www.w3.org/2000/svg">  <path d="M10.6667 1C10.6667 1.55228 10.219 2 9.66669 2L3.00003 2C2.44774 2 2.00003 1.55228 2.00003 1C2.00003 0.447715 2.44774 0 3.00003 0H9.66669C10.219 0 10.6667 0.447715 10.6667 1Z" fill="currentColor"/>  <path d="M0 25C0 24.4477 0.447715 24 1 24H27C27.5523 24 28 24.4477 28 25C28 25.5523 27.5523 26 27 26H1C0.447715 26 0 25.5523 0 25Z" fill="currentColor"/>  <path d="M16.3333 8C16.8856 8 17.3333 7.55229 17.3333 7C17.3333 6.44772 16.8856 6 16.3333 6H3C2.44772 6 2 6.44772 2 7C2 7.55229 2.44772 8 3 8H16.3333Z" fill="currentColor"/>  <path d="M17.3333 19C17.3333 19.5523 16.8856 20 16.3333 20H3C2.44772 20 2 19.5523 2 19C2 18.4477 2.44772 18 3 18H16.3333C16.8856 18 17.3333 18.4477 17.3333 19Z" fill="currentColor"/>  <path d="M23 14C23.5523 14 24 13.5523 24 13C24 12.4477 23.5523 12 23 12C15.1895 12.0754 10.8105 12.0883 3 12C2.44772 12 2 12.4477 2 13C2 13.5523 2.44772 14 3 14H23Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
