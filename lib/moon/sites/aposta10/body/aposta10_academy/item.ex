defmodule Moon.Sites.Aposta10.Body.Aposta10Academy.Item do
  use Moon.StatelessComponent
  alias Moon.Sites.Aposta10.Config
  alias Moon.Components.Label
  alias Moon.Components.Text

  property label, :string
  property length, :string
  property title, :string
  property image_url, :string

  def render(assigns) do
    class_name = get_class_name("site-body-aposta10-academy-item")
    thumb_class_name = get_class_name("site-body-aposta10-academy-item-thumb")
    picture_class_name = get_class_name("site-body-aposta10-academy-item-thumb-picture")

    ~H"""
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
          <Label background={{ Config.colors.color1 }}>{{ @label }}</Label>
        </div>

        <div style="position: absolute; left: 10px; bottom: 40px">
          <Label background={{ Config.colors.color2 }}>{{ @length }}</Label>
        </div>

        <img class={{ picture_class_name }} src={{ "/uploads/img/site/#{ @image_url }" }} />

        <div style="position: absolute; left: 10px; bottom: 10px">
          <Text>{{ @title }}</Text>
        </div>
      </div>
    </div>
    """
  end
end
