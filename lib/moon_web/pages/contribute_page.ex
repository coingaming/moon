defmodule MoonWeb.Pages.ContributePage do
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
        <CodeSnippet>asdf plugin add erlang</CodeSnippet>
        <CodeSnippet>asdf plugin add elixir</CodeSnippet>
        <CodeSnippet>asdf plugin add nodejs</CodeSnippet>
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
        <CodeSnippet>run-auto-importers.sh</CodeSnippet>
        <CodeSnippet>mix assets.setup</CodeSnippet>
        <CodeSnippet>cd $root_dir/scripts/typescript/</CodeSnippet>
        <CodeSnippet>npm install</CodeSnippet>
        <p class="text-moon-16">Clone the repository:</p>
        <CodeSnippet>git clone git@github.com:coingaming/assets.git</CodeSnippet>
        <CodeSnippet>cd assets</CodeSnippet>
        <CodeSnippet>git reset --hard HEAD</CodeSnippet>
        <CodeSnippet>git pull</CodeSnippet>
        <CodeSnippet>npm install -g pnpm</CodeSnippet>
        <CodeSnippet>pnpm install</CodeSnippet>
        <CodeSnippet>pnpm run build</CodeSnippet>
        <CodeSnippet>export page=$(grep ICON_PAGE_NAME .env | cut -d '=' -f2)</CodeSnippet>
        <CodeSnippet>npm run figma --page=$page</CodeSnippet>
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
            href="https://surface.moon.io/components/v2/menu-item"
            class="text-piccolo font-medium transition-colors duration-200 hover:text-hit visited:text-hit"
            target="_blank"
            rel="noreferrer"
          >UI components</a>.</p>
        <p>To format your code, run:</p>
        <CodeSnippet>mix format</CodeSnippet>
        <CodeSnippet>mix surface.format</CodeSnippet>
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
        </ul>
      </PageSection>
    </Page>
    """
  end
end
