defmodule Moon.Assets.Icons.IconCurrencyTRY do
  use Moon.StatelessComponent
  use Moon.Components.Context

  property(color, :string)
  property(background_color, :string)
  property(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconCurrencyTRY-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="auto" height="1em"  viewBox="0 0 37 44" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M28.712 25.632C26.536 32.992 23.784 35.872 18.792 35.872H16.936V27.04L28.52 21.536L26.344 16.8L16.936 21.28V17.568L28.52 12.064L26.344 7.32798L16.936 11.808V0.0319824H6.12004V16.992L0.0400391 19.872L2.21604 24.544L6.12004 22.688V26.464L0.0400391 29.344L2.21604 34.016L6.12004 32.16V44H19.176C27.752 44 33.704 40.032 36.776 28.384L28.712 25.632Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
