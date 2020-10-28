defmodule Moon.Assets.Icons.IconCase do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconCase-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M7 29L7 28L7 29ZM2 11L2 25L4 25L4 11L2 11ZM25 28L7 28L7 30L25 30L25 28ZM28 11L28 25L30 25L30 11L28 11ZM25 6.00004L7.00001 6.00001L7.00001 8.00001L25 8.00004L25 6.00004ZM30 11C30 8.23862 27.7614 6.00004 25 6.00004L25 8.00004C26.6569 8.00004 28 9.34319 28 11L30 11ZM4 11C4 9.34315 5.34315 8 7.00001 8.00001L7.00001 6.00001C4.23858 6 2 8.23858 2 11L4 11ZM2 25C2 27.7614 4.23857 30 7 30L7 28C5.34314 28 4 26.6569 4 25L2 25ZM25 30C27.7614 30 30 27.7614 30 25L28 25C28 26.6569 26.6569 28 25 28L25 30Z" fill="currentColor"/> <path d="M13 16L3 16L3 18L13 18L13 16Z" fill="currentColor"/> <path d="M29 16L19 16L19 18L29 18L29 16Z" fill="currentColor"/> <path d="M18 2L14 2L14 4L18 4L18 2ZM23 6.99999C23 4.23857 20.7614 2 18 2L18 4C19.6569 4 21 5.34314 21 6.99999L23 6.99999ZM11 7C11 5.34315 12.3431 4 14 4L14 2C11.2386 2 9 4.23858 9 7L11 7Z" fill="currentColor"/> <circle cx="16" cy="18" r="3" stroke="currentColor" stroke-width="2"/> </svg>
    </Context>
    """
  end
end
