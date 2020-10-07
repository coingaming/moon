defmodule Moon.Assets.Icons.IconLoyalty0 do
  use Moon.StatelessComponent

  property color, :string
  property background_color, :string

  def render(assigns) do
    class_name =
      get_class_name("Icons-IconLoyalty-0-#{assigns[:color]}-#{assigns[:background_color]}")

    ~H"""
    <style>
      .{{ class_name }} {
        vertical-align: middle;
        color: {{ @color }};
        background-color: {{ @background_color }};
      }
    </style>

    <svg class={{ class_name }} width="42" height="42" viewBox="0 0 42 42" fill="none" xmlns="http://www.w3.org/2000/svg"> <circle cx="21" cy="21" r="20" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-dasharray="56 8"/> </svg>
    """
  end
end
