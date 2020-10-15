defmodule Moon.Assets.Icons.IconLoyalty0 do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconLoyalty0-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
      )

    ~H"""
    <Context get={{ theme: theme }}>
    <style>
      .{{ class_name }} {
        vertical-align: middle;

        
        color: {{ get_color(@color, theme) }};
        background-color: {{ get_color(@background_color, theme) }};
        font-size: {{ @font_size }};
        display: inline-block;
        overflow: hidden;
        

        
      }
    </style>

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 42 42" fill="none" xmlns="http://www.w3.org/2000/svg"> <circle cx="21" cy="21" r="20" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-dasharray="56 8"/> </svg>
    </Context>
    """
  end
end
