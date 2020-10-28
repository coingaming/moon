defmodule Moon.Assets.Icons.IconLiveStream do
  use Moon.StatelessComponent
  use Moon.Components.Context

  property(color, :string)
  property(background_color, :string)
  property(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconLiveStream-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="auto"  viewBox="0 0 14 12" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M11.6457 11C11.8425 11 12 11.2286 12 11.5143C12 11.8 11.8425 12 11.6457 12H2.41339C2.17717 12 2 11.8571 2 11.5143C2 11.1143 2.17717 11 2.43307 11H11.6457Z" fill="currentColor"/> <path d="M5.2544 3C5.30891 3.03214 5.3816 3.06428 5.45428 3.09642C6.54456 3.65887 7.65301 4.20526 8.74329 4.76771C9.08854 4.94448 9.08854 5.07304 8.72512 5.24981C7.63484 5.81227 6.56273 6.35865 5.47245 6.90503C5.1272 7.0818 5 7.01752 5 6.66398C5 5.53907 5 4.43024 5 3.30533C5 3.1607 5 3.01607 5.2544 3Z" fill="currentColor"/> <rect x="0.5" y="0.5" width="13" height="9" rx="0.5" stroke="currentColor"/> </svg>
    </Context>
    """
  end
end
