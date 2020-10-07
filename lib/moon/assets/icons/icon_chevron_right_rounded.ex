defmodule Moon.Assets.Icons.IconChevronRightRounded do
  use Moon.StatelessComponent

  property color, :string
  property background_color, :string

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconChevronRightRounded-#{assigns[:color]}-#{assigns[:background_color]}"
      )

    ~H"""
    <style>
      .{{ class_name }} {
        vertical-align: middle;
        color: {{ @color }};
        background-color: {{ @background_color }};
      }
    </style>

    <svg class={{ class_name }} width="15" height="28" viewBox="0 0 15 28" fill="none" xmlns="http://www.w3.org/2000/svg">   <path fill-rule="evenodd" clip-rule="evenodd" d="M0.340035 27.7266C-0.0244544 27.3621 -0.0244544 26.7712 0.340035 26.4067L12.7467 14L0.340032 1.5933C-0.0244566 1.22881 -0.0244567 0.637858 0.340032 0.273369C0.704522 -0.0911216 1.29548 -0.0911216 1.65997 0.273369L14.7266 13.34C15.0911 13.7045 15.0911 14.2955 14.7266 14.66L1.65997 27.7266C1.29548 28.0911 0.704525 28.0911 0.340035 27.7266Z" fill="currentColor"/> </svg>
    """
  end
end
