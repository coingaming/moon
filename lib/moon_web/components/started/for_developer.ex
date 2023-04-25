defmodule MoonWeb.Components.Started.ForDeveloper do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias MoonWeb.Components.IndentedCodeSnippet
  alias MoonWeb.Components.CodeSnippet
  alias MoonWeb.Components.PageSection

  def render(assigns) do
    ~F"""
    <PageSection title="Overview">
      <p><span class="font-medium">Moon Design System</span> is a collection of reusable components set up and grouped according to simple and clear standards. <span class="font-medium">Moon DS</span> component collection is the single source of truth that can be used to build any number of applications.</p>
    </PageSection>
    <PageSection title="Requirements">
      <p>
        <span class="font-medium">Moon Design System</span> can be used for new and existing Phoenix project that uses LiveView
      </p>
      <p>
        Moon Surface components
        <a
          class="text-piccolo font-medium transition-colors duration-200 hover:text-hit visited:text-hit"
          href={"#{live_path(MoonWeb.Endpoint, MoonWeb.Pages.PhoenixUsagePage)}"}
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
          href="https://tailwindcss.com/"
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
      <p class="font-medium">NB! You need to be using the latest version of Tailwind CSS for the system to work.</p>
    </PageSection>
    <PageSection title="Installing elixir, erlang & node.js">
      <p>We do use adsf here. Add .tool-versions file to the root of your projects:</p>
      <IndentedCodeSnippet>{tool_versions_code()}</IndentedCodeSnippet>
      <p>And run asdf install</p>
    </PageSection>
    <PageSection title="Project creating">
      <p>
        Create new Phoenix project (if needed) with LiveView enabled. Do not fetch dependencies.
      </p>
      <CodeSnippet>mix archive install hex phx_new
        mix phx.new my_super_app --live
        cd my_super_app
      </CodeSnippet>
    </PageSection>
    <PageSection title="Installing dependencies">
      <p>Add Moon Library to mix.exs deps section:</p>
      <IndentedCodeSnippet>{github_code()}</IndentedCodeSnippet>
      <p>and fetch dependencies.</p>
      <CodeSnippet>mix deps.get</CodeSnippet>
      <p>Make sure your phoenix* dependenciesversions do not conflict with the same in moon library.</p>

      <p>Add surface & esbuild configurations to the project's confix.exs:</p>
      <IndentedCodeSnippet>{config_exs_code()}</IndentedCodeSnippet>

      <p>Compile project and dependencies</p>
      <CodeSnippet>mix compile</CodeSnippet>

      <p>Initialize Surface as described <a
          href="https://surface-ui.org/getting_started#configuring-the-project-using-mix-surface.init"
          class="text-piccolo font-medium transition-colors duration-200 hover:text-hit visited:text-hit"
          target="_blank"
          rel="noreferrer"
        >here</a>. Please make sure that surface compiler is configured.</p>
      <CodeSnippet>mix surface.init</CodeSnippet>
    </PageSection>
    <PageSection title="Moon CSS/JS assets adding">
      <p>
        Add two Plug.Static plugs to your endpoint.ex
      </p>
      <IndentedCodeSnippet>{plug_static_code()}</IndentedCodeSnippet>
      <p>Import Moon Surface css and themes to project's assets/app.css:</p>
      <IndentedCodeSnippet>{themes_import_code()}</IndentedCodeSnippet>
      <p>Copy assets/package.json from deps/moon folder, or take two sections from there:</p>
      <p class="pl-4">scripts:</p>
      <IndentedCodeSnippet>{scripts_code()}</IndentedCodeSnippet>
      <p class="pl-4">dependencies:</p>
      <IndentedCodeSnippet>{dependencies_code()}</IndentedCodeSnippet>
      <p>Create file assets/postcss.config.js</p>
      <IndentedCodeSnippet>{postcss_config_code()}</IndentedCodeSnippet>
      <p>Create file assets/tailwind.config.js</p>
      <IndentedCodeSnippet>{tailwind_config_code()}</IndentedCodeSnippet>
      <p>Edit your assets/js/app.js</p>
      <IndentedCodeSnippet>{javascript_import_code()}</IndentedCodeSnippet>
      <p>Add/modify assets-related aliases in your mix.exs file</p>
      <IndentedCodeSnippet>{mix_exs_aliases()}</IndentedCodeSnippet>
      <p>Setup assets</p>
      <CodeSnippet>mix assets.setup</CodeSnippet>
      <p class="overflow-x-auto">
        Add theme-related class (find it in imported theme CSS file) and direction
        related attribute to your root HTML component, e.g. body in
        lib/my_super_app_web/components/layouts/root.html.heex
      </p>
      <IndentedCodeSnippet>{layout_modifications()}</IndentedCodeSnippet>
    </PageSection>
    <PageSection title="Run project">
      <CodeSnippet>mix phx.server</CodeSnippet>
    </PageSection>
    """
  end

  defp github_code() do
    """
    # mix.exs

    ...
    {:moon, git: "git@github.com:coingaming/moon.git"}
    # or
    {:moon, git: "https://github.com/coingaming/moon.git"}
    """
  end

  defp tool_versions_code() do
    """
    # .tool-versions

    erlang 25.2
    elixir 1.14.1
    nodejs 14.17.6
    """
  end

  defp config_exs_code() do
    """
    # config/config.exs

    ...
    import_config "../deps/moon/config/surface.exs"

    config :surface, :components, [
      # put here your app configs for surface
    ]

    config :esbuild,
      version: "0.16.4",
      default: [
        args: ~w(js/app.js --bundle --target=es2016 --outdir=../priv/static/assets),
        cd: Path.expand("../assets", __DIR__),
        env: %{"NODE_PATH" => "#{Path.expand("../deps", __DIR__)}:./node_modules"}
      ]

    """
  end

  defp plug_static_code() do
    """
    # lib/my_super_app/web/endpoint.ex

    ...
    plug(Plug.Static,
      at: "/moon/assets",
      from: :moon,
      gzip: true,
      only: ~w(assets themes images svgs favicon.ico robots.txt),
      cache_control_for_etags: "public, max-age=86400"
    )

    plug(Plug.Static,
      at: "/moon_icons/",
      from: :moon_icons,
      gzip: true,
      cache_control_for_etags: "public, max-age=86400"
    )
    ...
    """
  end

  defp themes_import_code() do
    """
    /* assets/css/app.css */

    /*
      this is a default theme - used on surface.moon.io
      feel free to copy and modify it
    */
    @import '../../deps/moon/priv/static/themes/moon.css';

    /*
      Not really required. Only few classes for components
      are from there. All tailwind imports are already there,
      so you can remove them from your own app.css
      also can import _components.css instead
      @import '../../deps/moon/assets/css/_components.css';
    */
    @import '../../deps/moon/assets/css/app.css';


    """
  end

  defp scripts_code() do
    """
    # assets.package.json

    "scripts": {
      "deploy": "NODE_ENV=production tailwindcss -i css/app.css -o ../priv/static/assets/app.css --postcss --minify",
      "build": "tailwindcss -i css/app.css -o ../priv/static/assets/app.css --postcss",
      "watch": "tailwindcss -i css/app.css -o ../priv/static/assets/app.css --postcss --watch"
    },
    """
  end

  defp dependencies_code() do
    """
    # assets.package.json

    "dependencies": {
      "@tailwindcss/forms": "^0.4.0",
      "autoprefixer": "^10.4.2",
      "postcss": "^8.4.5",
      "postcss-import": "^14.0.2",
      "tailwindcss": "^3.1.7",
      "tailwindcss-rtl": "^0.9.0",

      "@popperjs/core": "^2.11.6"
    },
    """
  end

  defp postcss_config_code() do
    """
    // assets/postcss.config.js

    module.exports = {
      plugins: {
        'postcss-import': {},
        tailwindcss: {},
        autoprefixer: {}
      }
    }
    """
  end

  defp tailwind_config_code() do
    """
    // assets/tailwind.config.js

    const tailwind_config = require("../deps/moon/assets/tailwind.config.js");

    tailwind_config.content = [
      "../lib/**/*.ex",
      "../lib/**/*.heex",
      "../lib/**/*.eex",
      "./js/**/*.js",

      "../deps/moon/lib/**/*.ex",
      "../deps/moon/lib/**/*.heex",
      "../deps/moon/lib/**/*.eex",
      "../deps/moon/assets/js/**/*.js",
    ];
    module.exports = tailwind_config;
    """
  end

  defp javascript_import_code() do
    """
    // assets/js/app.js

    ...
    import Hooks from "./_hooks"

    // the next line should be added
    import MoonHooks from "../../deps/moon/assets/js/hooks"

    let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
    let liveSocket = new LiveSocket("/live", Socket, {params: {_csrf_token: csrfToken}, hooks: {
        ...MoonHooks, // here we do use imported hooks
        ...Hooks
    }})
    """
  end

  defp mix_exs_aliases() do
    """
    # mix.exs

    ...
    defp aliases do
      [
        setup: ["deps.get", "assets.setup", "assets.build"],
        "assets.setup": ["cmd --cd assets npm i", "esbuild.install --if-missing"],
        "assets.build": ["cmd --cd assets npm run build", "esbuild default"],
        "assets.deploy": [
          "cmd --cd assets npm run deploy",
          "NODE_ENV=production esbuild default --minify",
          "phx.digest"
        ]
      ]
    end
    """
  end

  defp layout_modifications() do
    """
    <!-- lib/my_super_app_web/components/layouts/root.html.heex -->
    <!-- class name should be taken from theme imported -->
    ...
    <body class="... theme-moon-light" dir="ltr">
    ...
    """
  end
end
