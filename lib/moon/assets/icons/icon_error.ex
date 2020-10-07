defmodule Moon.Assets.Icons.IconError do
  use Moon.StatelessComponent

  property color, :string
  property background_color, :string

  def render(assigns) do
    class_name =
      get_class_name("Icons-IconError-#{assigns[:color]}-#{assigns[:background_color]}")

    ~H"""
    <style>
      .{{ class_name }} {
        vertical-align: 'middle';
        color: {{ @color }};
        background-color: {{ @background_color }};
      }
    </style>

    <svg class={{ class_name }} width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"> <rect x="2" y="2" width="20" height="20" rx="10" fill="#FF4E64"/> <rect x="6" y="10" width="12" height="4" rx="1" fill="white"/> </svg>
    """
  end
end
