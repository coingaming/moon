defmodule Moon.Sites.Aposta10.Pages.TipsPage do
  use Moon.LiveView
  use Moon.Components.Context

  alias Moon.Sites.Aposta10.Pages.MainPage
  alias MainPage.BannerCarousel
  alias MainPage.Picks
  alias MainPage.FeaturedBookmakers
  alias MainPage.Aposta10Academy
  alias MainPage.BlogCarousel
  alias MainPage.Guides
  alias MainPage.BestBookmakers

  def render(assigns) do
    class_name = get_class_name("tips-page")

    ~H"""
    <Context get={{ :theme }}>
      <style>
        .{{ class_name }} {
          background-color: {{ @theme.color.gohan_100 }};
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

      <div class={{ class_name }}>
        <div class="{{ class_name }}-inner">
          <BannerCarousel />
          <Picks />
          <FeaturedBookmakers />
          <Aposta10Academy />
          <BlogCarousel />
          <Guides />
          <BestBookmakers />
        </div>
      </div>
    </Context>
    """
  end
end
