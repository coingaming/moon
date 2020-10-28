defmodule Moon.Assets.Icons.IconCurrencyCNY do
  use Moon.StatelessComponent
  use Moon.Components.Context

  property(color, :string)
  property(background_color, :string)
  property(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconCurrencyCNY-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="auto" height="1em"  viewBox="0 0 39 44" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M38.848 0.0319824H26.368L19.456 15.328H19.328L12.352 0.0319824H0L11.008 20.384H4.736V25.952H13.952V29.088H4.736V34.592H13.952V44H24.832V34.592H33.472V29.088H24.832V25.952H33.472V20.384H27.776L38.848 0.0319824Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
