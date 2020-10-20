defmodule Moon.Assets.Logos.LogoMissions do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(height, :string)
  prop(width, :string)
  prop(font_size, :string)
  prop(vertical_align, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Logos-LogoMissions-#{assigns.color}-#{assigns.height}-#{assigns.width}-#{
          assigns.font_size
        }-#{assigns.vertical_align}"
      )

    ~H"""
    <Context get={{ theme: theme }}>
    <style>
      .{{ class_name }} {
        vertical-align: middle;
        width: 1em;
        
        color: {{ get_color(@color, theme) }};
        height: {{ @height }};
        width: {{ @width }};
        font-size: {{ @font_size }};
        vertical-align: {{ @vertical_align }};
        overflow: hidden;
      }
    </style>

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg"> <ellipse cx="27.1917" cy="21.3057" rx="10.3709" ry="10.3709" transform="rotate(-15 27.1917 21.3057)" fill="#FF385C"/> <ellipse cx="13.7017" cy="26.8477" rx="10.3709" ry="10.3709" transform="rotate(-15 13.7017 26.8477)" fill="#6A36CA"/> <circle cx="15.8012" cy="13.7017" r="10.3709" transform="rotate(-15 15.8012 13.7017)" fill="#FFB319"/> </svg>
    </Context>
    """
  end
end
