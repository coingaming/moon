defmodule Moon.Assets.Icons.IconHamburger do
  use Moon.StatelessComponent

  property color, :string
  property background_color, :string

  def render(assigns) do
    class_name =
      get_class_name("Icons-IconHamburger-#{assigns[:color]}-#{assigns[:background_color]}")

    ~H"""
    <style>
      .{{ class_name }} {
        vertical-align: middle;
        color: {{ @color }};
        background-color: {{ @background_color }};
      }
    </style>

    <svg class={{ class_name }} width="16" height="14" viewBox="0 0 16 14" fill="none" xmlns="http://www.w3.org/2000/svg"> <rect width="16" height="2" rx="1" fill="currentColor"/> <rect y="6" width="16" height="2" rx="1" fill="currentColor"/> <rect y="12" width="16" height="2" rx="1" fill="currentColor"/> </svg>
    """
  end
end
