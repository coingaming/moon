defmodule Moon.Sites.Aposta10.Pages.MainPage.Aposta10Academy.Item do
  use Moon.StatelessComponent
  use Moon.Components.Context
  alias Moon.Components.Badge
  alias Moon.Components.Text

  prop(label, :string)
  prop(length, :string)
  prop(title, :string)
  prop(image_url, :string)

  def render(assigns) do
    class_name = get_class_name("site-body-aposta10-academy-item")
    thumb_class_name = get_class_name("site-body-aposta10-academy-item-thumb")
    picture_class_name = get_class_name("site-body-aposta10-academy-item-thumb-picture")

    ~H"""
    <Context get={{ theme: _theme }}>
      <style>
        .{{ class_name }} {
          display: inline-block;
          width: 90vw;
          padding-left: 10px;
        }

        .{{ thumb_class_name }} {
          position: relative;
        }

        .{{ picture_class_name }} {
          border-radius: 12px;
        }

        {{ for_desktop() }} {
          .{{ class_name }} {
            width: auto;
          }
        }
      </style>

      <div class={{ class_name }}>
        <div class={{ thumb_class_name }}>
          <div style="position: absolute; left: 10px; top: 10px">
            <Badge background_color="gohan_100">{{ @label }}</Badge>
          </div>

          <div style="position: absolute; left: 10px; bottom: 40px">
            <Badge background_color="trunks_100">{{ @length }}</Badge>
          </div>

          <img class={{ picture_class_name }} src={{ "/uploads/img/site/#{ @image_url }" }} />

          <div style="position: absolute; left: 10px; bottom: 10px">
            <Text>{{ @title }}</Text>
          </div>
        </div>
      </div>
    </Context>
    """
  end
end
