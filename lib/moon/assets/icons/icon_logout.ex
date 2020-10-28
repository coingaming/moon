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
        width: 1em;
        color: {{ get_color(@color, theme) }};
        background-color: {{ get_color(@background_color, theme) }};
        font-size: {{ @font_size }};
        display: inline-block;
        overflow: hidden;
        
      }
    </style>

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M9 29C9 28.4477 9.44771 28 10 28H25C26.6569 28 28 26.6569 28 25L28 7C28 5.34315 26.6569 4 25 4L10 4C9.44771 4 9 3.55229 9 3C9 2.44772 9.44771 2 10 2H25C27.7614 2 30 4.23858 30 7L30 25C30 27.7614 27.7614 30 25 30H10C9.44771 30 9 29.5523 9 29Z" fill="currentColor"/> <path d="M5.41421 17L9.70711 21.2929C10.0976 21.6834 10.0976 22.3166 9.70711 22.7071C9.31658 23.0976 8.68342 23.0976 8.29289 22.7071L2.29289 16.7071C1.90237 16.3166 1.90237 15.6834 2.29289 15.2929L8.29289 9.29289C8.68342 8.90237 9.31658 8.90237 9.70711 9.29289C10.0976 9.68342 10.0976 10.3166 9.70711 10.7071L5.41421 15L23 15C23.5523 15 24 15.4477 24 16C24 16.5523 23.5523 17 23 17L5.41421 17Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
