defmodule Moon.Assets.Icons.IconData do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconData-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path fill-rule="evenodd" clip-rule="evenodd" d="M4.03217 8C4.27374 6.13835 5.84706 4.68026 7.77461 3.71649C9.93134 2.63812 12.8409 2 16 2C19.1591 2 22.0687 2.63812 24.2254 3.71649C26.1529 4.68026 27.7263 6.13835 27.9678 8H28V23.5C28 25.6016 26.3223 27.2351 24.2254 28.2835C22.0687 29.3619 19.1591 30 16 30C12.8409 30 9.93134 29.3619 7.77461 28.2835C5.6777 27.2351 4 25.6016 4 23.5V8H4.03217ZM6 8.5C6 9.43596 6.78473 10.5525 8.66904 11.4947C10.4935 12.4069 13.084 13 16 13C18.916 13 21.5065 12.4069 23.331 11.4947C25.2153 10.5525 26 9.43596 26 8.5C26 7.56404 25.2153 6.44749 23.331 5.50534C21.5065 4.59309 18.916 4 16 4C13.084 4 10.4935 4.59309 8.66904 5.50534C6.78473 6.44749 6 7.56404 6 8.5ZM26 12.1572C25.4721 12.5854 24.8685 12.962 24.2254 13.2835C22.0687 14.3619 19.1591 15 16 15C12.8409 15 9.93134 14.3619 7.77461 13.2835C7.13155 12.962 6.52791 12.5854 6 12.1572V16.5C6 17.436 6.78473 18.5525 8.66904 19.4947C10.4935 20.4069 13.084 21 16 21C18.916 21 21.5065 20.4069 23.331 19.4947C25.2153 18.5525 26 17.436 26 16.5V12.1572ZM6 23.5V20.1572C6.52791 20.5854 7.13155 20.962 7.77461 21.2835C9.93134 22.3619 12.8409 23 16 23C19.1591 23 22.0687 22.3619 24.2254 21.2835C24.8685 20.962 25.4721 20.5854 26 20.1572V23.5C26 24.436 25.2153 25.5525 23.331 26.4947C21.5065 27.4069 18.916 28 16 28C13.084 28 10.4935 27.4069 8.66904 26.4947C6.78473 25.5525 6 24.436 6 23.5Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
