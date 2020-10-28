defmodule Moon.Assets.Icons.IconMail do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconMail-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path fill-rule="evenodd" clip-rule="evenodd" d="M30 22L30 10C30 7.23857 27.7614 5 25 5L7 5.00002C4.23857 5.00002 2 7.2386 2 10V22C2 24.7614 4.23858 27 7 27L25 27C27.7614 27 30 24.7614 30 22ZM28 11.0493L28 22C28 23.6568 26.6569 25 25 25L7 25C5.34315 25 4 23.6569 4 22L4 11.0493L13.1884 17.2974C14.8852 18.4512 17.1147 18.4512 18.8115 17.2974L28 11.0493ZM27.7505 8.80032C27.2876 7.7406 26.2303 7 25 7L7 7.00002C5.76968 7.00002 4.71234 7.74063 4.24948 8.80034L14.313 15.6436C15.3311 16.3359 16.6688 16.3359 17.6869 15.6436L27.7505 8.80032Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
