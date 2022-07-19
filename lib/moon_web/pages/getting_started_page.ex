defmodule MoonWeb.Pages.GettingStartedPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Page
  alias MoonWeb.Components.PageSection
  alias MoonWeb.Components.CodeSnippet

  data breadcrumbs, :any,
    default: [
      %{
        to: "/getting-started",
        name: "Getting Started"
      }
    ]

  def mount(params, _session, socket) do
    {:ok,
     assign(socket,
       theme_name: params["theme_name"] || "moon-design-light",
       active_page: __MODULE__
     )}
  end

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <h1 class="text-moon-32 font-semibold">Getting started</h1>
      <PageSection title="First Section">
        <p class="text-moon-16">Lorem ipsum dolor sit amet</p>
        <CodeSnippet>mix something</CodeSnippet>
        <p class="text-moon-16">Lorem ipsum dolor sit amet</p>
        <CodeSnippet>mix something.else</CodeSnippet>
      </PageSection>
      <PageSection title="Second Section">
        <p class="text-moon-16">
          Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sed quam at augue varius accumsan id in sapien. Suspendisse maximus tortor at urna blandit, et varius nibh maximus. Suspendisse potenti. Interdum et malesuada fames ac ante ipsum primis in faucibus.
        </p>
        <CodeSnippet>iex -S mix phx.something</CodeSnippet>
        <p class="text-moon-16">Lorem ipsum dolor sit amet</p>
        <CodeSnippet>iex -S mix phx.another</CodeSnippet>
      </PageSection>
    </Page>
    """
  end
end
