defmodule Moon.Sites.Aposta10.Header.Menu do
  use Moon.StatelessComponent
  alias Moon.Sites.Aposta10.Config
  alias Moon.Sites.Aposta10.Header.Menu.Link
  alias Moon.Sites.Aposta10.Header.Menu.Separator
  alias Moon.Sites.Aposta10.Body.Footer.FollowUs

  def render(assigns) do
    ~H"""
    <style>
      .site-header-menu {
        position: absolute;
        left: 20px;
        top: 20px;
        display: block;
      }

      .site-header-menu > .links {
        display: none;
      }

      {{ for_desktop() }} {
        .site-header-menu {
          position: fixed;
          background-color: #fff;
          top: 100px;
          left: 0px;
          height: 100%;
          width: 232px;
        }

        .site-header-menu > .hamburger {
          display: none;
        }

        .site-header-menu > .links {
          display: block;
        }
      }
    </style>

    <div class="site-header-menu">
      <div class="hamburger">
        <img src={{ "/uploads/img/site/menu.svg" }} />
      </div>

      <div class="links" style="padding: 20px;">
        <Link>Betting tips</Link>
        <Link>Bookmakers</Link>
        <Separator />
        <Link>Academy classes</Link>
        <Separator />
        <Link count=12>Podcasts</Link>
        <Link count=12>Videos</Link>
        <Link count=12>Blog</Link>
        <Separator />
        <Link>About</Link>
        <Link>Help centre</Link>
      </div>

    </div>
    """
  end
end
