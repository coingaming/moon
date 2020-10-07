defmodule Moon.Assets.Icons.IconInfo do
  use Moon.StatelessComponent

  property color, :string
  property background_color, :string

  def render(assigns) do
    class_name = get_class_name("Icons-IconInfo-#{assigns[:color]}-#{assigns[:background_color]}")

    ~H"""
    <style>
      .{{ class_name }} {
        vertical-align: 'middle';
        color: {{ @color }};
        background-color: {{ @background_color }};
      }
    </style>

    <svg class={{ class_name }} width="4px" height="20px" viewBox="0 0 4 20" version="1.1" xmlns="http://www.w3.org/2000/svg" >   <!-- Generator: Sketch 53 (72520) - https://sketchapp.com -->   <title>icon-warning</title>   <desc>Created with Sketch.</desc>   <g id="Icons" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">     <g id="Warning" transform="translate(-8.000000, 0.000000)" fill="currentColor" fill-rule="nonzero">       <path d="M12,4 L8,4 L8,0 L12,0 L12,12 Z M12,20 L8,20 L8,8 L12,8 L12,20 Z" id="icon-warning"></path>     </g>   </g> </svg>
    """
  end
end
