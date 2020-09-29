defmodule Moon.Sites.MoonDocs.Layouts.DefaultLayout do
  use Moon.StatefulComponent

  alias Moon.Themed
  alias Moon.Sites.MoonDocs.Layouts.DefaultLayout.Content
  alias Moon.Sites.MoonDocs.Layouts.Header
  alias Moon.Sites.MoonDocs.Layouts.Footer

  data theme, :any, default: Moon.Sites.MoonDocs.Themes.Light
  property user_token, :string

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
          <script>window.userToken = "{{ @user_token }}";</script>
        </head>
        <body>
          <Header />
          <Content>
            <p>Usertoken: {{ @user_token }}</p>
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
