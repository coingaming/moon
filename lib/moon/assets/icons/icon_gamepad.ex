defmodule Moon.Assets.Icons.IconGamepad do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconGamepad-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path fill-rule="evenodd" clip-rule="evenodd" d="M25.6967 26C26.838 26 27.7171 24.993 27.5629 23.8621L25.5989 9.45958C25.3286 7.47764 23.6359 6.00003 21.6356 6.00003L10.3645 6.00003C8.36419 6.00003 6.67142 7.47764 6.40115 9.45958L4.43718 23.862C4.28297 24.9929 5.16203 26 6.30338 26C6.98739 26 7.61764 25.6292 7.94983 25.0312L11.5544 18.5431C12.0835 17.5907 13.0873 17 14.1768 17L17.8232 17C18.9127 17 19.9166 17.5907 20.4457 18.5431L24.0502 25.0312C24.3824 25.6292 25.0127 26 25.6967 26ZM29.5445 23.5919C29.8625 25.9236 28.05 28 25.6966 28C24.2863 28 22.9868 27.2354 22.3019 26.0025L18.6974 19.5144C18.521 19.1969 18.1864 19 17.8232 19L14.1768 19C13.8137 19 13.479 19.1969 13.3027 19.5144L9.69815 26.0025C9.01322 27.2354 7.71373 28 6.30338 28C3.95005 28 2.13755 25.9236 2.45552 23.5918L4.41949 9.18935C4.82489 6.21644 7.36405 4.00003 10.3645 4.00003L21.6356 4.00003C24.636 4.00003 27.1752 6.21644 27.5806 9.18935L29.5445 23.5919Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
