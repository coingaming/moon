defmodule Moon.Assets.Icons.IconGlasses do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconGlasses-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <circle cx="8" cy="24" r="5" stroke="currentColor" stroke-width="2"/> <circle cx="24" cy="24" r="5" stroke="currentColor" stroke-width="2"/> <path d="M19 24H13" stroke="currentColor" stroke-width="2"/> <path d="M7.00001 7L7.97186 7.2356L7.97662 7.21595L7.98059 7.19612L7.00001 7ZM11 4C11.5523 4 12 3.55228 12 3C12 2.44772 11.5523 2 11 2V4ZM2.02815 23.2646C1.89803 23.8013 2.22766 24.3419 2.7644 24.4721C3.30114 24.6022 3.84173 24.2725 3.97185 23.7358L2.02815 23.2646ZM7.98059 7.19612C8.20843 6.05693 8.5959 5.25875 9.07976 4.75577C9.53849 4.27891 10.1463 4 11 4V2C9.64453 2 8.50239 2.47109 7.63841 3.36923C6.79954 4.24125 6.29159 5.44307 6.01943 6.80388L7.98059 7.19612ZM6.02816 6.7644L2.02815 23.2646L3.97185 23.7358L7.97186 7.2356L6.02816 6.7644Z" fill="currentColor"/> <path d="M25 7L24.0281 7.2356L24.0234 7.21595L24.0194 7.19612L25 7ZM21 4C20.4477 4 20 3.55228 20 3C20 2.44772 20.4477 2 21 2V4ZM29.9719 23.2646C30.102 23.8013 29.7723 24.3419 29.2356 24.4721C28.6989 24.6022 28.1583 24.2725 28.0281 23.7358L29.9719 23.2646ZM24.0194 7.19612C23.7916 6.05693 23.4041 5.25875 22.9202 4.75577C22.4615 4.27891 21.8537 4 21 4V2C22.3555 2 23.4976 2.47109 24.3616 3.36923C25.2005 4.24125 25.7084 5.44307 25.9806 6.80388L24.0194 7.19612ZM25.9718 6.7644L29.9719 23.2646L28.0281 23.7358L24.0281 7.2356L25.9718 6.7644Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
