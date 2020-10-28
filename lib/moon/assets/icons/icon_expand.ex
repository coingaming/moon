defmodule Moon.Assets.Icons.IconExpand do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconExpand-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M2 11C2 11.5523 2.44772 12 3 12C3.55228 12 4 11.5523 4 11L4 5.40947L14.5861 16L4 26.5904V21C4 20.4477 3.55228 20 3 20C2.44771 20 2 20.4477 2 21V29C2 29.5523 2.44771 30 3 30L11 30C11.5523 30 12 29.5523 12 29C12 28.4477 11.5523 28 11 28H5.41887L16 17.4145L26.5811 28H21C20.4477 28 20 28.4477 20 29C20 29.5523 20.4477 30 21 30H29C29.5523 30 30 29.5523 30 29V21C30 20.4477 29.5523 20 29 20C28.4477 20 28 20.4477 28 21V26.5904L17.4139 16L28 5.40947V11C28 11.5523 28.4477 12 29 12C29.5523 12 30 11.5523 30 11L30 3C30 2.44771 29.5523 2 29 2H21C20.4477 2 20 2.44772 20 3C20 3.55229 20.4477 4 21 4L26.581 4L16 14.5854L5.41895 4L11 4C11.5523 4 12 3.55229 12 3C12 2.44772 11.5523 2 11 2H3C2.44772 2 2 2.44771 2 3V11Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
