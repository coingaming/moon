defmodule MoonWeb.Pages.Design.TablePage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Design.Table
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Examples.Design.TableExample

  # import Phoenix.Component, only: [live_render: 3]

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
        TableExample.Editable,
        TableExample.Responsive
      ]} />

      <ExampleAndCode id="example-table-example-stream" title="Phoenix stream">
        <:example>
          <TableExample.Stream id="table-example-stream" container={{:div, class: "w-full"}} />
        </:example>
        <:code>{TableExample.Stream.code()}</:code>
      </ExampleAndCode>

      <PropsTable title="Table props" module={Table} />
      <PropsTable title="Table.Column props" module={Table.Column} />
      <PropsTable module={Table.Input} />
    </Page>
    """
  end
end
