defmodule Moon.Assets.Icons.IconTable do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconTable-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path fill-rule="evenodd" clip-rule="evenodd" d="M14 24H22V29C22 29.5523 22.4477 30 23 30C23.5523 30 24 29.5523 24 29V24H29C29.5523 24 30 23.5523 30 23C30 22.4477 29.5523 22 29 22H24L24 14H29C29.5523 14 30 13.5523 30 13C30 12.4477 29.5523 12 29 12H24V4H29C29.5523 4 30 3.55228 30 3C30 2.44772 29.5523 2 29 2H5C3.34315 2 2 3.34315 2 5V29C2 29.5523 2.44772 30 3 30C3.55228 30 4 29.5523 4 29V24H12V29C12 29.5523 12.4477 30 13 30C13.5523 30 14 29.5523 14 29V24ZM5 4C4.44772 4 4 4.44772 4 5V12H12V4L5 4ZM14 4V12H22V4L14 4ZM12 14H4V22H12L12 14ZM14 22L14 14H22L22 22H14Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
