defmodule Moon.Assets.Icons.IconArrowDiagonalDownLeft do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconArrowDiagonalDownLeft-#{assigns.color}-#{assigns.background_color}-#{
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M2.28634 29.7005C2.29015 29.7044 2.294 29.7083 2.29788 29.7122C2.5186 29.9328 2.81675 30.0288 3.10481 30L17 30C17.5523 30 18 29.5523 18 29C18 28.4477 17.5523 28 17 28L5.42339 28L29.7071 3.70696C30.0976 3.31636 30.0974 2.68319 29.7068 2.29274C29.3162 1.90229 28.6831 1.90241 28.2926 2.29301L4 26.595V15C4 14.4477 3.55229 14 3 14C2.44771 14 2 14.4477 2 15V29C2 29.2728 2.10923 29.5201 2.28634 29.7005Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
