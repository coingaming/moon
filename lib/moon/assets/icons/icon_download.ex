defmodule Moon.Assets.Icons.IconDownload do
  use Moon.StatelessComponent
  use Moon.Components.Context

  property(color, :string)
  property(background_color, :string)
  property(font_size, :string)

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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg">  <path fill-rule="evenodd" clip-rule="evenodd" d="M1 17C1.55228 17 2 17.4477 2 18V23C2 24.6569 3.34315 26 5 26H23C24.6569 26 26 24.6569 26 23V18C26 17.4477 26.4477 17 27 17C27.5523 17 28 17.4477 28 18V23C28 25.7614 25.7614 28 23 28H5C2.23858 28 0 25.7614 0 23V18C0 17.4477 0.447715 17 1 17Z" fill="currentColor"/>  <path fill-rule="evenodd" clip-rule="evenodd" d="M14.7071 21.7071C14.3166 22.0976 13.6834 22.0976 13.2929 21.7071L7.29289 15.7071C6.90237 15.3166 6.90237 14.6834 7.29289 14.2929C7.68342 13.9024 8.31658 13.9024 8.70711 14.2929L13 18.5858L13 1C13 0.447716 13.4477 -4.82823e-08 14 0C14.5523 4.82823e-08 15 0.447716 15 1L15 18.5858L19.2929 14.2929C19.6834 13.9024 20.3166 13.9024 20.7071 14.2929C21.0976 14.6834 21.0976 15.3166 20.7071 15.7071L14.7071 21.7071Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
