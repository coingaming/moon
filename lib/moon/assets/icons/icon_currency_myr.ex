defmodule Moon.Assets.Icons.IconCurrencyMYR do
  use Moon.StatelessComponent
  use Moon.Components.Context

  property(color, :string)
  property(background_color, :string)
  property(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconCurrencyMYR-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="auto"  viewBox="0 0 89 46" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M0.283203 46H10.7152V31.344H14.6192L23.9632 46H36.5072L25.6912 29.872C31.3232 27.568 34.2672 22.832 34.2672 16.24C34.2672 7.152 29.2752 0.559998 18.0112 0.559998H0.283203V46ZM10.7152 22V9.968H16.2832C21.0832 9.968 23.1952 12.528 23.1952 15.984C23.1952 19.76 20.6992 22 16.0912 22H10.7152Z" fill="currentColor"/> <path d="M41.9097 46H52.4697V20.912H52.6617L61.8777 37.616H68.7257L77.9417 20.976H78.0697V46H88.6937V0.559998H77.8777L65.3977 24.688H65.2697L52.6617 0.559998H41.9097V46Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
