defmodule Moon.Assets.Icons.IconChevronDown do
  use Moon.StatelessComponent

  property color, :string
  property background_color, :string

  false

  def render(assigns) do
    class_name =
      get_class_name("Icons-IconChevronDown-#{assigns[:color]}-#{assigns[:background_color]}")

    false

    ~H"""
    <style>
      .{{ class_name }} {
        vertical-align: middle;

        
        color: {{ @color }};
        background-color: {{ @background_color }};
        display: inline-block;
        overflow: hidden;
        

        
      }
    </style>

    <svg class={{ class_name }} width="1em" height="auto" viewBox="0 0 20 12" version="1.1" xmlns="http://www.w3.org/2000/svg" >   <!-- Generator: Sketch 53 (72520) - https://sketchapp.com -->   <title>icon-chevron-down</title>   <desc>Created with Sketch.</desc>   <g id="Icons" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">     <g id="Chevron-Down" transform="translate(0.000000, -4.000000)" fill="currentColor">       <polygon id="icon-chevron-down" transform="translate(10.000000, 10.000000) rotate(90.000000) translate(-10.000000, -10.000000) " points="4 2.62349813 11.0135889 9.99885307 4.00016058 17.3758832 6.49982514 20 16 9.9992645 6.49782796 9.03213156e-13"></polygon>     </g>   </g> </svg>
    """
  end
end
