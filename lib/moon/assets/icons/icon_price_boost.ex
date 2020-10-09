defmodule Moon.Assets.Icons.IconPriceBoost do
  use Moon.StatelessComponent
  use Moon.Components.Context

  property color, :string
  property background_color, :string

  def render(assigns) do
    class_name =
      get_class_name("Icons-IconPriceBoost-#{assigns.color}-#{assigns.background_color}")

    ~H"""
    <Context get={{ :theme }}>
    <style>
      .{{ class_name }} {
        vertical-align: middle;

        
        color: {{ get_color(@color, @theme) }};
        background-color: {{ get_color(@background_color, @theme) }};
        display: inline-block;
        overflow: hidden;
        

        
      }
    </style>

    <svg class={{ class_name }} width="1em" height="auto"  viewBox="0 0 20 14" version="1.1" xmlns="http://www.w3.org/2000/svg" >   <!-- Generator: Sketch 53 (72520) - https://sketchapp.com -->   <title>icon-price-boost</title>   <desc>Created with Sketch.</desc>   <defs>     <polygon id="path-1" points="14 3 14 5 16.6 5 9 12.6 6 9.6 0 15.6 1.4 17 6 12.4 9 15.4 18 6.4 18 9 20 9 20 3"></polygon>   </defs>   <g id="Icons" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">     <g id="Price-Boost" transform="translate(0.000000, -3.000000)">       <mask id="mask-2" fill="white">         <use xlink:href="#path-1"></use>       </mask>       <use id="icon-price-boost" fill="currentColor" fill-rule="nonzero" xlink:href="#path-1"></use>     </g>   </g> </svg>
    </Context>
    """
  end
end
