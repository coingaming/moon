defmodule Moon.Sites.MoonDocs.Layouts.Footer do
  use Moon.StatelessComponent

  alias Moon.Sites.MoonDocs.Layouts.Footer.ForMobile
  alias Moon.Sites.MoonDocs.Layouts.Footer.ForDesktop

  def render(assigns) do
    ~H"""
    <ForMobile />
    <ForDesktop />
    """
  end
end
