defmodule Moon.Assets.Icons.IconLink do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconLink-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M12 20L20 12" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/> <path d="M15.3744 8.6967L19.4601 4.61088C21.608 2.463 25.0904 2.463 27.2383 4.61088C29.3862 6.75877 29.3862 10.2412 27.2383 12.3891L24.0564 15.5711M16.4853 23.1421L12.3891 27.2383C10.2412 29.3862 6.7588 29.3862 4.61092 27.2383C2.46303 25.0904 2.46303 21.608 4.61092 19.4602L8.5 15.5711" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/> </svg>
    </Context>
    """
  end
end
