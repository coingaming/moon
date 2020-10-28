defmodule Moon.Assets.Icons.IconChartSegment do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconChartSegment-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path fill-rule="evenodd" clip-rule="evenodd" d="M15 2.03576C12.5831 2.20882 10.2462 3.0069 8.22202 4.35943C5.91973 5.89777 4.12532 8.08427 3.06569 10.6424C2.00607 13.2006 1.72882 16.0155 2.26901 18.7313C2.80921 21.447 4.14258 23.9416 6.10051 25.8995C8.05845 27.8574 10.553 29.1908 13.2687 29.731C15.9845 30.2712 18.7994 29.9939 21.3576 28.9343C23.9157 27.8747 26.1022 26.0803 27.6406 23.778C28.9931 21.7538 29.7912 19.4169 29.9643 17H30L30 16.0128C30 16.0085 30 16.0043 30 16L30 15H29.9642C29.9228 14.4207 29.8451 13.8425 29.731 13.2687C29.1908 10.553 27.8574 8.05845 25.8995 6.10051C23.9416 4.14258 21.447 2.80921 18.7313 2.26901C18.1575 2.15488 17.5793 2.07724 17 2.03576V2.00001L16.014 2.00001C16.0093 2 16.0047 2 16 2L15 2.00001V2.03576ZM15 4.04174L15 17L27.9583 17C27.7893 19.0208 27.1103 20.9717 25.9776 22.6669C24.6591 24.6402 22.7849 26.1783 20.5922 27.0866C18.3995 27.9948 15.9867 28.2325 13.6589 27.7694C11.3312 27.3064 9.19296 26.1635 7.51472 24.4853C5.83649 22.8071 4.69361 20.6689 4.23058 18.3411C3.76756 16.0133 4.0052 13.6005 4.91345 11.4078C5.8217 9.21509 7.35977 7.34095 9.33316 6.02237C11.0283 4.88973 12.9792 4.21072 15 4.04174ZM17 15V4.04174C17.4487 4.07926 17.8964 4.14214 18.3411 4.23058C20.6689 4.69361 22.807 5.83649 24.4853 7.51472C26.1635 9.19295 27.3064 11.3312 27.7694 13.6589C27.8579 14.1036 27.9207 14.5513 27.9583 15L17 15Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
