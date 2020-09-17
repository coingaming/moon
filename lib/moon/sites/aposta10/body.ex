defmodule Moon.Sites.Aposta10.Body do
  use Moon.StatelessComponent

  alias Moon.Sites.Aposta10.Body
  alias Body.BannerCarousel
  alias Body.Picks
  alias Body.FeaturedBookmakers
  alias Body.Aposta10Academy
  alias Body.BlogCarousel
  alias Body.Guides
  alias Body.BestBookmakers
  alias Body.Footer

  context get theme, from: Moon.Themed

  def render(assigns) do
    class_name = get_classname("site-body")

    ~H"""
    <style>
      .{{ class_name }} {
        background-color: {{ @theme.colors["some-test.100"] }};
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

    <div class="{{ class_name }}">
      <div class="{{ class_name }}-inner">
        <BannerCarousel />
        <Picks />
        <FeaturedBookmakers />
        <Aposta10Academy />
        <BlogCarousel />
        <Guides />
        <BestBookmakers />
        <Footer />
      </div>
    </div>
    """
  end
end
