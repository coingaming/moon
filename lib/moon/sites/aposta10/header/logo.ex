defmodule Moon.Sites.Aposta10.Header.Logo do
  use Moon.StatelessComponent
  alias Moon.Sites.Aposta10.Config

  def render(assigns) do
    ~H"""
    <style>
      .site-header-logo {
        position: absolute;
        top: 13px;
        width: 100%;
        text-align: center;
      }

      {{ for_desktop() }} {
        .site-header-logo {
          position: fixed;
          width: 232px;
        }
      }
    </style>

    <div class="site-header-logo">
      <img src={{ "/uploads/img/site/logo.svg" }} />
    </div>
    """
  end
end
