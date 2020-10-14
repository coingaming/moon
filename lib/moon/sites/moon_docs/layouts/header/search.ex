defmodule Moon.Sites.MoonDocs.Layouts.Header.Search do
  use Moon.StatelessComponent

  def render(assigns) do
    ~H"""
    <style>
      .site-header-search {
        position: absolute;
        right: 20px;
        top: 20px;
      }
    </style>

    <div class="site-header-search">
    </div>
    """
  end
end
