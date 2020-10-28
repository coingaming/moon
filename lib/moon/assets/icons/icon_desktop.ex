defmodule Moon.Assets.Icons.IconDesktop do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconDesktop-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M3 5.00002L4 5.00002L3 5.00002ZM5 23L5 22L5 23ZM3 21L4 21L3 21ZM27 22L5 22L5 24L27 24L27 22ZM28 5L28 21L30 21L30 5L28 5ZM2 5.00002L2 21L4 21L4 5.00002L2 5.00002ZM27 2L5 2.00002L5 4.00002L27 4L27 2ZM30 5C30 3.34315 28.6569 2 27 2L27 4C27.5523 4 28 4.44772 28 5L30 5ZM4 5.00002C4 4.44774 4.44772 4.00002 5 4.00002L5 2.00002C3.34315 2.00003 2 3.34317 2 5.00002L4 5.00002ZM5 22C4.44772 22 4 21.5523 4 21L2 21C2 22.6569 3.34315 24 5 24L5 22ZM27 24C28.6569 24 30 22.6569 30 21L28 21C28 21.5523 27.5523 22 27 22L27 24Z" fill="currentColor"/> <path d="M29 19C29.5523 19 30 18.5523 30 18C30 17.4477 29.5523 17 29 17L29 19ZM3 17C2.44772 17 2 17.4477 2 18C2 18.5523 2.44772 19 3 19L3 17ZM29 17L3 17L3 19L29 19L29 17Z" fill="currentColor"/> <path d="M22 30C22.5523 30 23 29.5523 23 29C23 28.4477 22.5523 28 22 28V30ZM10 28C9.44771 28 9 28.4477 9 29C9 29.5523 9.44771 30 10 30V28ZM22 28H10V30H22V28Z" fill="currentColor"/> <path d="M11 29C11 29.5523 11.4477 30 12 30C12.5523 30 13 29.5523 13 29L11 29ZM13 23C13 22.4477 12.5523 22 12 22C11.4477 22 11 22.4477 11 23L13 23ZM13 29L13 23L11 23L11 29L13 29Z" fill="currentColor"/> <path d="M19 29C19 29.5523 19.4477 30 20 30C20.5523 30 21 29.5523 21 29L19 29ZM21 23C21 22.4477 20.5523 22 20 22C19.4477 22 19 22.4477 19 23L21 23ZM21 29L21 23L19 23L19 29L21 29Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
