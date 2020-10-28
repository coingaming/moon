defmodule Moon.Assets.Icons.IconLeftArrowCurveRight do
  use Moon.StatelessComponent
  use Moon.Components.Context

  property(color, :string)
  property(background_color, :string)
  property(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconLeftArrowCurveRight-#{assigns.color}-#{assigns.background_color}-#{
          assigns.font_size
        }"
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

    <svg class={{ class_name }} width="1em" height="auto"  viewBox="0 0 20 15" version="1.1" xmlns="http://www.w3.org/2000/svg" >   <!-- Generator: Sketch 53 (72520) - https://sketchapp.com -->   <title>icon-left-arrow-curve-right</title>   <desc>Created with Sketch.</desc>   <defs>     <path d="M14.4,15.8222222 L7.95555556,15.8222222 L7.95555556,17.6888889 L14.4,17.6888889 C17.4888889,17.7111111 20,15.1777778 20,12.0888889 C20,9 17.4888889,6.46666667 14.3777778,6.46666667 L3.55555556,6.46666667 L5.68888889,4.31111111 L4.35555556,3 L0,7.4 L4.37777778,11.8 L5.71111111,10.4888889 L3.57777778,8.35555556 L14.3777778,8.35555556 C16.4444444,8.35555556 18.1111111,10.0444444 18.1111111,12.0888889 C18.1333333,14.1555556 16.4666667,15.8222222 14.4,15.8222222 Z" id="path-1"></path>   </defs>   <g id="Icons" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">     <g id="Left-Arrow-Curve-Right" transform="translate(0.000000, -3.000000)">       <mask id="mask-2" fill="white">         <use xlink:href="#path-1"></use>       </mask>       <use id="icon-left-arrow-curve-right" fill="currentColor" transform="translate(10.000000, 10.344517) scale(-1, 1) translate(-10.000000, -10.344517) " xlink:href="#path-1"></use>     </g>   </g> </svg>
    </Context>
    """
  end
end
