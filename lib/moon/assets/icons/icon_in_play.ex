defmodule Moon.Assets.Icons.IconInPlay do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconInPlay-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg"> <path fill-rule="evenodd" clip-rule="evenodd" d="M15 0H1C0.45 0 0 0.45 0 1V11C0 11.55 0.45 12 1 12H5.75L5.25 14H4C3.45 14 3 14.45 3 15C3 15.55 3.45 16 4 16H12C12.55 16 13 15.55 13 15C13 14.45 12.55 14 12 14H10.75L10.25 12H15C15.55 12 16 11.55 16 11V1C16 0.45 15.55 0 15 0ZM15 11H1V1H15V11Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
