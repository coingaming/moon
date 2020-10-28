defmodule Moon.Assets.Icons.IconLogin do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconLogin-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M9 29C9 28.4477 9.44772 28 10 28H25C26.6569 28 28 26.6569 28 25L28 7C28 5.34315 26.6569 4 25 4L10 4C9.44771 4 9 3.55229 9 3C9 2.44772 9.44771 2 10 2H25C27.7614 2 30 4.23858 30 7L30 25C30 27.7614 27.7614 30 25 30H10C9.44772 30 9 29.5523 9 29Z" fill="currentColor"/> <path d="M20.5858 17L16.2929 21.2929C15.9024 21.6834 15.9024 22.3166 16.2929 22.7071C16.6834 23.0976 17.3166 23.0976 17.7071 22.7071L23.7071 16.7071C24.0976 16.3166 24.0976 15.6834 23.7071 15.2929L17.7071 9.29289C17.3166 8.90237 16.6834 8.90237 16.2929 9.29289C15.9024 9.68342 15.9024 10.3166 16.2929 10.7071L20.5858 15L3 15C2.44772 15 2 15.4477 2 16C2 16.5523 2.44772 17 3 17L20.5858 17Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
