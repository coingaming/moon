defmodule Moon.Sites.Aposta10.Layouts.DefaultLayout.Content do
  use Moon.StatelessComponent

  def render(assigns) do
    class_name = get_class_name("sites-aposta10-layouts-defaultlayout-content")

    ~H"""
    <Context get={{ theme: theme }}>
      <style>
        .{{ class_name }} {
          background-color: {{ theme.color.background }};
          color: #000;
          padding-top: 200px;
          z-index: 101;
        }

        {{ for_desktop() }} {
          .{{ class_name }} {
            margin-left: 232px;
          }

          .{{ class_name }}-inner {
            margin: auto;
            max-width: 1136px;
          }
        }
      </style>

      <div class={{ class_name}}>
        <div class="{{ class_name }}-inner">
          <slot />
        </div>
      </div>
    </Context>
    """
  end
end
