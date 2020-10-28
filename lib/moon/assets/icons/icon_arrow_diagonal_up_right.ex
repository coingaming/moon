defmodule Moon.Assets.Icons.IconArrowDiagonalUpRight do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconArrowDiagonalUpRight-#{assigns.color}-#{assigns.background_color}-#{
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M14.995 2C14.4427 2 13.995 2.44772 13.995 3C13.995 3.55228 14.4427 4 14.995 4L26.5815 4L2.29276 28.298C1.90231 28.6886 1.90243 29.3218 2.29303 29.7123C2.68363 30.1027 3.31679 30.1026 3.70724 29.712L27.995 5.41493V17C27.995 17.5523 28.4427 18 28.995 18C29.5473 18 29.995 17.5523 29.995 17V3.00743V3C29.995 2.97703 29.9942 2.95424 29.9927 2.93165C29.9944 2.95688 29.9952 2.98216 29.995 3.00743" fill="currentColor"/> <path d="M29.7042 2.29502C29.7013 2.29211 29.6984 2.28922 29.6955 2.28634C29.6977 2.28848 29.6998 2.29063 29.702 2.29279L29.7042 2.29502Z" fill="currentColor"/> <path d="M29.3973 2.08423C29.2742 2.03007 29.1381 2 28.995 2H14.995" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
