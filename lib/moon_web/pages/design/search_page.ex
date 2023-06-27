defmodule MoonWeb.Pages.Design.SearchPage do
  @moduledoc false

  require Logger
  use MoonWeb, :live_view

  alias MoonWeb.Components.Anatomy
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.PropsTable

  alias MoonWeb.Examples.Design.SearchExample

  data(breadcrumbs, :any,
    default: [
      %{
        to: "/components",
        name: "Components"
      },
      %{
        to: "/components/v2/search",
        name: "Search"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription is_in_progress title="Search" image="facing/components/search.png">
        <p>Search enables users to specify a word or a phrase to find relevant pieces of content without the use of navigation.</p>
      </ComponentPageDescription>

      <ExamplesList examples={[
        SearchExample.Default,
        SearchExample.Custom
      ]} />

      <PropsTable module={Moon.Design.Search} />
    </Page>
    """
  end
end
