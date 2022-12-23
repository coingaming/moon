defmodule MoonWeb.Pages.Components.SearchPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/search",
        name: "Search"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription is_deprecated title="Search">
        <p>
          Coming soon...
        </p>
      </ComponentPageDescription>
    </Page>
    """
  end
end
