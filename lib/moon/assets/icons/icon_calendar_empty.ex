defmodule Moon.Assets.Icons.IconCalendarEmpty do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconCalendarEmpty-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path fill-rule="evenodd" clip-rule="evenodd" d="M10 2C10.5523 2 11 2.44772 11 3V4.00002L21 4.00004V3C21 2.44772 21.4477 2 22 2C22.5523 2 23 2.44771 23 3V4.00004L25 4.00004C27.7614 4.00005 30 6.23862 30 9.00004V25C30 27.7614 27.7614 30 25 30L7 30C4.23857 30 2 27.7614 2 25L2 9.00001C2 6.23858 4.23858 4 7.00001 4.00001L9 4.00001V3C9 2.44772 9.44771 2 10 2ZM9 6.00001L7.00001 6.00001C5.34315 6 4 7.34315 4 9.00001V11H28V9.00004C28 7.34319 26.6569 6.00005 25 6.00004L23 6.00004V7C23 7.55228 22.5523 8 22 8C21.4477 8 21 7.55229 21 7V6.00004L11 6.00002V7C11 7.55228 10.5523 8 10 8C9.44771 8 9 7.55228 9 7V6.00001ZM28 13H4L4 25C4 26.6569 5.34314 28 7 28L25 28C26.6569 28 28 26.6569 28 25V13Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
