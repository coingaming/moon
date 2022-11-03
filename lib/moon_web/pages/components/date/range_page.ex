defmodule MoonWeb.Pages.Components.Date.RangeDatePage do
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
        to: "/components/date/range-date",
        name: "Range Date"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Range Datepicker">
        <p>
          Coming soon...
        </p>
      </ComponentPageDescription>
    </Page>
    """
  end
end
