defmodule MoonWeb.Pages.Design.PaginationPage do
  @moduledoc false

  require Logger
  use MoonWeb, :live_view

  alias MoonWeb.Components.Anatomy
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.PropsTable

  alias MoonWeb.Examples.Design.PaginationExample

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/v2/pagination",
        name: "Pagination"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription
        is_in_progress
        title="Pagination"
        image="facing/components/pagination.png"
      >
        <p></p>
      </ComponentPageDescription>

      <Anatomy>{component_anatomy()}</Anatomy>

      <ExamplesList examples={[
        PaginationExample.Default,
      ]} />

      <PropsTable title="Pagination props" module={Moon.Design.Pagination} />
    </Page>
    """
  end

  defp component_anatomy do
    """
    <Pagination>
      <Pagination.PrevButton>...</Pagination.PrevButton>
      <Pagination.Pages />
      <Pagination.NextButton>...</Pagination.NextButton>
    </Pagination>
    """
  end
end
