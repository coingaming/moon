defmodule Moon.Assets.Icons.IconCloseSmall do
  use Moon.StatelessComponent

  property color, :string
  property background_color, :string

  false

  def render(assigns) do
    class_name =
      get_class_name("Icons-IconCloseSmall-#{assigns[:color]}-#{assigns[:background_color]}")

    false

    ~H"""
    <style>
      .{{ class_name }} {
        vertical-align: middle;

        
        color: {{ @color }};
        background-color: {{ @background_color }};
        display: inline-block;
        overflow: hidden;
        

        
      }
    </style>

    <svg class={{ class_name }} width="1em" height="1em" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M12 6L6 12" stroke="currentColor" stroke-width="1.8" stroke-miterlimit="10" stroke-linecap="round"/> <path d="M6 6L12 12" stroke="currentColor" stroke-width="1.8" stroke-miterlimit="10" stroke-linecap="round"/> </svg>
    """
  end
end
