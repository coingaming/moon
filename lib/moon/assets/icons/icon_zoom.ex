defmodule Moon.Assets.Icons.IconZoom do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconZoom-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path fill-rule="evenodd" clip-rule="evenodd" d="M14.5 4C8.70101 4 4 8.70101 4 14.5C4 20.299 8.70101 25 14.5 25C17.3971 25 20.0185 23.828 21.9193 21.93C23.8236 20.0283 25 17.4025 25 14.5C25 8.70101 20.299 4 14.5 4ZM2 14.5C2 7.59644 7.59644 2 14.5 2C21.4036 2 27 7.59644 27 14.5C27 17.5941 25.8748 20.4269 24.0129 22.6092L29.7065 28.2922C30.0973 28.6824 30.0979 29.3156 29.7078 29.7065C29.3176 30.0973 28.6844 30.0979 28.2935 29.7078L22.5979 24.0226C20.4171 25.8787 17.5887 27 14.5 27C7.59644 27 2 21.4036 2 14.5Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
