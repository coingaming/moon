defmodule Moon.Assets.Icons.IconSportsHandBall do
  use Moon.StatelessComponent
  use Moon.Components.Context

  property(color, :string)
  property(background_color, :string)
  property(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconSportsHandBall-#{assigns.color}-#{assigns.background_color}-#{
          assigns.font_size
        }"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">  <path d="M17.2619 10.4375C17.2619 9.9375 16.8869 9.56641 16.3908 9.56641H13.0353L10.7072 8.10938C10.6251 7.94141 10.4923 7.79688 10.3048 7.70312C10.1759 7.61719 10.0197 7.57812 9.85561 7.57812L7.07436 5.83984V2.60938C7.07436 2.10938 6.69936 1.73828 6.20327 1.73828C5.70327 1.73828 5.33218 2.11328 5.33218 2.60938V6.33594C5.33218 6.58594 5.45718 6.95703 5.82827 7.08203L8.60171 8.85938L2.85171 18.6328C2.60171 19.0039 2.72671 19.625 3.2228 19.875C3.3478 20 3.59389 20 3.71889 20C4.08999 20 4.33999 19.875 4.46499 19.5039L5.92593 17.0195H11.047C11.4181 17.0195 11.6681 16.7695 11.9142 16.3945C12.0392 16.0234 12.0392 15.6523 11.7892 15.4023L9.01186 11.7773L10.1447 9.85156L12.4142 11.3086C12.5392 11.4336 12.7853 11.4336 12.9103 11.4336H16.3869C16.8869 11.4297 17.383 10.9336 17.2619 10.4375ZM9.17983 15.2773H6.94936L7.9103 13.6445L9.17983 15.2773ZM9.67983 5.46484C9.67983 6.58203 10.5509 7.57812 11.6681 7.45312C12.7853 7.45312 13.6564 6.58203 13.6564 5.46484C13.6564 4.34766 12.7853 3.47656 11.6681 3.47656C10.5509 3.47656 9.67983 4.34766 9.67983 5.46484ZM8.93374 2.73438C9.67983 2.73438 10.3009 2.11328 10.3009 1.36719C10.3009 0.621094 9.67983 0 8.93374 0C8.18764 0 7.56655 0.621094 7.56655 1.36719C7.56655 2.11328 8.18764 2.73438 8.93374 2.73438Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
