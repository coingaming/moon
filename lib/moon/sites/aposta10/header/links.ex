defmodule Moon.Sites.Aposta10.Header.Links do
  use Moon.StatelessComponent
  alias Moon.Sites.Aposta10.Header.Links.Link
  alias Moon.Components.Carousel

  def render(assigns) do
    ~H"""
    <style>
      .site-header-links {
        position: absolute;
        left: 0px;
        right: 0px;
        padding-bottom: 20px;
        top: 100px;
        background-color: #fff;
        z-index: 100;
      }

      {{ for_desktop() }} {
        .site-header-links {
          position: fixed;
          top: 0px;
          padding-top: 20px;
          left: 232px;
        }
      }
    </style>

    <div class="site-header-links">
      <Carousel>
        <Link text="soccer" />
        <Link text="tennis" />
        <Link text="basketball" />
        <Link text="volleyball" />
        <Link text="baseball" />
        <Link text="soccer" />
        <Link text="tennis" />
        <Link text="basketball" />
        <Link text="soccer" />
        <Link text="tennis" />
        <Link text="basketball" />
        <Link text="volleyball" />
        <Link text="baseball" />
        <Link text="soccer" />
        <Link text="tennis" />
        <Link text="basketball" />
      </Carousel>
    </div>
    """
  end
end
