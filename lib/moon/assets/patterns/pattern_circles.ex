defmodule Moon.Assets.Patterns.PatternCircles do
  use Moon.StatelessComponent
  use Moon.Components.Context

  property color, :string
  property height, :string
  property width, :string
  property font_size, :string
  property vertical_align, :string

  def render(assigns) do
    class_name =
      get_class_name(
        "Patterns-PatternCircles-#{assigns.color}-#{assigns.height}-#{assigns.width}-#{
          assigns.font_size
        }-#{assigns.vertical_align}"
      )

    ~H"""
    <Context get={{ :theme }}>
    <style>
      .{{ class_name }} {
        vertical-align: middle;

        

        
        color: {{ get_color(@color, @theme) }};
        height: {{ @height }};
        width: {{ @width }};
        font-size: {{ @font_size }};
        vertical-align: {{ @vertical_align }};
        overflow: hidden;
        
      }
    </style>

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">  <ellipse opacity="0.85" cx="15.0898" cy="0.91" rx="0.91" ry="0.910184" transform="rotate(90 15.0898 0.91)" fill="currentColor"/>  <ellipse cx="15.0898" cy="5.62477" rx="0.91" ry="0.910184" transform="rotate(90 15.0898 5.62477)" fill="currentColor"/>  <ellipse opacity="0.25" cx="15.0898" cy="10.3485" rx="0.91" ry="0.910184" transform="rotate(90 15.0898 10.3485)" fill="currentColor"/>  <ellipse opacity="0.25" cx="15.0898" cy="12.7008" rx="0.91" ry="0.910184" transform="rotate(90 15.0898 12.7008)" fill="currentColor"/>  <ellipse opacity="0.5" cx="13.0639" cy="11.5296" rx="0.91" ry="0.910184" transform="rotate(90 13.0639 11.5296)" fill="currentColor"/>  <ellipse opacity="0.25" cx="13.0639" cy="6.73041" rx="0.91" ry="0.910184" transform="rotate(90 13.0639 6.73041)" fill="currentColor"/>  <ellipse opacity="0.5" cx="13.0639" cy="4.42833" rx="0.91" ry="0.910184" transform="rotate(90 13.0639 4.42833)" fill="currentColor"/>  <ellipse opacity="0.25" cx="13.0639" cy="2.0763" rx="0.91" ry="0.910184" transform="rotate(90 13.0639 2.0763)" fill="currentColor"/>  <ellipse opacity="0.25" cx="11.038" cy="0.91" rx="0.91" ry="0.910184" transform="rotate(90 11.038 0.91)" fill="currentColor"/>  <ellipse opacity="0.25" cx="11.038" cy="5.62477" rx="0.91" ry="0.910184" transform="rotate(90 11.038 5.62477)" fill="currentColor"/>  <ellipse cx="11.038" cy="7.98915" rx="0.91" ry="0.910184" transform="rotate(90 11.038 7.98915)" fill="currentColor"/>  <ellipse opacity="0.25" cx="11.038" cy="10.3485" rx="0.91" ry="0.910184" transform="rotate(90 11.038 10.3485)" fill="currentColor"/>  <ellipse opacity="0.5" cx="11.038" cy="12.7008" rx="0.91" ry="0.910184" transform="rotate(90 11.038 12.7008)" fill="currentColor"/>  <ellipse opacity="0.45" cx="11.038" cy="15.0531" rx="0.91" ry="0.910184" transform="rotate(90 11.038 15.0531)" fill="currentColor"/>  <ellipse opacity="0.25" cx="9.00034" cy="13.8885" rx="0.91" ry="0.910184" transform="rotate(90 9.00034 13.8885)" fill="currentColor"/>  <ellipse opacity="0.5" cx="9.00034" cy="9.15347" rx="0.91" ry="0.910184" transform="rotate(90 9.00034 9.15347)" fill="currentColor"/>  <ellipse opacity="0.5" cx="9.00034" cy="6.77678" rx="0.91" ry="0.910184" transform="rotate(90 9.00034 6.77678)" fill="currentColor"/>  <ellipse opacity="0.25" cx="9.00034" cy="4.42833" rx="0.91" ry="0.910184" transform="rotate(90 9.00034 4.42833)" fill="currentColor"/>  <ellipse opacity="0.5" cx="9.00034" cy="2.0763" rx="0.91" ry="0.910184" transform="rotate(90 9.00034 2.0763)" fill="currentColor"/>  <ellipse opacity="0.25" cx="6.98441" cy="0.91" rx="0.91" ry="0.910184" transform="rotate(90 6.98441 0.91)" fill="currentColor"/>  <ellipse cx="4.94675" cy="2.0763" rx="0.91" ry="0.910184" transform="rotate(90 4.94675 2.0763)" fill="currentColor"/>  <ellipse opacity="0.25" cx="2.92838" cy="0.91" rx="0.91" ry="0.910184" transform="rotate(90 2.92838 0.91)" fill="currentColor"/>  <ellipse opacity="0.25" cx="2.92838" cy="3.25616" rx="0.91" ry="0.910184" transform="rotate(90 2.92838 3.25616)" fill="currentColor"/>  <ellipse opacity="0.75" cx="0.910189" cy="4.42833" rx="0.91" ry="0.910184" transform="rotate(90 0.910189 4.42833)" fill="currentColor"/>  <ellipse opacity="0.25" cx="0.910189" cy="6.7909" rx="0.91" ry="0.910184" transform="rotate(90 0.910189 6.7909)" fill="currentColor"/>  <ellipse opacity="0.5" cx="0.910189" cy="9.15347" rx="0.91" ry="0.910184" transform="rotate(90 0.910189 9.15347)" fill="currentColor"/>  <ellipse opacity="0.25" cx="0.910189" cy="13.8885" rx="0.91" ry="0.910184" transform="rotate(90 0.910189 13.8885)" fill="currentColor"/>  <ellipse opacity="0.25" cx="2.92838" cy="7.98915" rx="0.91" ry="0.910184" transform="rotate(90 2.92838 7.98915)" fill="currentColor"/>  <ellipse opacity="0.25" cx="2.92838" cy="10.3485" rx="0.91" ry="0.910184" transform="rotate(90 2.92838 10.3485)" fill="currentColor"/>  <ellipse opacity="0.75" cx="2.92838" cy="12.7078" rx="0.91" ry="0.910184" transform="rotate(90 2.92838 12.7078)" fill="currentColor"/>  <ellipse opacity="0.25" cx="2.92838" cy="15.0531" rx="0.91" ry="0.910184" transform="rotate(90 2.92838 15.0531)" fill="currentColor"/>  <ellipse opacity="0.25" cx="4.94675" cy="4.42833" rx="0.91" ry="0.910184" transform="rotate(90 4.94675 4.42833)" fill="currentColor"/>  <ellipse opacity="0.5" cx="4.94675" cy="6.7909" rx="0.91" ry="0.910184" transform="rotate(90 4.94675 6.7909)" fill="currentColor"/>  <ellipse opacity="0.5" cx="4.94675" cy="9.15347" rx="0.91" ry="0.910184" transform="rotate(90 4.94675 9.15347)" fill="currentColor"/>  <ellipse opacity="0.25" cx="4.94675" cy="11.5296" rx="0.91" ry="0.910184" transform="rotate(90 4.94675 11.5296)" fill="currentColor"/>  <ellipse opacity="0.25" cx="4.94675" cy="13.8885" rx="0.91" ry="0.910184" transform="rotate(90 4.94675 13.8885)" fill="currentColor"/>  <ellipse opacity="0.5" cx="6.98441" cy="3.25616" rx="0.91" ry="0.910184" transform="rotate(90 6.98441 3.25616)" fill="currentColor"/>  <ellipse opacity="0.25" cx="6.98441" cy="7.98915" rx="0.91" ry="0.910184" transform="rotate(90 6.98441 7.98915)" fill="currentColor"/>  <ellipse cx="6.98441" cy="10.3485" rx="0.91" ry="0.910184" transform="rotate(90 6.98441 10.3485)" fill="currentColor"/>  <ellipse opacity="0.25" cx="6.98441" cy="12.7078" rx="0.91" ry="0.910184" transform="rotate(90 6.98441 12.7078)" fill="currentColor"/>  <ellipse opacity="0.75" cx="6.98441" cy="15.0531" rx="0.91" ry="0.910184" transform="rotate(90 6.98441 15.0531)" fill="currentColor"/>  <ellipse opacity="0.85" cx="15.0898" cy="15.0531" rx="0.91" ry="0.910184" transform="rotate(90 15.0898 15.0531)" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
