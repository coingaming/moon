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
        only: ~w(assets themes images svgs favicon.ico robots.txt),
        cache_control_for_etags: "public, max-age=86400"
      </CodeSnippet>
      <CodeSnippet>plug Plug.Static,
        at: "/moon_icons/",
        from: :moon_icons,
        gzip: true,
        cache_control_for_etags: "public, max-age=86400"
      </CodeSnippet>
      <p>Include Moon Surface themes to your layout, e.g. root.html.heex</p>
      <CodeSnippet>&lt;link rel="stylesheet" href=&#123;static_path(@conn, "/themes/moon.css")&#125; /&gt;
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
      <CodeSnippet>
        "@tailwindcss/forms": "^0.4.0",
        "autoprefixer": "^10.4.2",
        "esbuild": "^0.13.9",
        "postcss": "^8.4.5",
        "postcss-import": "^14.0.2",
        "tailwindcss": "^3.1.7",
        "tailwindcss-rtl": "^0.9.0"
      </CodeSnippet>
      <p>Create file assets/postcss.config.js
      </p>
      <CodeSnippet>module.exports = &#123;
        plugins: &#123;
        'postcss-import': &#123;&#125;,
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
        ],
        plugins: [
        require('tailwindcss/forms'),
        require('tailwindcss-rtl')],
        &#125;
      </CodeSnippet>
    </PageSection>
    <PageSection title="Themes package">
      <p>
        Run:
      </p>
      <CodeSnippet>cp ../moon-design/workspaces/themes/src/*.css ../moon/priv/static/themes/
      </CodeSnippet>
      <p>This package contains all available themes as CSS files with configured tokens as CSS variables: main colours, support colours, border radius, border width, etc.</p>
      <p>For theming, we use CSS variables as tokens for styling various aspects of the website differently, while still maintaining the overall look and feel. You can import a CSS file with a particular theme from the package. The name of the CSS file corresponds to the name of the theme for a particular brand. Each file contains the Light and Dark modes.</p>
      <p>CSS variables are defined globally in the <code class="bg-goku px-2 rounded-moon-s-xs self-start">:root</code> element and also within the relevant class selector. Check your theme's CSS file for a proper class name. To switch between Light and Dark modes, you need to change classes. Usually, this main class has to be specified in a <code class="bg-goku px-2 rounded-moon-s-xs self-start">body</code> tag or the corresponding wrapper container.</p>
      <CodeSnippet>{":root.theme-moon-light,
          .theme-moon-light {
            --piccolo: 78 70 180; /* #4e46b4 */
            --hit: 64 166 159; /* #40a69f */
            --beerus: 235 235 235; /* #ebebeb */
            --gohan: 255 255 255; /* #ffffff */
            --goten: 255 255 255; /* #ffffff */
            --goku: 245 245 245; /* #f5f5f5 */
            --bulma: 0 0 0; /* #000000 */
            --trunks: 153 156 160; /* #999ca0 */
            --popo: 0 0 0; /* #000000 */
            --jiren: 78 70 180 / 0.12; /* #4e46b4 */
            --heles: 0 0 0 / 0.04; /* #000000 */
            --zeno: 0 0 0 / 0.56; /* #000000 */

            /* support-colors  */
            --krillin: 255 179 25; /* #ff9800 */
            --krillin-60: 255 179 25 / 0.56; /* #ff9800 */
            --krillin-10: 255 179 25 / 0.08; /* #ff9800 */

            --chichi: 255 78 100; /* #ff4e64 */
            --chichi-60: 255 78 100 / 0.56; /* #ff4e64 */
            --chichi-10: 255 78 100 / 0.08; /* #ff4e64 */

            --roshi: 46 125 50; /* #2e7d32 */
            --roshi-60: 46 125 50 / 0.56; /* #2e7d32 */
            --roshi-10: 46 125 50 / 0.08; /* #2e7d32 */

            --dodoria: 211 48 48; /* #d33030 */
            --dodoria-60: 211 48 48 / 0.56; /* #d33030 */
            --dodoria-10: 211 48 48 / 0.08; /* #d33030 */

            --cell: 149 241 213; /* #95f1d5 */
            --cell-60: 149 241 213 / 0.56; /* #95f1d5 */
            --cell-10: 149 241 213 / 0.08; /* #95f1d5 */

            --raditz: 179 128 74; /* #b3804a */
            --raditz-60: 179 128 74 / 0.56; /* #b3804a */
            --raditz-10: 179 128 74 / 0.08; /* #b3804a */

            --whis: 52 72 240; /* #3448f0 */
            --whis-60: 52 72 240 / 0.56; /* #3448f0 */
            --whis-10: 52 72 240 / 0.08; /* #3448f0 */

            --frieza: 92 51 207; /* #5c33cf */
            --frieza-60: 92 51 207 / 0.56; /* #5c33cf */
            --frieza-10: 92 51 207 / 0.08; /* #5c33cf */

            --nappa: 114 85 80; /* #725550 */
            --nappa-60: 114 85 80 / 0.56; /* #725550 */
            --nappa-10: 114 85 80 / 0.08; /* #725550 */

            /* border-radius */
            --radius-i-xs: 0.25rem; /* 4px */
            --radius-i-sm: 0.5rem; /* 8px */
            --radius-i-md: 0.75rem; /* 12px */
            --radius-s-xs: 0.25rem; /* 4px */
            --radius-s-sm: 0.5rem; /* 8px */
            --radius-s-md: 0.75rem; /* 12px */
            --radius-s-lg: 1rem; /* 16px */

            /* border-width */
            --border-width: 0.0625rem; /* 1px */
            --border-i-width: 0.125rem; /* 2px */

            /* opacity */
            --opacity-moon: 0.32;

            /* fonts */
            --averta: 'Averta Std';

            /* box-shadow */
            --shadow-xs: 0 4px 12px -6px rgb(0 0 0 / 0.06);
            --shadow-sm: 0 6px 6px -6px rgb(0 0 0 / 0.16), 0 0 1px rgb(0 0 0 / 0.4);
            --shadow-md: 0 12px 12px -6px rgb(0 0 0 / 0.16), 0 0 1px rgb(0 0 0 / 0.4);
            --shadow-lg: 0 8px 24px -6px rgb(0 0 0 / 0.16), 0 0 1px rgb(0 0 0 / 0.4);
            --shadow-xl: 0 32px 32px -8px rgb(0 0 0 / 0.08),
              0 0 32px -8px rgb(0 0 0 / 0.12), 0 0 1px rgb(0 0 0 / 0.2);
          }

          :root.theme-moon-dark,
          .theme-moon-dark {
            --piccolo: 91 80 238; /* #5b50ee */
            --hit: 64 166 159; /* #40a69f */
            --beerus: 68 68 68; /* #444444 */
            --gohan: 31 31 31; /* #1f1f1f */
            --goten: 255 255 255; /* #ffffff */
            --goku: 11 11 11; /* #0b0b0b */
            --bulma: 255 255 255; /* #ffffff */
            --trunks: 153 156 160; /* #999ca0 */
            --popo: 0 0 0; /* #000000 */
            --jiren: 91 80 238 / 0.32; /* #5b50ee */
            --heles: 255 255 255 / 0.12; /* #ffffff */
            --zeno: 0 0 0 / 0.56; /* #000000 */

            /* support-colors  */
            --krillin: 255 179 25; /* #ff9800 */
            --krillin-60: 255 179 25 / 0.56; /* #ff9800 */
            --krillin-10: 255 179 25 / 0.08; /* #ff9800 */

            --chichi: 255 78 100; /* #ff4e64 */
            --chichi-60: 255 78 100 / 0.56; /* #ff4e64 */
            --chichi-10: 255 78 100 / 0.08; /* #ff4e64 */

            --roshi: 46 125 50; /* #2e7d32 */
            --roshi-60: 46 125 50 / 0.56; /* #2e7d32 */
            --roshi-10: 46 125 50 / 0.08; /* #2e7d32 */

            --dodoria: 211 48 48; /* #d33030 */
            --dodoria-60: 211 48 48 / 0.56; /* #d33030 */
            --dodoria-10: 211 48 48 / 0.08; /* #d33030 */

            --cell: 149 241 213; /* #95f1d5 */
            --cell-60: 149 241 213 / 0.56; /* #95f1d5 */
            --cell-10: 149 241 213 / 0.08; /* #95f1d5 */

            --raditz: 179 128 74; /* #b3804a */
            --raditz-60: 179 128 74 / 0.56; /* #b3804a */
            --raditz-10: 179 128 74 / 0.08; /* #b3804a */

            --whis: 52 72 240; /* #3448f0 */
            --whis-60: 52 72 240 / 0.56; /* #3448f0 */
            --whis-10: 52 72 240 / 0.08; /* #3448f0 */

            --frieza: 92 51 207; /* #5c33cf */
            --frieza-60: 92 51 207 / 0.56; /* #5c33cf */
            --frieza-10: 92 51 207 / 0.08; /* #5c33cf */

            --nappa: 114 85 80; /* #725550 */
            --nappa-60: 114 85 80 / 0.56; /* #725550 */
            --nappa-10: 114 85 80 / 0.08; /* #725550 */

            /* border-radius */
            --radius-i-xs: 0.25rem; /* 4px */
            --radius-i-sm: 0.5rem; /* 8px */
            --radius-i-md: 0.75rem; /* 12px */
            --radius-s-xs: 0.25rem; /* 4px */
            --radius-s-sm: 0.5rem; /* 8px */
            --radius-s-md: 0.75rem; /* 12px */
            --radius-s-lg: 1rem; /* 16px */

            /* border-width */
            --border-width: 0.0625rem; /* 1px */
            --border-i-width: 0.125rem; /* 2px */

            /* opacity */
            --opacity-moon: 0.32;

            /* fonts */
            --averta: 'Averta Std';

            /* box-shadow */
            --shadow-xs: 0 4px 12px -6px rgb(0 0 0 / 0.64);
            --shadow-sm: 0 6px 6px -6px rgb(0 0 0 / 0.64), 0 0 1px rgb(0 0 0 / 0.56);
            --shadow-md: 0 12px 12px -6px rgb(0 0 0 / 0.64), 0 0 1px rgb(0 0 0 / 0.56);
            --shadow-lg: 0 24px 24px -6px rgb(0 0 0 / 0.64), 0 0 1px rgb(0 0 0 / 0.56);
            --shadow-xl: 0 48px 48px -6px rgb(0 0 0 / 0.88), 0 0 1px rgb(0 0 0 / 0.72);
          }
          "}</CodeSnippet>
    </PageSection>
    <PageSection title="Run project">
      <CodeSnippet>mix phx.server</CodeSnippet>
    </PageSection>
    <PageSection title="Useful links">
      <ul class="flex flex-col gap-1 list-disc list-inside">
        <li>
          <a
            href="https://tailwindcss.com/docs/installation"
            class="text-piccolo font-medium transition-colors duration-200 hover:text-hit visited:text-hit"
            target="_blank"
            rel="noreferrer"
          >
            Installation: Tailwind CLI - Tailwind CSS
          </a>
        </li>
        <li>
          <a
            href="https://tailwindcss.com/docs/editor-setup"
            class="text-piccolo font-medium transition-colors duration-200 hover:text-hit visited:text-hit"
            target="_blank"
            rel="noreferrer"
          >
            Editor Setup - Tailwind CSS
          </a>
        </li>
        <li>
          <a
            href="https://www.npmjs.com/package/tailwindcss-rtl"
            class="text-piccolo font-medium transition-colors duration-200 hover:text-hit visited:text-hit"
            target="_blank"
            rel="noreferrer"
          >
            npm: tailwindcss-rtl
          </a>
        </li>
      </ul>
    </PageSection>
    """
  end
end
