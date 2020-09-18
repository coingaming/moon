defmodule Moon.Sites.Aposta10.Body.BannerCarousel.ItemDesktop do
  use Moon.StatelessComponent
  alias Moon.Sites.Aposta10.Config
  alias Moon.Components.Label
  alias Moon.Components.Text
  alias Moon.Components.Stack
  alias Moon.Components.Inline

  property label, :string
  property datetime, :string
  property title, :string
  property desc, :string
  property image_url, :string

  context get theme, from: Moon.Themed

  def render(assigns) do
    class_name = "site-body-banner-carousel-item-desktop"

    ~H"""
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
              <Label background={{ @theme.colors["color1.100"] }}>{{ @label }}</Label>
              <Label background={{ "#EAEEF0" }} color={{ "#8697A2" }}>{{ @datetime }}</Label>
            </Inline>
            <Text size=32 weight=500>{{ @title }}</Text>
            <Text size=14>{{ @desc }}</Text>
          </Stack>
        </div>

      </Inline>

    </div>
    """
  end
end
