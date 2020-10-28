defmodule Moon.Assets.Icons.IconCard do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconCard-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path fill-rule="evenodd" clip-rule="evenodd" d="M13 10V7.00002C13 5.34317 11.6569 4.00003 10 4.00002L7.00001 4.00002C5.34315 4.00001 4 5.34316 4 7.00002L4 10C4 11.6569 5.34315 13 7 13H10C11.6569 13 13 11.6569 13 10ZM15 7.00002V10C15 12.7614 12.7614 15 10 15H7C4.23858 15 2 12.7614 2 10L2 7.00002C2 4.23859 4.23858 2.00001 7.00001 2.00002L10 2.00002C12.7614 2.00003 15 4.2386 15 7.00002Z" fill="currentColor"/> <path fill-rule="evenodd" clip-rule="evenodd" d="M28 10L28 7.00002C28 5.34317 26.6569 4.00003 25 4.00002L22 4.00002C20.3431 4.00001 19 5.34316 19 7.00002V10C19 11.6569 20.3431 13 22 13H25C26.6569 13 28 11.6569 28 10ZM30 7.00002L30 10C30 12.7614 27.7614 15 25 15H22C19.2386 15 17 12.7614 17 10V7.00002C17 4.23859 19.2386 2.00001 22 2.00002L25 2.00002C27.7614 2.00003 30 4.2386 30 7.00002Z" fill="currentColor"/> <path fill-rule="evenodd" clip-rule="evenodd" d="M13 25V22C13 20.3432 11.6569 19 10 19L7.00001 19C5.34315 19 4 20.3432 4 22L4 25C4 26.6569 5.34315 28 7 28H10C11.6569 28 13 26.6569 13 25ZM15 22V25C15 27.7614 12.7614 30 10 30H7C4.23858 30 2 27.7614 2 25L2 22C2 19.2386 4.23858 17 7.00001 17L10 17C12.7614 17 15 19.2386 15 22Z" fill="currentColor"/> <path fill-rule="evenodd" clip-rule="evenodd" d="M28 25L28 22C28 20.3432 26.6569 19 25 19L22 19C20.3431 19 19 20.3432 19 22V25C19 26.6569 20.3431 28 22 28H25C26.6569 28 28 26.6569 28 25ZM30 22L30 25C30 27.7614 27.7614 30 25 30H22C19.2386 30 17 27.7614 17 25V22C17 19.2386 19.2386 17 22 17L25 17C27.7614 17 30 19.2386 30 22Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
