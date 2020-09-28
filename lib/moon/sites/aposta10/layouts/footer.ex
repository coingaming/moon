defmodule Moon.Sites.Aposta10.Layouts.Footer do
  use Moon.StatelessComponent

  alias Moon.Sites.Aposta10.Layouts.Footer.ForMobile
  alias Moon.Sites.Aposta10.Layouts.Footer.ForDesktop

  def render(assigns) do
    ~H"""
    <ForMobile />
    <ForDesktop />
    """
  end
end
