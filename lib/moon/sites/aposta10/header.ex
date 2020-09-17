defmodule Moon.Sites.Aposta10.Header do
  use Moon.StatelessComponent
  alias Moon.Sites.Aposta10.Header
  alias Header.Menu
  alias Header.Logo
  alias Header.Links
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
      <Links />
    </div>
    """
  end
end
