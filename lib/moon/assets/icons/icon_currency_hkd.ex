defmodule Moon.Assets.Icons.IconCurrencyHKD do
  use Moon.StatelessComponent
  use Moon.Components.Context

  property(color, :string)
  property(background_color, :string)
  property(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconCurrencyHKD-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="auto"  viewBox="0 0 20 8" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M0 7.93651H1.54042V4.82897H4.68636V7.93651H6.21594V0H4.68636V3.4317H1.54042V0H0V7.93651Z" fill="currentColor"/> <path d="M6.79698 7.93651H8.32656V5.66734L9.07508 4.75073L11.1362 7.93651H13.0238L10.0839 3.49877L12.9261 0H10.9843L8.34826 3.47641H8.32656V0H6.79698V7.93651Z" fill="currentColor"/> <path d="M13.4478 7.93651H16.0296C18.503 7.93651 20 6.31567 20 3.97943C20 1.63201 18.4379 0 15.9971 0H13.4478V7.93651ZM14.9557 6.53924V1.39727H16.0188C17.4182 1.39727 18.4053 2.49273 18.4053 3.97943C18.4053 5.4326 17.429 6.53924 15.932 6.53924H14.9557Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
