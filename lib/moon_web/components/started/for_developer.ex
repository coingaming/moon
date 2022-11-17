defmodule MoonWeb.Components.Started.ForDeveloper do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias MoonWeb.Components.CodeSnippet
  alias MoonWeb.Components.PageSection

  data(theme_name, :string, from_context: :theme_name)
  data(direction, :string, from_context: :direction)

  def render(assigns) do
    ~F"""
    <PageSection title="Requirements">
      <p>
        Can be used for new and existing Phoenix project that uses LiveView
      </p>
      <p>
        Moon Surface components
        <a
          class="text-piccolo-100 font-medium transition-colors duration-200 hover:text-hit visited:text-hit"
          href={"#{live_path(MoonWeb.Endpoint, MoonWeb.Pages.PhoenixUsagePage, theme_name: @theme_name, direction: @direction)}"}
        >
          can be used from SLIM and EEX templates
        </a>
        , but recommended format is
        <a
          class="text-piccolo-100 font-medium transition-colors duration-200 hover:text-hit visited:text-hit"
          href="https://surface-ui.org/"
          rel="nofollow"
          target="_blank"
        >
          Surface v0.9.x
        </a>
        +
        <a
          class="text-piccolo-100 font-medium transition-colors duration-200 hover:text-hit visited:text-hit"
          href="https://tailwindcss.com/docs/guides/phoenix"
          rel="nofollow"
          target="_blank"
        >
          Tailwind
        </a>
        +
        <a
          class="text-piccolo-100 font-medium transition-colors duration-200 hover:text-hit visited:text-hit"
          href="/"
        >
          Moon Surface Components
        </a>
      </p>
    </PageSection>
    <PageSection title="Installing dependencies">
      <p>
        Create new Phoenix project (if needed) with LiveView enabled
      </p>
      <CodeSnippet>
        mix phx.new my_super_app --live
        cd my_super_app
      </CodeSnippet>
      <p>Add Moon Library to mix.exs deps section:</p>
      <CodeSnippet>{html_escape("# mix.exs\n{:moon, git: \"git@github.com:coingaming/moon.git\"}")}</CodeSnippet>
      <p>and fetch dependencies</p>
      <CodeSnippet>mix deps.get</CodeSnippet>
      <p>Initialize
      </p>
      <CodeSnippet>mix surface.init</CodeSnippet>
    </PageSection>
    <PageSection title="Moon CSS assets adding">
      <p>
        Add a Plug.Static plug to your endpoint.ex
      </p>
      <CodeSnippet>
        plug Plug.Static,
        at: "/moon/assets",
        from: :moon,
        gzip: true,
        only: ~w(css svgs),
        cache_control_for_etags: "public, max-age=86400"
      </CodeSnippet>
      <p>Include Moon Surface themes to your layout, e.g. root.html.heex</p>
      <CodeSnippet>
        &lt;link rel="stylesheet" href="&lt;%= Routes.static_path(@conn, "/moon/assets/css/lab-dark.css") %&gt;" /&gt;
        &lt;link rel="stylesheet" href="&lt;%= Routes.static_path(@conn, "/moon/assets/css/lab-light.css") %&gt;" /&gt;
      </CodeSnippet>
    </PageSection>
    <PageSection title="Tailwind configuration">
      <p>
        Change assets/package.json to include "NODE_ENV=production" for deploy step (this purges un-needed CSS)
      </p>
      <CodeSnippet>
        "scripts": &#123;
        "deploy_css": "NODE_ENV=production tailwindcss --postcss --minify -i css/app.css -o ../priv/static/assets/app.css",
        "deploy_js": "NODE_PATH=../deps esbuild js/app.js --bundle --target=es2016 --outdir=../priv/static/assets --minify ",
        "deploy": "NODE_PATH=./node_modules npm run deploy_css && npm run deploy_js",
        "watch_css": "NODE_PATH=./node_modules tailwindcss --input=css/app.css --output=../priv/static/assets/app.css --postcss --watch",
        "watch_js": "NODE_PATH=../deps esbuild js/app.js --bundle --target=es2016 --outdir=../priv/static/assets --sourcemap=inline --watch"
        &#125;,
      </CodeSnippet>
      <p>Ensure that you have required dependencies in assets/package.json</p>
      <CodeSnippet>
        "postcss-import": "^14.0.0",
        "postcss-loader": "^4.1.0",
        "autoprefixer": "^10.2.1",
        "postcss": "^8.2.4",
        "tailwindcss": "^3.1.7",
        "tailwindcss-rtl": "^0.9.0"
      </CodeSnippet>

      <p>Create file assets/postcss.config.js
      </p>
      <CodeSnippet>
        module.exports = &#123;
        plugins: &#123;
        tailwindcss: &#123;&#125;,
        autoprefixer: &#123;&#125;,
        &#125;,
        &#125;
      </CodeSnippet>

      <p>Create file assets/tailwind.config.js</p>
      <CodeSnippet>
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
        extend: &#123;&#125;,
        colors: &#123;
        'transparent': 'transparent',
        'text': 'var(--color-text)',
        'background': 'var(--color-background)',
        'krillin-10': 'var(--color--krillin-10)',
        'krillin-60': 'var(--color--krillin-60)',
        'krillin-100': 'var(--color--krillin-100)',
        'chi-chi-10': 'var(--color--chi-chi-10)',
        'chi-chi-60': 'var(--color--chi-chi-60)',
        'chi-chi-100': 'var(--color--chi-chi-100)',
        'roshi-10': 'var(--color--roshi-10)',
        'roshi-60': 'var(--color--roshi-60)',
        'roshi-100': 'var(--color--roshi-100)',
        'dodoria-10': 'var(--color--dodoria-10)',
        'dodoria-60': 'var(--color--dodoria-60)',
        'dodoria-100': 'var(--color--dodoria-100)',
        'cell-10': 'var(--color--cell-10)',
        'cell-60': 'var(--color--cell-60)',
        'cell-100': 'var(--color--cell-100)',
        'raditz-10': 'var(--color--raditz-10)',
        'raditz-60': 'var(--color--raditz-60)',
        'raditz-100': 'var(--color--raditz-100)',
        'whis-10': 'var(--color--whis-10)',
        'whis-60': 'var(--color--whis-60)',
        'whis-100': 'var(--color--whis-100)',
        'frieza-10': 'var(--color--frieza-10)',
        'frieza-60': 'var(--color--frieza-60)',
        'frieza-100': 'var(--color--frieza-100)',
        'nappa-10': 'var(--color--nappa-10)',
        'nappa-60': 'var(--color--nappa-60)',
        'nappa-100': 'var(--color--nappa-100)',
        'piccolo-80': 'var(--color--piccolo-80)',
        'piccolo-100': 'var(--color--piccolo-100)',
        'piccolo-120': 'var(--color--piccolo-120)',
        'hit-80': 'var(--color--hit-80)',
        'hit-100': 'var(--color--hit-100)',
        'hit-120': 'var(--color--hit-120)',
        'beerus-100': 'var(--color--beerus-100)',
        'goku-10': 'var(--color--goku-10)',
        'goku-40': 'var(--color--goku-40)',
        'goku-80': 'var(--color--goku-80)',
        'goku-100': 'var(--color--goku-100)',
        'gohan-10': 'var(--color--gohan-10)',
        'gohan-40': 'var(--color--gohan-40)',
        'gohan-80': 'var(--color--gohan-80)',
        'gohan-100': 'var(--color--gohan-100)',
        'bulma-100': 'var(--color--bulma-100)',
        'trunks-100': 'var(--color--trunks-100)',
        'goten-100': 'var(--color--goten-100)',
        'popo-100': 'var(--color--popo-100)',
        &#125;,
        &#125;,
        variants: &#123;&#125;,
        plugins: [require('tailwindcss-rtl')],
        &#125;
      </CodeSnippet>

      <p>
        Add postcss-loader into assets/webpack.config.js
      </p>
      <CodeSnippet>use: [MiniCssExtractPlugin.loader, 'css-loader', 'postcss-loader', 'sass-loader'],</CodeSnippet>
      <PageSection title="Run project">
      </PageSection>
      <CodeSnippet>mix phx.server</CodeSnippet>
    </PageSection>
    """
  end
end
