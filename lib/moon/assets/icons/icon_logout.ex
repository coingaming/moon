defmodule Moon.Assets.Icons.IconLogout do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconLogout-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg">  <path d="M7 27C7 26.4477 7.44771 26 8 26H23C24.6569 26 26 24.6569 26 23L26 5C26 3.34315 24.6569 2 23 2L8 2C7.44771 2 7 1.55229 7 1C7 0.447716 7.44771 0 8 0H23C25.7614 0 28 2.23858 28 5L28 23C28 25.7614 25.7614 28 23 28H8C7.44771 28 7 27.5523 7 27Z" fill="currentColor"/>  <path d="M3.41421 15L7.70711 19.2929C8.09763 19.6834 8.09763 20.3166 7.70711 20.7071C7.31658 21.0976 6.68342 21.0976 6.29289 20.7071L0.292893 14.7071C-0.0976311 14.3166 -0.0976311 13.6834 0.292893 13.2929L6.29289 7.29289C6.68342 6.90237 7.31658 6.90237 7.70711 7.29289C8.09763 7.68342 8.09763 8.31658 7.70711 8.70711L3.41421 13L21 13C21.5523 13 22 13.4477 22 14C22 14.5523 21.5523 15 21 15L3.41421 15Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
