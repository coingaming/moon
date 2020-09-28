defmodule Moon.Sites.Aposta10.Layouts.DefaultLayout do
  use Moon.StatefulComponent

  alias Moon.Themed
  alias Moon.Sites.Aposta10.Layouts.DefaultLayout.Content
  alias Moon.Sites.Aposta10.Layouts.Header
  alias Moon.Sites.Aposta10.Layouts.Footer

  data theme, :any, default: Moon.Sites.Aposta10.Themes.Light
  property conn, :any

  def render(assigns) do
    ~H"""
    <Themed theme={{ @theme }}>
      <html lang="en">
        <head>
          {{ Phoenix.HTML.Tag.csrf_meta_tag() }}
          <meta charset="utf-8"/>
          <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
          <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
          <title>Surface App</title>
          <link rel="stylesheet" href="/css/moon/moon.css" />
          <script src="/js/phoenix-v1.4.16.min.js"></script>
          <script src="/js/phoenix_live_view-v0.11.1.min.js"></script>
        </head>
        <body>
          <Header />
          <Content>
            <slot />
          </Content>
          <Footer />
          <script type="module" src="/js/app.js"></script>
        </body>
      </html>
    </Themed>
    """
  end
end
