defmodule Moon.Assets.Icons.IconCurrencyINR do
  use Moon.StatelessComponent
  use Moon.Components.Context

  property(color, :string)
  property(background_color, :string)
  property(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconCurrencyINR-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="auto" height="1em"  viewBox="0 0 32 44" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M31.1124 7.19998V0.0319824H0.648438V6.87998H8.13644C11.6564 6.87998 13.2564 8.41598 13.8964 10.784H0.648438V16.608H13.8964C13.2564 19.04 11.5284 20.64 7.94444 20.64H0.648438V28.192L16.9044 44H29.8324L13.8324 28.576V28.448C20.1684 27.168 24.5844 23.328 25.2244 17.184H31.1124V10.528H24.2644C23.7524 9.37598 23.0484 8.28798 22.2164 7.32798V7.19998H31.1124Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
