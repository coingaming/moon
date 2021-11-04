defmodule MoonWeb.Pages.Tutorials.Installation do
  @moduledoc false

  use MoonWeb, :live_view
  import Phoenix.HTML, only: [html_escape: 1]

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Heading
  alias MoonWeb.Components.Breadcrumbs
  alias MoonWeb.Components.Footer
  alias MoonWeb.Components.ThemesSelect

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Tutorials"
      },
      %{
        to: "/tutorials/installation",
        name: "Installation"
      }
    ]

  def mount(params, _session, socket) do
    {:ok,
     assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <TopToDown>
      <Breadcrumbs theme_name={@theme_name} breadcrumbs={@breadcrumbs} class="mb-2" />
      <Heading size={32}>Usage</Heading>

      <Heading size={24}>Requirements</Heading>
      <pre>
    * Can be used from any existing Phoenix project that uses LiveView 0.15 (Margus Pärt needs to deploy branch "render_block" lab to t1 to test it out)
    * Moon Surface components can be used from SLIM and EEX, but recommended new format is Surface + Tailwind + Moon Surface Components
      </pre>

      <Heading size={24}>Steps for including Moon Surface into new or old project</Heading>

      <pre>
    # 1. Create empty project (skip this test if you already have project where you want to include)
    mix phx.new aposta10_design --live --no-ecto --no-dashboard
    cd aposta10_design

    # 2. Include Moon Surface
    # add {html_escape("{:moon, git: \"git@github.com:coingaming/moon.git\"}")} to mix.exs deps

    # 3. Add a Plug.Static plug to your endpoint.ex
    plug Plug.Static,
      at: "/moon/assets",
      from: :moon,
      gzip: true,
      only: ~w(css svgs),
      cache_control_for_etags: "public, max-age=86400"

    # 4. Include Moon Surface themes to your layout
    &lt;link rel="stylesheet" href="&lt;%= Routes.static_path(@conn, "/moon/assets/css/lab-dark.css") %&gt;" /&gt;
    &lt;link rel="stylesheet" href="&lt;%= Routes.static_path(@conn, "/moon/assets/css/lab-light.css") %&gt;" /&gt;

    # 5. Tailwind configuration
    # 5.1 Change assets/package.json to include "NODE_ENV=production" for deploy step (this purges un-needed CSS)
    "deploy": "NODE_ENV=production webpack --mode production",

    # 5.2 Ensure that you have required dependencies in assets/package.json
    "postcss-import": "^14.0.0",
    "postcss-loader": "^4.1.0",
    "autoprefixer": "^10.2.1",
    "postcss": "^8.2.4",
    "tailwindcss": "^2.2.15"

    # 5.3 Create file assets/postcss.config.js
    module.exports = &#123;
      plugins: &#123;
        tailwindcss: &#123;&#125;,
        autoprefixer: &#123;&#125;,
      &#125;,
    &#125;

    # 5.4 Create file assets/tailwind.config.js
    module.exports = &#123;
      mode: 'jit',
      purge: [
        '../lib/**/*.ex',
        '../lib/**/*.heex',
        '../lib/**/*.eex',
        './js/**/*.js',
        '../deps/moon/lib/moon/**/*.ex'
      ],
      darkMode: false,
      theme: &#123;
        extend: &#123;
          // width: &#123;
          //   "66": "66px",
          //   "88": "88px",
          // &#125;,
          // height: &#123;
          //   "66": "66px",
          //   "88": "88px",
          // &#125;
        &#125;,
        colors: &#123;
          'transparent': 'transparent',
          'text': 'var(--color-text)',
          'background': 'var(--color-background)',
          'krillin-10': 'var(--color--krillin-10)',
          'krillin-100': 'var(--color--krillin-100)',
          'chi-chi-10': 'var(--color--chi-chi-10)',
          'chi-chi-100': 'var(--color--chi-chi-100)',
          'roshi-10': 'var(--color--roshi-10)',
          'roshi-100': 'var(--color--roshi-100)',
          'dodoria-10': 'var(--color--dodoria-10)',
          'dodoria-100': 'var(--color--dodoria-100)',
          'dodoria-100': 'var(--color--cell-10)',
          'cell-100': 'var(--color--cell-100)',
          'raditz-10': 'var(--color--raditz-10)',
          'raditz-100': 'var(--color--raditz-100)',
          'whis-10': 'var(--color--whis-10)',
          'whis-100': 'var(--color--whis-100)',
          'frieza-10': 'var(--color--frieza-10)',
          'frieza-100': 'var(--color--frieza-100)',
          'nappa-10': 'var(--color--nappa-10)',
          'nappa-100': 'var(--color--nappa-100)',
          'piccolo-80': 'var(--color--piccolo-80)',
          'piccolo-100': 'var(--color--piccolo-100)',
          'piccolo-120': 'var(--color--piccolo-120)',
          'hit-80': 'var(--color--hit-80)',
          'hit-100': 'var(--color--hit-100)',
          'hit-120': 'var(--color--hit-120)',
          'goten-100': 'var(--color--goten-100)',
          'goku-10': 'var(--color--goku-10)',
          'goku-40': 'var(--color--goku-40)',
          'goku-80': 'var(--color--goku-80)',
          'goku-100': 'var(--color--goku-100)',
          'gohan-10': 'var(--color--gohan-10)',
          'gohan-40': 'var(--color--gohan-40)',
          'gohan-80': 'var(--color--gohan-80)',
          'gohan-100': 'var(--color--gohan-100)',
          'beerus-100': 'var(--color--beerus-100)',
          'bulma-100': 'var(--color--bulma-100)',
          'trunks-100': 'var(--color--trunks-100)',
        &#125;,
      &#125;,
      variants: &#123;&#125;,
      plugins: [],
    &#125;

    # 5.5 Add postcss-loader into assets/webpack.config.js
    use: [MiniCssExtractPlugin.loader, 'css-loader', 'postcss-loader', 'sass-loader'],

    # 6. Run project
    mix phx.server
      </pre>
      <Footer />
      <ThemesSelect id="themes_select" theme_name={@theme_name} active_page={@active_page} />
    </TopToDown>
    """
  end
end
