defmodule Moon.Assets.Icons.IconCurrencyETH do
  use Moon.StatelessComponent
  use Moon.Components.Context

  property(color, :string)
  property(background_color, :string)
  property(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconCurrencyETH-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="auto" height="1em"  viewBox="0 0 48 77" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M23.6334 0L23.1172 1.75459V52.6687L23.6334 53.184L47.2672 39.2142L23.6334 0Z" fill="currentColor"/> <path d="M23.6338 0L0 39.2142L23.6338 53.1842V28.472V0Z" fill="currentColor"/> <path d="M23.6337 57.6589L23.3428 58.0135V76.1502L23.6337 77L47.2815 43.696L23.6337 57.6589Z" fill="currentColor"/> <path d="M23.6338 76.9997V57.6586L0 43.6958L23.6338 76.9997Z" fill="currentColor"/> <path d="M23.6338 53.184L47.2672 39.2143L23.6338 28.4722V53.184Z" fill="currentColor"/> <path d="M0 39.2143L23.6334 53.184V28.4722L0 39.2143Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
