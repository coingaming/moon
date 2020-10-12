defmodule Moon.Sites.Aposta10.Pages.MainPage.BannerCarousel.ItemDesktop do
  use Moon.StatelessComponent
  alias Moon.Components.Badge
  alias Moon.Components.Text
  alias Moon.Components.Stack
  alias Moon.Components.Inline

  prop(label, :string)
  prop(datetime, :string)
  prop(title, :string)
  prop(desc, :string)
  prop(image_url, :string)

  def render(assigns) do
    class_name = "site-body-banner-carousel-item-desktop"

    ~H"""
    <Context get={{ theme: theme }}>
      <style>
        .{{ class_name }} {
          width: 100%;
          display: none;
        }

        .{{ class_name }}-thumb {
          width: 50%;
          height: 400px;
          overflow: hidden;
          border-bottom-left-radius: 12px;
          border-top-left-radius: 12px;
          display: inline-block;
          background-color: #cccccc;
          background-image: url("./uploads/img/site/#{ @image_url }");
          background-position: center;
          background-size: cover;
        }

        .{{ class_name }}-body {
          width: 49%;
          display: inline-block;
          background-color: #fff;
          height: 100%;
          padding: 20px;
          border-bottom-right-radius: 12px;
          border-top-right-radius: 12px;
        }

        {{ for_desktop() }} {
          .{{ class_name }} {
            display: inline-block;
            height: 400px;
            overflow: hidden;
          }
        }
      </style>

      <div class="{{ class_name }}">
        <Inline>
          <div class="{{ class_name }}-thumb" />
          <div class="{{ class_name }}-body">
            <Stack>
              <Inline>
                <Badge background={{ theme.color.trunks_100 }}>{{ @label }}</Badge>
                <Badge background={{ theme.color.gohan_100 }} color={{ theme.color.text }}>{{ @datetime }}</Badge>
              </Inline>
              <Text size=32 weight=500>{{ @title }}</Text>
              <Text size=14>{{ @desc }}</Text>
            </Stack>
          </div>
        </Inline>
      </div>
    </Context>
    """
  end
end
