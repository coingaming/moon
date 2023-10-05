defmodule MoonWeb.Examples.Table.ClickableRowsTest do
  use MoonWeb.ConnCase, async: true

  test "rows should be clickable", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.TableExample.ClickableRows")

    assert view
           |> element("tr.bg-goku[data-testid=row-0]")
           |> has_element?()

    assert view
           |> element("tr.bg-goku[data-testid=row-1]")
           |> has_element?()

    view
    |> element("tr.bg-goku[data-testid=row-0]")
    |> render_click()

    assert view
           |> element("tr.bg-beerus[data-testid=row-0]")
           |> has_element?()

    assert view
           |> element("tr.bg-goku[data-testid=row-1]")
           |> has_element?()
  end

  # TODO: add screenshot test
end
