defmodule MoonWeb.Pages.Design.TablePage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Design.Table
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Examples.Design.TableExample

  data(breadcrumbs, :any,
    default: [
      %{
        to: "/components",
        name: "Components"
      },
      %{
        to: "/components/v2/table",
        name: "Table"
      }
    ]
  )

  data(checked, :list, default: [])

  @spec render(any) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Table" is_in_progress image="facing/components/table.png">
        <p>
          A component for displaying large amounts of data in rows and columns.
        </p>
      </ComponentPageDescription>

      <ExamplesList examples={[
        TableExample.Default,
        TableExample.ZebraStyle,
        TableExample.Headless,
        TableExample.WithCellBorders,
        TableExample.DifferentRowGaps,
        TableExample.DifferentRowSizes,
        TableExample.ClickableRows,
        TableExample.Checkboxes,
        TableExample.Sorting,
        TableExample.WithPaging,
        TableExample.Responsive
      ]} />

      <PropsTable title="Table props" module={Table} />
      <PropsTable title="Table.Column props" module={Table.Column} />
    </Page>
    """
  end
end
