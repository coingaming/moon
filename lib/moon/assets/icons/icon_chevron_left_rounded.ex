defmodule Moon.Assets.Icons.IconChevronLeftRounded do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)

  def render(assigns) do
    class_name =
      get_class_name("Icons-IconChevronLeftRounded-#{assigns.color}-#{assigns.background_color}")

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

    <svg class={{ class_name }} width="auto" height="1em"  viewBox="0 0 15 28" fill="none" xmlns="http://www.w3.org/2000/svg">   <path fill-rule="evenodd" clip-rule="evenodd" d="M14.66 0.273367C15.0245 0.637856 15.0245 1.22881 14.66 1.5933L2.25327 14L14.66 26.4067C15.0245 26.7712 15.0245 27.3621 14.66 27.7266C14.2955 28.0911 13.7045 28.0911 13.34 27.7266L0.273367 14.66C-0.0911223 14.2955 -0.0911223 13.7045 0.273367 13.34L13.34 0.273367C13.7045 -0.0911223 14.2955 -0.0911223 14.66 0.273367Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
