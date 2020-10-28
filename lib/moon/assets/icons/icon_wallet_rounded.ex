defmodule Moon.Assets.Icons.IconWalletRounded do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconWalletRounded-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M19 16C19 14.8954 19.8954 14 21 14C22.1046 14 23 14.8954 23 16C23 17.1046 22.1046 18 21 18C19.8954 18 19 17.1046 19 16Z" fill="currentColor"/> <path fill-rule="evenodd" clip-rule="evenodd" d="M30 25C30 27.7614 27.7614 30 25 30L7 30C4.23858 30 2 27.7614 2 25V7C2 4.23857 4.23858 1.99999 7.00001 2L25 2.00004C27.7614 2.00005 30 4.23862 30 7.00004V25ZM28 10V7.00004C28 5.34319 26.6569 4.00004 25 4.00004L7.00001 4C5.34315 4 4 5.34314 4 7L4 25C4 26.6568 5.34315 28 7 28L25 28C26.6569 28 28 26.6568 28 25V22L20 22C17.2386 22 15 19.7614 15 17V15C15 12.2386 17.2386 10 20 10L28 10ZM28 12L20 12C18.3431 12 17 13.3431 17 15V17C17 18.6568 18.3431 20 20 20L28 20V12Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
