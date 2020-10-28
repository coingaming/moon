defmodule Moon.Assets.Icons.IconArrowLUp do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconArrowLUp-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M4 15.1C3.7 15.1 3.5 15 3.3 14.8C2.9 14.4 2.9 13.8 3.3 13.4L13.7 2.99999C15 1.69999 17 1.69999 18.3 2.99999L28.7 13.4C29.1 13.8 29.1 14.4 28.7 14.8C28.3 15.2 27.7 15.2 27.3 14.8L16.9 4.39999C16.4 3.89999 15.5 3.89999 15.1 4.39999L4.7 14.8C4.5 15 4.3 15.1 4 15.1Z" fill="currentColor"/> <path d="M16 30C15.4 30 15 29.6 15 29V3.09999C15 2.49999 15.4 2.09999 16 2.09999C16.6 2.09999 17 2.49999 17 3.09999V29C17 29.5 16.6 30 16 30Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
