defmodule Moon.Assets.Icons.IconArrowUp do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)

  def render(assigns) do
    class_name = get_class_name("Icons-IconArrowUp-#{assigns.color}-#{assigns.background_color}")

    ~H"""
    <Context get={{ theme: theme }}>
    <style>
      .{{ class_name }} {
        vertical-align: middle;


        color: {{ get_color(@color, theme) }};
        background-color: {{ get_color(@background_color, theme) }};
        display: inline-block;
        overflow: hidden;



      }
    </style>

    <svg class={{ class_name }} width="auto" height="1em"  viewBox="0 0 8 20" version="1.1" xmlns="http://www.w3.org/2000/svg" >   <!-- Generator: Sketch 53 (72520) - https://sketchapp.com -->   <title>icon-arrow-up</title>   <desc>Created with Sketch.</desc>   <g id="Icons" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">     <g id="Arrow-Up" transform="translate(-6.000000, 0.000000)" fill="currentColor">       <polygon id="icon-arrow-up" transform="translate(10.000000, 10.000000) rotate(270.000000) translate(-10.000000, -10.000000) " points="14.9206657 6 14.9206657 9.2 0 9.2 0 10.8 14.9206657 10.8 14.9206657 14 20 10"></polygon>     </g>   </g> </svg>
    </Context>
    """
  end
end
