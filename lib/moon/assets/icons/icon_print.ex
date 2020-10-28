defmodule Moon.Assets.Icons.IconPrint do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconPrint-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path fill-rule="evenodd" clip-rule="evenodd" d="M5 7V10C3.34315 10 2 11.3431 2 13V22C2 23.6569 3.34315 25 5 25H6V27C6 28.6569 7.34315 30 9 30H23C24.6569 30 26 28.6569 26 27V25H27C28.6569 25 30 23.6569 30 22V13C30 11.3431 28.6569 10 27 10V7C27 4.23858 24.7614 2 22 2H10C7.23858 2 5 4.23858 5 7ZM10 4C8.34315 4 7 5.34315 7 7V10H25V7C25 5.34315 23.6569 4 22 4H10ZM26 23H27C27.5523 23 28 22.5523 28 22V13C28 12.4477 27.5523 12 27 12H5C4.44772 12 4 12.4477 4 13V22C4 22.5523 4.44772 23 5 23H6V21C6 19.3431 7.34315 18 9 18H23C24.6569 18 26 19.3431 26 21V23ZM8 21C8 20.4477 8.44772 20 9 20H23C23.5523 20 24 20.4477 24 21V27C24 27.5523 23.5523 28 23 28H9C8.44772 28 8 27.5523 8 27V21Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
