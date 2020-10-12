defmodule Moon.Sites.Aposta10.Pages.MainPage.Guides.Item do
  use Moon.StatelessComponent
  alias Moon.Components.Button
  alias Moon.Components.Text

  prop(label, :string)
  prop(title, :string)
  prop(image_url, :string)

  def render(assigns) do
    class_name = get_class_name("site-body-guide-item")
    thumb_class_name = get_class_name("site-body-guide-item-thumb")
    picture_class_name = get_class_name("site-body-guide-item-thumb-picture")

    ~H"""
    <style>
      .{{ class_name }} {
        display: inline-block;
        width: 100%;
        background-color: #38A174;
        position: relative;
        height: 150px;
        border-radius: 12px;
        overflow: hidden;
        margin-right: 10px;
        color: #fff;
      }

      .{{ thumb_class_name }} {
        position: relative;
      }

      .{{ picture_class_name }} {
        border-radius: 12px;
        position: absolute;
        right: 0;
        top: 0;
      }
    </style>

    <div class={{ class_name }}>
      <div class={{ thumb_class_name }}>
        <div style="position: absolute; left: 10px; top: 10px">
          <Text>{{ @label }}</Text>
        </div>

        <img class={{ picture_class_name }} src={{ "/uploads/img/site/#{ @image_url }" }} />

        <div style="position: absolute; top: 40px; left: 10px">
          <Text size=20>{{ @title }}</Text>
        </div>
      </div>

      <div style="position: absolute; bottom: 20px; left: 10px">
        <Button style="color: #38A174; background-color: #fff; font-size: 10px;">Learn more</Button>
      </div>
    </div>
    """
  end
end
