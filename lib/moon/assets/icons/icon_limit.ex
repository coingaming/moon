defmodule Moon.Assets.Icons.IconLimit do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconLimit-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M7.3 4C9.1 4 10.6 5.5 10.6 7.3C10.6 9.1 9.1 10.6 7.3 10.6C5.5 10.6 4 9.2 4 7.3C4 5.4 5.5 4 7.3 4ZM7.3 2C4.4 2 2 4.4 2 7.3C2 10.2 4.4 12.6 7.3 12.6C10.2 12.6 12.6 10.2 12.6 7.3C12.6 4.4 10.3 2 7.3 2Z" fill="currentColor"/> <path d="M24.7 21.3C26.5 21.3 28 22.8 28 24.6C28 26.4 26.5 28 24.7 28C22.9 28 21.4 26.5 21.4 24.7C21.4 22.9 22.8 21.3 24.7 21.3ZM24.7 19.3C21.8 19.3 19.4 21.7 19.4 24.6C19.4 27.5 21.8 29.9 24.7 29.9C27.6 29.9 30 27.5 30 24.6C30 21.7 27.6 19.3 24.7 19.3Z" fill="currentColor"/> <path d="M3.30005 29.7C3.00005 29.7 2.80005 29.6 2.60005 29.4C2.20005 29 2.20005 28.4 2.60005 28L28 2.6C28.4 2.2 29 2.2 29.4 2.6C29.8 3 29.8 3.6 29.4 4L4.00005 29.4C3.80005 29.6 3.60005 29.7 3.30005 29.7Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
