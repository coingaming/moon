defmodule Moon.Assets.Icons.IconHamburger do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)

  def render(assigns) do
    class_name =
      get_class_name("Icons-IconHamburger-#{assigns.color}-#{assigns.background_color}")

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

    <svg class={{ class_name }} width="1em" height="auto"  viewBox="0 0 16 14" fill="none" xmlns="http://www.w3.org/2000/svg"> <rect width="16" height="2" rx="1" fill="currentColor"/> <rect y="6" width="16" height="2" rx="1" fill="currentColor"/> <rect y="12" width="16" height="2" rx="1" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
