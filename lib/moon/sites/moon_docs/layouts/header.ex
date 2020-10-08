defmodule Moon.Sites.MoonDocs.Layouts.Header do
  use Moon.StatelessComponent
  alias Moon.Sites.MoonDocs.Layouts.Header
  alias Header.Menu
  alias Header.Logo
  alias Header.Search

  def render(assigns) do
    ~H"""
    <style>
      .site-header {
        background-color: #fff;
        color: #000;
        position: relative;
      }
    </style>

    <div class="site-header">
      <Menu />
      <Logo />
      <Search />
    </div>
    """
  end
end
