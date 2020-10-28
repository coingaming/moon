defmodule Moon.Assets.Icons.IconInfoCircle do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconInfoCircle-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M16 9C16.5523 9 17 9.44771 17 10L17 11C17 11.5523 16.5523 12 16 12C15.4477 12 15 11.5523 15 11L15 10C15 9.44771 15.4477 9 16 9Z" fill="currentColor"/> <path d="M17 15C17 14.4477 16.5523 14 16 14C15.4477 14 15 14.4477 15 15L15 23C15 23.5523 15.4477 24 16 24C16.5523 24 17 23.5523 17 23L17 15Z" fill="currentColor"/> <path fill-rule="evenodd" clip-rule="evenodd" d="M30 16C30 23.732 23.732 30 16 30C8.26801 30 2 23.732 2 16C2 8.26801 8.26802 2 16 2C23.732 2 30 8.26801 30 16ZM16 28C22.6274 28 28 22.6274 28 16C28 9.37258 22.6274 4 16 4C9.37259 4 4 9.37258 4 16C4 22.6274 9.37258 28 16 28Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
