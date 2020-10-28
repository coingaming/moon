defmodule Moon.Assets.Icons.IconFacebook do
  use Moon.StatelessComponent
  use Moon.Components.Context

  property(color, :string)
  property(background_color, :string)
  property(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconFacebook-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M18.8966 0H1.10345C0.494031 0 0 0.494031 0 1.10345V18.8966C0 19.506 0.494031 20 1.10345 20H10.6897V12.2655H8.08621V9.23793H10.6897V7.01034C10.6897 4.42759 12.269 3.02069 14.5724 3.02069C15.3486 3.019 16.1244 3.05813 16.8966 3.13793V5.83793H15.3103C14.0552 5.83793 13.8103 6.43103 13.8103 7.3069V9.23448H16.8103L16.4207 12.2621H13.7931V20H18.8966C19.506 20 20 19.506 20 18.8966V1.10345C20 0.494031 19.506 0 18.8966 0Z" fill="#4267B2"/> <path d="M13.793 20V12.2655H16.4033L16.793 9.23793H13.793V7.31035C13.793 6.43448 14.0378 5.84138 15.293 5.84138H16.8964V3.13793C16.1231 3.05801 15.3462 3.01888 14.5688 3.02069C12.2619 3.02069 10.6895 4.42759 10.6895 7.01035V9.23793H8.08606V12.2655H10.6895V20H13.793Z" fill="white"/> </svg>
    </Context>
    """
  end
end
