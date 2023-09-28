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

  alias MoonWeb.Components.ExampleAndCode

  data(breadcrumbs, :any,
    default: [
      %{
        to: "/components",
        name: "Components"
      },
      %{
        to: "/components/v2/pagination",
        name: "Pagination"
      }
    ]
  )

  data(current_page, :integer)

  def mount(params, _session, socket) do
    {:ok, assign(socket, current_page: String.to_integer(params["page"] || "1"))}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription
        is_in_progress
        is_rtl_support
        title="Pagination"
        image="facing/components/pagination.png"
      >
        <p>Pagination is the process of splitting information over multiple pages instead of showing it all on a single page.</p>
        <p>Also the name for the interface component used for navigating between these pages.</p>
      </ComponentPageDescription>

      <Anatomy>{component_anatomy()}</Anatomy>

      <ExamplesList examples={[
        PaginationExample.WithIcons,
        PaginationExample.WithText
      ]} />

      <ExampleAndCode title="With page hrefs" id="with_hrefs">
        <:example>
          <PaginationExample.WithPageHrefs id="with_hrefs" {=@current_page} />
        </:example>
        <:code>{PaginationExample.WithPageHrefs.code()}</:code>
      </ExampleAndCode>

      <PropsTable title="Pagination props" module={Moon.Design.Pagination} />
      <PropsTable title="Pagination.PrevButton props" module={Moon.Design.Pagination.PrevButton} />
      <PropsTable title="Pagination.NextButton props" module={Moon.Design.Pagination.NextButton} />
      <PropsTable title="Pagination.Pages props" module={Moon.Design.Pagination.Pages} />
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
