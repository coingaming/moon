defmodule Moon.Assets.Icons.IconCloseSmall do
  use Moon.StatelessComponent
  use Moon.Components.Context

  property(color, :string)
  property(background_color, :string)
  property(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconCloseSmall-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M12 6L6 12" stroke="currentColor" stroke-width="1.8" stroke-miterlimit="10" stroke-linecap="round"/> <path d="M6 6L12 12" stroke="currentColor" stroke-width="1.8" stroke-miterlimit="10" stroke-linecap="round"/> </svg>
    </Context>
    """
  end
end
