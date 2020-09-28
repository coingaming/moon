defmodule Moon.Sites.Aposta10.Layouts.LayoutView do
  use Phoenix.View, root: "lib/moon_web/templates"
  alias MoonWeb.Router.Helpers, as: Routes
  import Surface

  def render(_, assigns) do
    ~H"""
    <html lang="en">
      <head>
        {{ Phoenix.HTML.Tag.csrf_meta_tag() }}
        <meta charset="utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Surface App</title>
        <link rel="stylesheet" href={{ Routes.static_path(@conn, "/css/moon/moon.css") }} />
        <script src={{ Routes.static_path(@conn, "/js/phoenix-v1.4.16.min.js") }}></script>
        <script src={{ Routes.static_path(@conn, "/js/phoenix_live_view-v0.11.1.min.js") }}></script>
      </head>
      <body>

        {{ @inner_content }}

        <script type="module" src={{ Routes.static_path(@conn, "/js/app.js") }}></script>
      </body>
    </html>
    """
  end
end
