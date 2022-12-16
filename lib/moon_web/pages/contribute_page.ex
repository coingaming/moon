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
        <p class="text-moon-16">Lorem ipsum dolor sit amet</p>
        <CodeSnippet>mix something</CodeSnippet>
        <p class="text-moon-16">Lorem ipsum dolor sit amet</p>
        <CodeSnippet>mix something.else</CodeSnippet>
      </PageSection>
      <PageSection title="Check our Github">
        <p class="text-moon-16">
          Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sed quam at augue varius accumsan id in sapien. Suspendisse maximus tortor at urna blandit, et varius nibh maximus. Suspendisse potenti. Interdum et malesuada fames ac ante ipsum primis in faucibus.
        </p>
        <CodeSnippet>iex -S mix phx.something</CodeSnippet>
        <p class="text-moon-16">Lorem ipsum dolor sit amet</p>
        <CodeSnippet>iex -S mix phx.another</CodeSnippet>
      </PageSection>
      <PageSection title="Check our Github">
        <li class="text-moon-16">
          Lorem ipsum
        </li>
      </PageSection>
    </Page>
    """
  end
end
