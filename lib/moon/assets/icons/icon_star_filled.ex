defmodule Moon.Assets.Icons.IconStarFilled do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconStarFilled-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path fill-rule="evenodd" clip-rule="evenodd" d="M13.4492 4.05582C14.474 1.59194 17.9644 1.59195 18.9891 4.05583L21.1699 9.29907C21.3139 9.6453 21.6395 9.88187 22.0133 9.91184L27.6739 10.3656C30.3338 10.5789 31.4124 13.8984 29.3858 15.6344L25.0731 19.3287C24.7883 19.5727 24.6639 19.9555 24.7509 20.3202L26.0685 25.8439C26.6877 28.4396 23.8639 30.4912 21.5866 29.1002L16.7404 26.1402C16.4204 25.9447 16.0179 25.9447 15.6979 26.1402L10.8517 29.1002C8.57443 30.4912 5.75068 28.4396 6.36984 25.8439L7.68745 20.3202C7.77446 19.9555 7.65009 19.5727 7.3653 19.3287L3.05258 15.6344C1.02596 13.8984 2.10455 10.5789 4.76451 10.3656L10.425 9.91184C10.7988 9.88187 11.1244 9.6453 11.2684 9.29907L13.4492 4.05582Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
