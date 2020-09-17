defmodule Moon.Sites.Aposta10.Header.Search do
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
      <img src={{ "/uploads/img/site/search.svg" }} />
    </div>
    """
  end
end
