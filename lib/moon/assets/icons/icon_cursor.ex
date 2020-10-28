defmodule Moon.Assets.Icons.IconCursor do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconCursor-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path fill-rule="evenodd" clip-rule="evenodd" d="M5.5 2.13397C5.82345 1.94723 6.224 1.9563 6.53866 2.15748L26.8688 15.1554C27.1929 15.3625 27.3694 15.7372 27.3228 16.1189C27.2763 16.5007 27.0149 16.8219 26.6506 16.9452L20.1417 19.1471L23.8955 25.6488C24.1716 26.127 24.0078 26.7386 23.5295 27.0148L18.0327 30.1884C17.5544 30.4645 16.9428 30.3006 16.6667 29.8223L12.9129 23.3206L7.75156 27.8566C7.46268 28.1104 7.0538 28.1761 6.69992 28.0256C6.34603 27.875 6.10985 27.5348 6.09246 27.1506L5.00103 3.04523C4.98413 2.67213 5.17656 2.32072 5.5 2.13397ZM7.08621 4.88137L7.99618 24.979L12.5089 21.0131C12.7339 20.8153 13.0358 20.7289 13.3314 20.7775C13.627 20.8262 13.8853 21.0048 14.035 21.2642L17.8987 27.9563L21.6634 25.7827L17.7998 19.0907C17.65 18.8312 17.6244 18.5183 17.7301 18.2379C17.8358 17.9576 18.0616 17.7394 18.3454 17.6434L24.0363 15.7182L7.08621 4.88137Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
