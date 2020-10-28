defmodule Moon.Assets.Icons.IconPencil do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconPencil-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path fill-rule="evenodd" clip-rule="evenodd" d="M19.7929 3.74262C22.1164 1.4191 25.8836 1.41911 28.2071 3.74263C30.5306 6.06615 30.5306 9.83332 28.2071 12.1568L12.4142 27.9497L29 27.9497C29.5523 27.9497 30 28.3974 30 28.9497C30 29.502 29.5523 29.9497 29 29.9497L3 29.9497C2.44772 29.9497 2 29.502 2 28.9497L2 21.9497C2 21.6845 2.10536 21.4301 2.29289 21.2426L19.7929 3.74262ZM9.58578 27.9497L23.0858 14.4497L17.5 8.86394L4 22.3639L4 27.9497H9.58578ZM18.9142 7.44973L24.5 13.0355L26.7929 10.7426C28.3354 9.20016 28.3354 6.69931 26.7929 5.15684C25.2504 3.61437 22.7496 3.61437 21.2071 5.15684L18.9142 7.44973Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
