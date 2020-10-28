defmodule Moon.Assets.Icons.IconText do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconText-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M11 18C11 17.4477 11.4477 17 12 17H20C20.5523 17 21 17.4477 21 18C21 18.5523 20.5523 19 20 19H12C11.4477 19 11 18.5523 11 18Z" fill="currentColor"/> <path d="M11 23C11 22.4477 11.4477 22 12 22H16C16.5523 22 17 22.4477 17 23C17 23.5523 16.5523 24 16 24H12C11.4477 24 11 23.5523 11 23Z" fill="currentColor"/> <path fill-rule="evenodd" clip-rule="evenodd" d="M13 2C12.7348 2 12.4805 2.10536 12.2929 2.29289L5.29293 9.29289C5.10539 9.48043 5.00003 9.73478 5.00003 10L5 25C4.99999 27.7614 7.23857 30 10 30H22C24.7615 30 27 27.7614 27 25L27 7C27 4.23858 24.7615 2 22 2H13ZM13 10V4.41425L7.41425 10H13ZM14 12H7.00003L7 25C7 26.6569 8.34314 28 10 28H22C23.6569 28 25 26.6569 25 25L25 7C25 5.34315 23.6569 4 22 4H15V11C15 11.5523 14.5523 12 14 12Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
