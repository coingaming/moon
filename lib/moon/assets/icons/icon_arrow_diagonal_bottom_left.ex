defmodule Moon.Assets.Icons.IconArrowDiagonalBottomLeft do
  use Moon.StatelessComponent
  use Moon.Components.Context

  property(color, :string)
  property(background_color, :string)
  property(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconArrowDiagonalBottomLeft-#{assigns.color}-#{assigns.background_color}-#{
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

    <svg class={{ class_name }} width="auto" height="1em"  viewBox="0 0 28 29" fill="none" xmlns="http://www.w3.org/2000/svg">  <path d="M0.286344 27.7005C0.290152 27.7044 0.293999 27.7083 0.297884 27.7122C0.518595 27.9328 0.816755 28.0288 1.10481 28L15 28C15.5523 28 16 27.5523 16 27C16 26.4477 15.5523 26 15 26L3.42339 26L27.7071 1.70696C28.0976 1.31636 28.0974 0.683191 27.7068 0.292742C27.3162 -0.0977072 26.6831 -0.0975853 26.2926 0.293014L2 24.595V13C2 12.4477 1.55229 12 1 12C0.447715 12 0 12.4477 0 13V27C0 27.2728 0.109232 27.5201 0.286344 27.7005Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
