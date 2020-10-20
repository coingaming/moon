defmodule Moon.Assets.Icons.IconAlignLeft do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconAlignLeft-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="auto" height="1em"  viewBox="0 0 24 26" fill="none" xmlns="http://www.w3.org/2000/svg">  <path d="M24 1C24 1.55228 23.5523 2 23 2H1C0.447716 2 0 1.55228 0 1C0 0.447715 0.447716 0 1 0H23C23.5523 0 24 0.447715 24 1Z" fill="currentColor"/>  <path d="M23 18C23.5523 18 24 17.5523 24 17C24 16.4477 23.5523 16 23 16H1C0.447716 16 0 16.4477 0 17C0 17.5523 0.447716 18 1 18H23Z" fill="currentColor"/>  <path d="M12 26C12.5523 26 13 25.5523 13 25C13 24.4477 12.5523 24 12 24L1 24C0.447716 24 0 24.4477 0 25C0 25.5523 0.447716 26 1 26L12 26Z" fill="currentColor"/>  <path d="M12 10C12.5523 10 13 9.55229 13 9C13 8.44771 12.5523 8 12 8H1C0.447715 8 0 8.44771 0 9C0 9.55229 0.447715 10 1 10H12Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
