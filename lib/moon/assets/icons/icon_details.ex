defmodule Moon.Assets.Icons.IconDetails do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconDetails-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M10 4.00001C10.5523 4.00001 11 3.5523 11 3.00002C11 2.44773 10.5523 2.00001 10 2.00001L10 4.00001ZM22 2.00004C21.4477 2.00004 21 2.44776 21 3.00004C21 3.55233 21.4477 4.00004 22 4.00004L22 2.00004ZM2 10C2 10.5523 2.44771 11 3 11C3.55228 11 4 10.5523 4 10L2 10ZM4 22C4 21.4477 3.55228 21 3 21C2.44771 21 2 21.4477 2 22L4 22ZM28 10C28 10.5523 28.4477 11 29 11C29.5523 11 30 10.5523 30 10L28 10ZM30 22C30 21.4477 29.5523 21 29 21C28.4477 21 28 21.4477 28 22L30 22ZM22 28C21.4477 28 21 28.4477 21 29C21 29.5523 21.4477 30 22 30L22 28ZM10 30C10.5523 30 11 29.5523 11 29C11 28.4477 10.5523 28 10 28L10 30ZM3 25L4 25L3 25ZM10 2.00001C9.28296 2.00001 8.14859 2.00001 7.00009 2.00001L7.00008 4.00001C8.14859 4.00001 9.28296 4.00001 10 4.00001L10 2.00001ZM25 2.00005L22 2.00004L22 4.00004L25 4.00005L25 2.00005ZM2 7.00001L2 10L4 10L4 7.00001L2 7.00001ZM2 22L2 25L4 25L4 22L2 22ZM28 7.00013C28 8.14862 28 9.28297 28 10L30 10C30 9.28297 30 8.14862 30 7.00013L28 7.00013ZM28 22L28 25L30 25L30 22L28 22ZM25 28L22 28L22 30L25 30L25 28ZM10 28C9.28296 28 8.14858 28 7.00008 28L7.00008 30C8.14858 30 9.28296 30 10 30L10 28ZM25 4.00005C26.6568 4.00005 28 5.34325 28 7.00013L30 7.00013C30 4.23873 27.7615 2.00005 25 2.00005L25 4.00005ZM7.00009 2.00001C4.23869 2 2 4.23855 2 7.00001L4 7.00001C4 5.34318 5.3432 4 7.00008 4.00001L7.00009 2.00001ZM2 25C2 27.7615 4.23868 30 7.00008 30L7.00008 28C5.3432 28 4 26.6568 4 25L2 25ZM28 25C28 26.6569 26.6569 28 25 28L25 30C27.7614 30 30 27.7614 30 25L28 25Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
