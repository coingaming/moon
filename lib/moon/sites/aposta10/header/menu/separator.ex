defmodule Moon.Sites.Aposta10.Header.Menu.Separator do
  use Moon.StatelessComponent

  def render(assigns) do
    ~H"""
    <style>
      .site-header-menu-separator {
        border-bottom: 1px solid #E7EAEC;
        padding-top: 10px;
        margin-bottom: 10px;
      }
    </style>

    <div class="site-header-menu-separator">
    </div>
    """
  end
end
