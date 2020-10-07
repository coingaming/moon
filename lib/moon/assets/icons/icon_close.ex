defmodule Moon.Assets.Icons.IconClose do
  use Moon.StatelessComponent

  property color, :string
  property background_color, :string

  def render(assigns) do
    class_name =
      get_class_name("Icons-IconClose-#{assigns[:color]}-#{assigns[:background_color]}")

    ~H"""
    <style>
      .{{ class_name }} {
        vertical-align: middle;
        color: {{ @color }};
        background-color: {{ @background_color }};
      }
    </style>

    <svg class={{ class_name }} width="1em" height="1em" viewBox="0 0 20 20" version="1.1" xmlns="http://www.w3.org/2000/svg" >   <!-- Generator: Sketch 53 (72520) - https://sketchapp.com -->   <title>icon-close</title>   <desc>Created with Sketch.</desc>   <g id="Icons" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">     <g id="Close" fill="currentColor">       <polygon id="icon-close" points="12.6086957 10 20 17.3913043 17.3913043 20 10 12.6086957 2.60869565 20 0 17.3913043 7.39130435 10 0 2.60869565 2.60869565 0 10 7.39130435 17.3913043 0 20 2.60869565"></polygon>     </g>   </g> </svg>
    """
  end
end
