defmodule Moon.Assets.Icons.IconRow do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconRow-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <rect x="3" y="3" width="26" height="5" rx="2" stroke="currentColor" stroke-width="2" stroke-linecap="round"/> <rect x="3" y="12" width="26" height="8" rx="2" stroke="currentColor" stroke-width="2" stroke-linecap="round"/> <rect x="3" y="24" width="26" height="5" rx="2" stroke="currentColor" stroke-width="2" stroke-linecap="round"/> </svg>
    </Context>
    """
  end
end
