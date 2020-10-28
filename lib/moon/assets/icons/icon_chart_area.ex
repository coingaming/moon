defmodule Moon.Assets.Icons.IconChartArea do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconChartArea-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path fill-rule="evenodd" clip-rule="evenodd" d="M29 3C29 2.62542 28.7906 2.28224 28.4576 2.11084C28.1245 1.93943 27.7235 1.96855 27.4187 2.18627L14.0144 11.7608L10.6 9.19999C10.2292 8.92189 9.71589 8.93505 9.35982 9.23177L3.35982 14.2318C3.13182 14.4218 3 14.7032 3 15L3.00002 23.992C3.00002 24.5443 3.44774 24.992 4.00002 24.992H28C28.5523 24.992 29 24.5443 29 23.992V3ZM14.5812 13.8137L27 4.94319V22.992H5.00002L5 15.4684L10.0327 11.2745L13.4 13.8C13.7487 14.0615 14.2266 14.0671 14.5812 13.8137Z" fill="currentColor"/> <path d="M3 28C2.44772 28 2 28.4477 2 29C2 29.5523 2.44772 30 3 30H29C29.5523 30 30 29.5523 30 29C30 28.4477 29.5523 28 29 28H3Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
