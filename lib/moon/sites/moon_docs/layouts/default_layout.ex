defmodule Moon.Sites.MoonDocs.Layouts.DefaultLayout do
  use Moon.StatefulComponent

  alias Moon.Sites.MoonDocs.Layouts.DefaultLayout.Content
  alias Moon.Sites.MoonDocs.Layouts.Header
  alias Moon.Sites.MoonDocs.Layouts.Footer

  data(theme, :any, default: Moon.Sites.MoonDocs.Themes.Light)
  prop(user_token, :string)

  def render(assigns) do
    ~H"""
    <div>
      <Header />
      <Content>
        <slot />
      </Content>
      <Footer />
    </div>
    """
  end
end
