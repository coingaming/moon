defmodule Moon.Sites.Aposta10.Pages.MainPage.BlogCarousel.Item do
  use Moon.StatelessComponent
  use Moon.Components.Context
  alias Moon.Components.Badge
  alias Moon.Components.Text

  property(label, :string)
  property(datetime, :string)
  property(title, :string)
  property(desc, :string)
  property(image_url, :string)

  def render(assigns) do
    class_name = "site-body-blog-carousel-item"

    ~H"""
    <Context get={{ theme: theme }}>
      <style>
        .{{ class_name }} {
          display: inline-block;
          width: 90vw;
          padding-left: 10px;
          scroll-snap-align: left;
        }

        .{{ class_name }}-thumb {
          position: relative;
        }

        .{{ class_name }}-thumb-picture {
          border-radius: 12px;
        }

        {{ for_desktop() }} {
          .{{ class_name }} {
            width: 33%;
          }
        }
      </style>

      <div class={{ class_name }}>
        <div class="{{ class_name }}-thumb">
          <Badge background_color={{ theme.color.gohan_100 }} style="position: absolute; left: 10px; top: 10px">{{ @label }}</Badge>
          <Badge background_color={{ theme.color.gohan_100 }} style="position: absolute; left: 10px; bottom: 10px">{{ @datetime }}</Badge>
          <img class="{{ class_name }}-thumb-picture" src={{ "/uploads/img/site/#{ @image_url }" }} />
        </div>

        <Text size=18 weight=500>{{ @title }}</Text>
        <Text size=14>{{ @desc }}</Text>
      </div>
    </Context>
    """
  end
end
