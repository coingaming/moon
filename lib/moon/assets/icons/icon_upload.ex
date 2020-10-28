defmodule Moon.Assets.Icons.IconUpload do
  use Moon.StatelessComponent
  use Moon.Components.Context

  property(color, :string)
  property(background_color, :string)
  property(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconUpload-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="auto"  viewBox="0 0 20 18" version="1.1" xmlns="http://www.w3.org/2000/svg" >   <!-- Generator: Sketch 53 (72520) - https://sketchapp.com -->   <title>icon-upload</title>   <desc>Created with Sketch.</desc>   <g id="Icons" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">     <g id="Upload" transform="translate(0.000000, -1.000000)" fill="currentColor" fill-rule="nonzero">       <path d="M10.9021035,19 L9.09789655,19 L9.09789655,9.42329583 L6.31788369,12.1132771 L5,10.8380735 L10,6 L15,10.8380735 L13.6821163,12.1132771 L10.9021035,9.42329583 L10.9021035,19 Z M1.80990037,2.8609748 L1.80990037,7 L2.13162821e-14,7 L2.13162821e-14,1 L20,1 L20,7 L18.1598332,7 L18.1598332,2.8609748 L1.80990037,2.8609748 Z" id="icon-upload"></path>     </g>   </g> </svg>
    </Context>
    """
  end
end
