defmodule Moon.Sites.Aposta10.Pages.MainPage.BestBookmakers.Item do
  use Moon.StatelessComponent

  property(image_url, :string)

  def render(assigns) do
    class_name = get_class_name("site-body-best-bookmakers-item")
    img_class_name = get_class_name("site-body-best-bookmakers-item-img")

    ~H"""
    <style>
      .{{ class_name }} {
        display: inline-block;
        width: 45vw;
        height: 80px;
        padding: 20px;
        margin-right: 10px;
        margin-bottom: 10px;
        overflow: hidden;
        background-color: #fff;
        border-radius: 12px;
        vertical-align: middle;
      }

      .{{ img_class_name }} {
      }

      {{ for_desktop() }} {
        .{{ class_name }} {
          width: 175px;
          height: 80px;
        }
      }
    </style>

    <div class={{ class_name }}>
      <img class={{ img_class_name }} src={{ "/uploads/img/site/#{ @image_url }" }} />
    </div>
    """
  end
end
