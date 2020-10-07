defmodule Moon.Assets.Icons.IconCloseSmall do
  use Moon.StatelessComponent

  property color, :string
  property background_color, :string

  def render(assigns) do
    class_name =
      get_class_name("Icons-IconCloseSmall-#{assigns[:color]}-#{assigns[:background_color]}")

    ~H"""
    <style>
      .{{ class_name }} {
        vertical-align: middle;
        color: {{ @color }};
        background-color: {{ @background_color }};
      }
    </style>

    <svg class={{ class_name }} width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M12 6L6 12" stroke="currentColor" stroke-width="1.8" stroke-miterlimit="10" stroke-linecap="round"/> <path d="M6 6L12 12" stroke="currentColor" stroke-width="1.8" stroke-miterlimit="10" stroke-linecap="round"/> </svg>
    """
  end
end
