defmodule Moon.Assets.Icons.IconChartPies do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconChartPies-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path fill-rule="evenodd" clip-rule="evenodd" d="M10.1675 21.8325C5.51984 20.9717 2 16.8969 2 12C2 6.47715 6.47715 2 12 2C16.8969 2 20.9717 5.51984 21.8325 10.1675C26.4802 11.0283 30 15.1031 30 20C30 25.5228 25.5228 30 20 30C15.1031 30 11.0283 26.4802 10.1675 21.8325ZM4 12C4 7.58172 7.58172 4 12 4C15.7288 4 18.8618 6.55107 19.7488 10.0031C14.4255 10.1344 10.1344 14.4255 10.0031 19.7488C6.55107 18.8618 4 15.7288 4 12ZM21.9969 12.2512C25.4489 13.1382 28 16.2712 28 20C28 24.4183 24.4183 28 20 28C16.2712 28 13.1382 25.4489 12.2512 21.9969C17.5745 21.8656 21.8656 17.5745 21.9969 12.2512ZM12 20C16.4183 20 20 16.4183 20 12C15.5817 12 12 15.5817 12 20Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
