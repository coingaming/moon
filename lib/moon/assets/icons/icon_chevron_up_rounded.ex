defmodule Moon.Assets.Icons.IconChevronUpRounded do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconChevronUpRounded-#{assigns.color}-#{assigns.background_color}-#{
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path fill-rule="evenodd" clip-rule="evenodd" d="M29.7266 23.66C29.3621 24.0245 28.7712 24.0245 28.4067 23.66L16 11.2533L3.5933 23.66C3.22881 24.0245 2.63786 24.0245 2.27337 23.66C1.90888 23.2955 1.90888 22.7045 2.27337 22.34L15.34 9.27337C15.7045 8.90888 16.2955 8.90888 16.66 9.27337L29.7266 22.34C30.0911 22.7045 30.0911 23.2955 29.7266 23.66Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
