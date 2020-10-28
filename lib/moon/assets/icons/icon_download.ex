defmodule Moon.Assets.Icons.IconDownload do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconDownload-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path fill-rule="evenodd" clip-rule="evenodd" d="M3 19C3.55228 19 4 19.4477 4 20V25C4 26.6569 5.34315 28 7 28H25C26.6569 28 28 26.6569 28 25V20C28 19.4477 28.4477 19 29 19C29.5523 19 30 19.4477 30 20V25C30 27.7614 27.7614 30 25 30H7C4.23858 30 2 27.7614 2 25V20C2 19.4477 2.44772 19 3 19Z" fill="currentColor"/> <path fill-rule="evenodd" clip-rule="evenodd" d="M16.7071 23.7071C16.3166 24.0976 15.6834 24.0976 15.2929 23.7071L9.29289 17.7071C8.90237 17.3166 8.90237 16.6834 9.29289 16.2929C9.68342 15.9024 10.3166 15.9024 10.7071 16.2929L15 20.5858L15 3C15 2.44772 15.4477 2 16 2C16.5523 2 17 2.44772 17 3L17 20.5858L21.2929 16.2929C21.6834 15.9024 22.3166 15.9024 22.7071 16.2929C23.0976 16.6834 23.0976 17.3166 22.7071 17.7071L16.7071 23.7071Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
