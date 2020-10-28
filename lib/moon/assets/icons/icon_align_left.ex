defmodule Moon.Assets.Icons.IconAlignLeft do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconAlignLeft-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M28 4C28 4.55228 27.5523 5 27 5H5C4.44772 5 4 4.55228 4 4C4 3.44772 4.44772 3 5 3H27C27.5523 3 28 3.44772 28 4Z" fill="currentColor"/> <path d="M27 21C27.5523 21 28 20.5523 28 20C28 19.4477 27.5523 19 27 19H5C4.44772 19 4 19.4477 4 20C4 20.5523 4.44772 21 5 21H27Z" fill="currentColor"/> <path d="M16 29C16.5523 29 17 28.5523 17 28C17 27.4477 16.5523 27 16 27L5 27C4.44772 27 4 27.4477 4 28C4 28.5523 4.44772 29 5 29L16 29Z" fill="currentColor"/> <path d="M16 13C16.5523 13 17 12.5523 17 12C17 11.4477 16.5523 11 16 11H5C4.44771 11 4 11.4477 4 12C4 12.5523 4.44771 13 5 13H16Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
