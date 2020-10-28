defmodule Moon.Sites.Aposta10.Layouts.Footer.FollowUs do
  use Moon.StatelessComponent
  alias Moon.Sites.Aposta10.Layouts.Footer.FollowUs.Link
  alias Moon.Components.Carousel

  property(style, :string)

  def render(assigns) do
    class_name = get_class_name("site-footer-follow-us")

    ~H"""
    <style>
      .{{ class_name }} {
        {{ @style }}
      }
    </style>

    <div class={{ class_name }}>
      <Carousel>
        <Link brand="twitter" />
        <Link brand="twitter" />
        <Link brand="twitter" />
        <Link brand="twitter" />
        <Link brand="twitter" />
      </Carousel>
    </div>
    """
  end
end
