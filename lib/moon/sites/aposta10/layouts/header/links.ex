defmodule Moon.Sites.Aposta10.Layouts.Header.Links do
  use Moon.StatelessComponent
  alias Moon.Sites.Aposta10.Layouts.Header.Links.Link
  alias Moon.Components.Carousel

  def render(assigns) do
    class_name = get_class_name("site-header-links")

    ~H"""
    <style>
      .{{ class_name }} {
        position: absolute;
        left: 0px;
        right: 0px;
        padding-bottom: 20px;
        top: 100px;
        background-color: #fff;
        z-index: 100;
      }

      {{ for_desktop() }} {
        .{{ class_name }} {
          position: fixed;
          top: 0px;
          padding-top: 20px;
          left: 232px;
        }
      }
    </style>

    <div class={{ class_name }}>
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
