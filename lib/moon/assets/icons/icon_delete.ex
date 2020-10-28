defmodule Moon.Assets.Icons.IconDelete do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconDelete-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path fill-rule="evenodd" clip-rule="evenodd" d="M10 5C10 3.34315 11.3431 2 13 2H19C20.6569 2 22 3.34315 22 5V6H29C29.5523 6 30 6.44772 30 7C30 7.55228 29.5523 8 29 8H27V25C27 27.7614 24.7614 30 22 30H10C7.23858 30 5 27.7614 5 25V8H3C2.44772 8 2 7.55228 2 7C2 6.44772 2.44772 6 3 6H10V5ZM12 6H20V5C20 4.44772 19.5523 4 19 4H13C12.4477 4 12 4.44772 12 5V6ZM7 8V25C7 26.6569 8.34315 28 10 28H22C23.6569 28 25 26.6569 25 25V8H7ZM16 11C16.5523 11 17 11.4477 17 12L17 24C17 24.5523 16.5523 25 16 25C15.4477 25 15 24.5523 15 24L15 12C15 11.4477 15.4477 11 16 11Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
