defmodule Moon.Assets.Icons.IconChevronUpDown do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)

  def render(assigns) do
    class_name =
      get_class_name("Icons-IconChevronUpDown-#{assigns.color}-#{assigns.background_color}")

    ~H"""
    <Context get={{ theme: theme }}>
    <style>
      .{{ class_name }} {
        vertical-align: middle;


        color: {{ get_color(@color, @theme) }};
        background-color: {{ get_color(@background_color, @theme) }};
        display: inline-block;
        overflow: hidden;



      }
    </style>

    <svg class={{ class_name }} width="auto" height="1em"  viewBox="0 0 13 20" version="1.1" xmlns="http://www.w3.org/2000/svg" >   <!-- Generator: Sketch 53 (72520) - https://sketchapp.com -->   <title>icon-chevron-up-down</title>   <desc>Created with Sketch.</desc>   <g id="Icons" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">     <g id="Chevron-Up-Down" transform="translate(-4.000000, 0.000000)" fill="currentColor">       <path d="M15.729404,13 L17,14.1464888 L10.5004836,20 L4,14.1477091 L5.27115992,13.0001387 L10.5008586,17.7121471 L15.729404,13 Z M15.729404,7 L10.5008586,2.2878529 L5.27115992,6.99986128 L4,5.85229088 L10.5004836,0 L17,5.85351119 L15.729404,7 Z" id="icon-chevron-up-down"></path>     </g>   </g> </svg>
    </Context>
    """
  end
end
