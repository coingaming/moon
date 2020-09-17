defmodule Moon.Sites.Aposta10.Body.Footer do
  use Moon.StatelessComponent

  alias Moon.Sites.Aposta10.Body.Footer.ForMobile
  alias Moon.Sites.Aposta10.Body.Footer.ForDesktop

  def render(assigns) do
    ~H"""
    <ForMobile />
    <ForDesktop />
    """
  end
end
