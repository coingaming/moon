defmodule Moon.Assets.Icons.IconPicture do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconPicture-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path fill-rule="evenodd" clip-rule="evenodd" d="M7.00001 4C5.34315 4 4 5.34314 4 7L4 18.5858L8.29289 14.2929C8.68342 13.9024 9.31658 13.9024 9.70711 14.2929L17.5 22.0858L22.2929 17.2929C22.6834 16.9024 23.3166 16.9024 23.7071 17.2929L28 21.5858L28 7.00004C28 5.34319 26.6569 4.00004 25 4.00004L7.00001 4ZM30 7.00004C30 4.23862 27.7614 2.00005 25 2.00004L7.00001 2C4.23858 1.99999 2 4.23857 2 7L2 25C2 27.7614 4.23857 30 7 30L25 30C27.7614 30 30 27.7614 30 25L30 7.00004ZM28 24.4142L23 19.4142L18.9142 23.5L23.4142 28H25C26.6569 28 28 26.6568 28 25V24.4142ZM20.5858 28L9 16.4142L4 21.4142L4 25C4 26.6568 5.34314 28 7 28L20.5858 28ZM22 7.99999C20.8954 7.99999 20 8.89542 20 9.99999C20 11.1046 20.8954 12 22 12C23.1046 12 24 11.1046 24 9.99999C24 8.89542 23.1046 7.99999 22 7.99999ZM18 9.99999C18 7.79085 19.7909 5.99999 22 5.99999C24.2091 5.99999 26 7.79085 26 9.99999C26 12.2091 24.2091 14 22 14C19.7909 14 18 12.2091 18 9.99999Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
