defmodule Moon.Assets.Icons.IconChevronDownRounded do
  use Moon.StatelessComponent
  use Moon.Components.Context

  property(color, :string)
  property(background_color, :string)
  property(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconChevronDownRounded-#{assigns.color}-#{assigns.background_color}-#{
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

    <svg class={{ class_name }} width="1em" height="auto"  viewBox="0 0 28 15" fill="none" xmlns="http://www.w3.org/2000/svg">   <path fill-rule="evenodd" clip-rule="evenodd" d="M0.273366 0.340035C0.637856 -0.0244543 1.22881 -0.0244544 1.5933 0.340035L14 12.7467L26.4067 0.340034C26.7712 -0.0244555 27.3621 -0.0244555 27.7266 0.340033C28.0911 0.704523 28.0911 1.29548 27.7266 1.65997L14.66 14.7266C14.2955 15.0911 13.7045 15.0911 13.34 14.7266L0.273366 1.65997C-0.0911229 1.29548 -0.091123 0.704525 0.273366 0.340035Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
