defmodule Moon.Assets.Icons.IconChevronLeftRounded do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconChevronLeftRounded-#{assigns.color}-#{assigns.background_color}-#{
          assigns.font_size
        }"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path fill-rule="evenodd" clip-rule="evenodd" d="M23.66 2.27337C24.0245 2.63786 24.0245 3.22881 23.66 3.5933L11.2533 16L23.66 28.4067C24.0245 28.7712 24.0245 29.3621 23.66 29.7266C23.2955 30.0911 22.7045 30.0911 22.34 29.7266L9.27337 16.66C8.90888 16.2955 8.90888 15.7045 9.27337 15.34L22.34 2.27337C22.7045 1.90888 23.2955 1.90888 23.66 2.27337Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
