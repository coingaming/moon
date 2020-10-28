defmodule Moon.Assets.Icons.IconTag do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconTag-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path fill-rule="evenodd" clip-rule="evenodd" d="M29.4021 15.6656C31.302 17.6267 31.2772 20.7493 29.3464 22.6801L23.5678 28.4587C21.6533 30.3732 18.5627 30.416 16.596 28.5553L3.54871 16.2114C3.14944 15.8336 2.92322 15.3082 2.92322 14.7585L2.92323 5.18907C2.92323 3.53222 4.26637 2.18907 5.92323 2.18907L15.4997 2.18907C16.0411 2.18907 16.5594 2.4086 16.9362 2.79748L29.4021 15.6656ZM27.9322 21.2659C29.0907 20.1074 29.1055 18.2338 27.9656 17.0572L15.4997 4.18907L5.92323 4.18907C5.37095 4.18907 4.92323 4.63678 4.92323 5.18907L4.92322 14.7585L17.9705 27.1025C19.1505 28.2189 21.0049 28.1932 22.1536 27.0445L27.9322 21.2659ZM11.9232 9.68907C11.9232 8.86064 11.2516 8.18907 10.4232 8.18907C9.59479 8.18907 8.92322 8.86064 8.92322 9.68907C8.92322 10.5175 9.59479 11.1891 10.4232 11.1891C11.2516 11.1891 11.9232 10.5175 11.9232 9.68907ZM10.4232 6.18907C12.3562 6.18907 13.9232 7.75607 13.9232 9.68907C13.9232 11.6221 12.3562 13.1891 10.4232 13.1891C8.49022 13.1891 6.92322 11.6221 6.92322 9.68907C6.92322 7.75607 8.49022 6.18907 10.4232 6.18907Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
