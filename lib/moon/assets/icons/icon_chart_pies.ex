defmodule Moon.Assets.Icons.IconChartPies do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)

  def render(assigns) do
    class_name =
      get_class_name("Icons-IconChartPies-#{assigns.color}-#{assigns.background_color}")

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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg">  <path fill-rule="evenodd" clip-rule="evenodd" d="M8.16752 19.8325C3.51984 18.9717 0 14.8969 0 10C0 4.47715 4.47715 0 10 0C14.8969 0 18.9717 3.51984 19.8325 8.16752C24.4802 9.02825 28 13.1031 28 18C28 23.5228 23.5228 28 18 28C13.1031 28 9.02825 24.4802 8.16752 19.8325ZM2 10C2 5.58172 5.58172 2 10 2C13.7288 2 16.8618 4.55107 17.7488 8.0031C12.4255 8.13437 8.13437 12.4255 8.0031 17.7488C4.55107 16.8618 2 13.7288 2 10ZM19.9969 10.2512C23.4489 11.1382 26 14.2712 26 18C26 22.4183 22.4183 26 18 26C14.2712 26 11.1382 23.4489 10.2512 19.9969C15.5745 19.8656 19.8656 15.5745 19.9969 10.2512ZM10 18C14.4183 18 18 14.4183 18 10C13.5817 10 10 13.5817 10 18Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
