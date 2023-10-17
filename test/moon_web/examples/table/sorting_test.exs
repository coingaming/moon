defmodule MoonWeb.Examples.Table.SortingTest do
  use MoonWeb.ConnCase, async: true

  test "should sort", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.TableExample.Sorting")

    assert view
           |> element(
             "th[phx-value-sort-dir=ASC][phx-value-sort-key=id][data-testid=sort-column-id]"
           )
           |> has_element?()

    assert view
           |> element(
             "th[phx-value-sort-dir=DESC][phx-value-sort-key=name][data-testid=sort-column-name]"
           )
           |> has_element?()

    assert view
           |> element(
             "th[phx-value-sort-dir=ASC][phx-value-sort-key=user][data-testid=sort-column-user]"
           )
           |> has_element?()

    assert view
           |> element(
             "th[phx-value-sort-dir=ASC][phx-value-sort-key=created_at][data-testid=sort-column-created_at]"
           )
           |> has_element?()

    assert view
           |> element("th[phx-value-sort-dir=ASC][data-testid=sort-column-]")
           |> has_element?()

    view
    |> element("th[phx-value-sort-dir=ASC][phx-value-sort-key=id][data-testid=sort-column-id]")
    |> render_click()

    assert view
           |> element(
             "th[phx-value-sort-dir=DESC][phx-value-sort-key=id][data-testid=sort-column-id]"
           )
           |> has_element?()
  end

  # TODO: add screenshot test
end
