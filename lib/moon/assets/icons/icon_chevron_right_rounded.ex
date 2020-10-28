defmodule Moon.Assets.Icons.IconChevronRightRounded do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconChevronRightRounded-#{assigns.color}-#{assigns.background_color}-#{
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path fill-rule="evenodd" clip-rule="evenodd" d="M9.34003 29.7266C8.97555 29.3621 8.97555 28.7712 9.34003 28.4067L21.7467 16L9.34003 3.5933C8.97554 3.22881 8.97554 2.63786 9.34003 2.27337C9.70452 1.90888 10.2955 1.90888 10.66 2.27337L23.7266 15.34C24.0911 15.7045 24.0911 16.2955 23.7266 16.66L10.66 29.7266C10.2955 30.0911 9.70453 30.0911 9.34003 29.7266Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
