defmodule MoonWeb.Pages.Tutorials.Installation do
  @moduledoc false

  use MoonWeb, :live_view
  import Phoenix.HTML, only: [html_escape: 1]

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Heading
  alias MoonWeb.Components.Page

  data(breadcrumbs, :any,
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
  )

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <TopToDown>
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
          'text': 'var(-text)',
          'background': 'var(-background)',
          'krillin-10': 'var(--krillin-10)',
          'krillin-60': 'var(--krillin-60)',
          'krillin': 'var(--krillin)',
          'chi-chi-10': 'var(--chi-chi-10)',
          'chi-chi-60': 'var(--chi-chi-60)',
          'chi-chi': 'var(--chi-chi)',
          'roshi-10': 'var(--roshi-10)',
          'roshi-60': 'var(--roshi-60)',
          'roshi': 'var(--roshi)',
          'dodoria-10': 'var(--dodoria-10)',
          'dodoria-60': 'var(--dodoria-60)',
          'dodoria': 'var(--dodoria)',
          'cell-10': 'var(--cell-10)',
          'cell-60': 'var(--cell-60)',
          'cell': 'var(--cell)',
          'raditz-10': 'var(--raditz-10)',
          'raditz-60': 'var(--raditz-60)',
          'raditz': 'var(--raditz)',
          'whis-10': 'var(--whis-10)',
          'whis-60': 'var(--whis-60)',
          'whis': 'var(--whis)',
          'frieza-10': 'var(--frieza-10)',
          'frieza-60': 'var(--frieza-60)',
          'frieza': 'var(--frieza)',
          'nappa-10': 'var(--nappa-10)',
          'nappa-60': 'var(--nappa-60)',
          'nappa': 'var(--nappa)',
          'piccolo-80': 'var(--piccolo-80)',
          'piccolo': 'var(--piccolo)',
          'piccolo-120': 'var(--piccolo-120)',
          'hit-80': 'var(--hit-80)',
          'hit': 'var(--hit)',
          'hit-120': 'var(--hit-120)',
          'beerus': 'var(--beerus)',
          'goku-10': 'var(--goku-10)',
          'goku-40': 'var(--goku-40)',
          'goku-80': 'var(--goku-80)',
          'goku': 'var(--goku)',
          'gohan-10': 'var(--gohan-10)',
          'gohan-40': 'var(--gohan-40)',
          'gohan-80': 'var(--gohan-80)',
          'gohan': 'var(--gohan)',
          'bulma': 'var(--bulma)',
          'trunks': 'var(--trunks)',
          'goten': 'var(--goten)',
          'popo': 'var(--popo)',
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
      </TopToDown>
    </Page>
    """
  end
end
