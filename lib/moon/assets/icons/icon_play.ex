defmodule Moon.Assets.Icons.IconPlay do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)

  def render(assigns) do
    class_name = get_class_name("Icons-IconPlay-#{assigns.color}-#{assigns.background_color}")

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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">  <circle cx="8" cy="8" r="7.5" stroke="currentColor"/>  <path fill-rule="evenodd" clip-rule="evenodd" d="M10.8 8C10.8 7.79 10.686 7.616 10.524 7.508L10.53 7.496L6.93 5.096L6.924 5.108C6.834 5.048 6.726 5 6.6 5C6.27 5 6 5.27 6 5.6V10.4C6 10.73 6.27 11 6.6 11C6.726 11 6.834 10.952 6.924 10.892L6.93 10.904L10.53 8.504L10.524 8.492C10.686 8.384 10.8 8.21 10.8 8Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
