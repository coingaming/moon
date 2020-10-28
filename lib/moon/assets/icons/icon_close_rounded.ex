defmodule Moon.Assets.Icons.IconCloseRounded do
  use Moon.StatelessComponent
  use Moon.Components.Context

  property(color, :string)
  property(background_color, :string)
  property(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconCloseRounded-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">  <path fill-rule="evenodd" clip-rule="evenodd" d="M16 17.4142L24.4853 25.8995C25.4281 26.8423 26.8423 25.4281 25.8995 24.4853L17.4142 16L25.8995 7.51472C26.8423 6.57191 25.4281 5.1577 24.4853 6.10051L16 14.5858L7.51471 6.10052C6.5719 5.15771 5.15769 6.57193 6.1005 7.51473L14.5858 16L6.10052 24.4853C5.15771 25.4281 6.57192 26.8423 7.51473 25.8995L16 17.4142Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
