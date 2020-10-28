defmodule Moon.Assets.Icons.IconChevronDownRounded do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconChevronDownRounded-#{assigns.color}-#{assigns.background_color}-#{
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path fill-rule="evenodd" clip-rule="evenodd" d="M2.27337 9.34003C2.63786 8.97555 3.22881 8.97555 3.5933 9.34003L16 21.7467L28.4067 9.34003C28.7712 8.97554 29.3621 8.97554 29.7266 9.34003C30.0911 9.70452 30.0911 10.2955 29.7266 10.66L16.66 23.7266C16.2955 24.0911 15.7045 24.0911 15.34 23.7266L2.27337 10.66C1.90888 10.2955 1.90888 9.70452 2.27337 9.34003Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
