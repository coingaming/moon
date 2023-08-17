defmodule MoonWeb.Pages.HowToContributePage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.PageSection
  alias MoonWeb.Components.CodeSnippet
  alias MoonWeb.Components.Page

  data(breadcrumbs, :any,
    default: [
      %{
        to: "/contribute",
        name: "How to contribute"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <h1 class="text-moon-32 font-semibold">How to contribute</h1>
      <PageSection title="Setup">
        <p class="text-moon-16">Clone the repository:</p>
        <CodeSnippet>git clone git@github.com:coingaming/moon.git</CodeSnippet>
        <p class="text-moon-16">Start local development server by running:</p>
        <CodeSnippet>run-locally-dev.sh</CodeSnippet>
        <p class="text-moon-16">
          If ./run-locally-dev.sh is not working, try the following steps:</p>
        <p class="text-moon-16">Install <a
            href="https://asdf-vm.com/"
            class="text-piccolo font-medium transition-colors duration-200 hover:text-hit visited:text-hit"
            target="_blank"
            rel="noreferrer"
          >asdf</a> and plugins:</p>
        <CodeSnippet>asdf plugin add erlang
          asdf plugin add elixir
          asdf plugin add nodejs
        </CodeSnippet>
        <p class="text-moon-16">Install all the tool versions specified in the .tool_versions file:</p>
        <CodeSnippet>asdf install</CodeSnippet>
        <p class="text-moon-16">Install assets dependencies:</p>
        <CodeSnippet>cd assets && npm i && cd -</CodeSnippet>
        <p class="text-moon-16">Try running local development server:</p>
        <CodeSnippet>iex -S mix phx.server</CodeSnippet>
        <p class="text-moon-16">Stop the command above, then try running:</p>
        <CodeSnippet>run-locally-dev.sh</CodeSnippet>
        <p class="text-moon-16">If you do see error in ElixirLS extension "no elixir command found", you'll need to:</p>
        <CodeSnippet>cp .tool-versions ~</CodeSnippet>
        <p class="text-moon-16">Install dependencies:</p>
        <CodeSnippet>mix deps.get</CodeSnippet>
      </PageSection>
      <PageSection title="Assets repository setup">
        <p class="text-moon-16">
          The following script imports Figma assets and icons. You need to set the values in the .env file. Please make sure you have read access to the assets tool repo https://github.com/coingaming/assets .</p>
        <CodeSnippet>run-auto-importers.sh
          mix assets.setup
          cd $root_dir/scripts/typescript/
          npm install
        </CodeSnippet>
        <p class="text-moon-16">Clone the repository:</p>
        <CodeSnippet>git clone git@github.com:coingaming/assets.git</CodeSnippet>
        <CodeSnippet>cd assets
          git reset --hard HEAD
          git pull\nnpm install -g pnpm
          pnpm install
          pnpm run build
          export page=$(grep ICON_PAGE_NAME .env | cut -d '=' -f2)
          npm run figma --page=$page
        </CodeSnippet>
      </PageSection>
      <PageSection title="Style guide">
        <p class="text-moon-16">Moon Design System follows
          <a
            href="https://garden.mirahi.io/get-started-with-headless-design-systems/"
            class="text-piccolo font-medium transition-colors duration-200 hover:text-hit visited:text-hit"
            target="_blank"
            rel="noreferrer"
          >headless design approach</a> - we build smart, functional and reusable
          <a
            href="https://surface.moon.io/components/v2/menu_item"
            class="text-piccolo font-medium transition-colors duration-200 hover:text-hit visited:text-hit"
            target="_blank"
            rel="noreferrer"
          >UI components</a>.</p>
        <p>To format your code, run:</p>
        <CodeSnippet>mix format
          mix surface.format
        </CodeSnippet>
      </PageSection>
      <PageSection title="Tests">
        <p class="text-moon-16">All newly added components must come with tests. In order to run the tests:</p>
        <CodeSnippet>mix test</CodeSnippet>
      </PageSection>

      <PageSection title="Check our Github">
        <ul class="list-inside list-disc text-moon-16">
          <li>
            <a
              href="https://github.com/coingaming/moon"
              class="text-piccolo font-medium transition-colors duration-200 hover:text-hit visited:text-hit"
              target="_blank"
              rel="noreferrer"
            >
              Github repository
            </a>
          </li>
          <li>
            <a
              href="https://github.com/coingaming/moon/blob/main//CONTRIBUTING.md"
              class="text-piccolo font-medium transition-colors duration-200 hover:text-hit visited:text-hit"
              target="_blank"
              rel="noreferrer"
            >
              Contributing page
            </a>
          </li>
        </ul>
      </PageSection>
    </Page>
    """
  end
end
