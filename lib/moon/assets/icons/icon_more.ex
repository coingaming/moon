defmodule Moon.Assets.Icons.IconMore do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconMore-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M6.3 13.7C7.5 13.7 8.6 14.7 8.6 16C8.6 17.3 7.6 18.3 6.3 18.3C5 18.3 4 17.2 4 16C4 14.8 5 13.7 6.3 13.7ZM6.3 11.7C3.9 11.7 2 13.6 2 16C2 18.4 3.9 20.3 6.3 20.3C8.7 20.3 10.6 18.4 10.6 16C10.6 13.6 8.6 11.7 6.3 11.7Z" fill="currentColor"/> <path d="M16 13.7C17.2 13.7 18.3 14.7 18.3 16C18.3 17.3 17.3 18.3 16 18.3C14.7 18.3 13.7 17.3 13.7 16C13.7 14.7 14.8 13.7 16 13.7ZM16 11.7C13.6 11.7 11.7 13.6 11.7 16C11.7 18.4 13.6 20.3 16 20.3C18.4 20.3 20.3 18.4 20.3 16C20.3 13.6 18.4 11.7 16 11.7Z" fill="currentColor"/> <path d="M25.7 13.7C26.9 13.7 28 14.7 28 16C28 17.3 27 18.3 25.7 18.3C24.4 18.3 23.4 17.3 23.4 16C23.4 14.7 24.5 13.7 25.7 13.7ZM25.7 11.7C23.3 11.7 21.4 13.6 21.4 16C21.4 18.4 23.3 20.3 25.7 20.3C28.1 20.3 30 18.4 30 16C30 13.6 28.1 11.7 25.7 11.7Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
