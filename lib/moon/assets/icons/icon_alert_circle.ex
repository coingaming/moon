defmodule Moon.Assets.Icons.IconAlertCircle do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconAlertCircle-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M16 23C15.4477 23 15 22.5523 15 22V21C15 20.4477 15.4477 20 16 20C16.5523 20 17 20.4477 17 21V22C17 22.5523 16.5523 23 16 23Z" fill="currentColor"/> <path d="M15 17C15 17.5523 15.4477 18 16 18C16.5523 18 17 17.5523 17 17V9C17 8.44771 16.5523 8 16 8C15.4477 8 15 8.44771 15 9L15 17Z" fill="currentColor"/> <path fill-rule="evenodd" clip-rule="evenodd" d="M2 16C2 8.26801 8.26801 2 16 2C23.732 2 30 8.26801 30 16C30 23.732 23.732 30 16 30C8.26801 30 2 23.732 2 16ZM16 4C9.37258 4 4 9.37258 4 16C4 22.6274 9.37258 28 16 28C22.6274 28 28 22.6274 28 16C28 9.37258 22.6274 4 16 4Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
