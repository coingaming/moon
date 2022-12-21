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
          class="text-piccolo font-medium transition-colors duration-200 hover:text-hit visited:text-hit"
          href={"#{live_path(MoonWeb.Endpoint, MoonWeb.Pages.PhoenixUsagePage, theme_name: @theme_name, direction: @direction)}"}
        >
          can be used from SLIM and EEX templates
        </a>
        , but recommended format is
        <a
          class="text-piccolo font-medium transition-colors duration-200 hover:text-hit visited:text-hit"
          href="https://surface-ui.org/"
          rel="nofollow"
          target="_blank"
        >
          Surface v0.9.x
        </a>
        +
        <a
          class="text-piccolo font-medium transition-colors duration-200 hover:text-hit visited:text-hit"
          href="https://tailwindcss.com/docs/guides/phoenix"
          rel="nofollow"
          target="_blank"
        >
          Tailwind
        </a>
        +
        <a
          class="text-piccolo font-medium transition-colors duration-200 hover:text-hit visited:text-hit"
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
      <CodeSnippet>mix phx.new my_super_app --live
        cd my_super_app
      </CodeSnippet>
      <p>Add Moon Library to mix.exs deps section:</p>
      <CodeSnippet>{html_escape("# mix.exs{:moon, git: \"git@github.com:coingaming/moon.git\"}")}</CodeSnippet>
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
      <CodeSnippet>plug Plug.Static,
        at: "/moon/assets",
        from: :moon,
        gzip: true,
        only: ~w(css svgs),
        cache_control_for_etags: "public, max-age=86400"
      </CodeSnippet>
      <p>Include Moon Surface themes to your layout, e.g. root.html.heex</p>
      <CodeSnippet>&lt;link rel="stylesheet" href="&lt;%= Routes.static_path(@conn, "/moon/assets/css/lab-dark.css") %&gt;" /&gt;
        &lt;link rel="stylesheet" href="&lt;%= Routes.static_path(@conn, "/moon/assets/css/lab-light.css") %&gt;" /&gt;
      </CodeSnippet>
    </PageSection>
    <PageSection title="Tailwind configuration">
      <p>
        Change assets/package.json to include "NODE_ENV=production" for deploy step (this purges un-needed CSS)
      </p>
      <CodeSnippet>"scripts": &#123;
        "deploy_css": "NODE_ENV=production tailwindcss --postcss --minify -i css/app.css -o ../priv/static/assets/app.css",
        "deploy_js": "NODE_PATH=../deps esbuild js/app.js --bundle --target=es2016 --outdir=../priv/static/assets --minify ",
        "deploy": "NODE_PATH=./node_modules npm run deploy_css && npm run deploy_js",
        "watch_css": "NODE_PATH=./node_modules tailwindcss --input=css/app.css --output=../priv/static/assets/app.css --postcss --watch",
        "watch_js": "NODE_PATH=../deps esbuild js/app.js --bundle --target=es2016 --outdir=../priv/static/assets --sourcemap=inline --watch"
        &#125;,
      </CodeSnippet>
      <p>Ensure that you have required dependencies in assets/package.json</p>
      <CodeSnippet>"postcss-import": "^14.0.0",
        "postcss-loader": "^4.1.0",
        "autoprefixer": "^10.2.1",
        "postcss": "^8.2.4",
        "tailwindcss": "^3.1.7",
        "tailwindcss-rtl": "^0.9.0"
      </CodeSnippet>

      <p>Create file assets/postcss.config.js
      </p>
      <CodeSnippet>module.exports = &#123;
        plugins: &#123;
        tailwindcss: &#123;&#125;,
        autoprefixer: &#123;&#125;,
        &#125;,
        &#125;
      </CodeSnippet>

      <p>Create file assets/tailwind.config.js</p>
      <CodeSnippet>module.exports = &#123;
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
        'piccolo': 'var(--piccolo)',
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
