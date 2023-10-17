defmodule MoonWeb.Examples.Table.CheckboxesTest do
  use MoonWeb.ConnCase, async: true

  test "should check and uncheck", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.TableExample.Checkboxes")

    assert view
           |> element("tr.bg-goku[data-testid=row-0]")
           |> has_element?()

    assert view
           |> element("#[data-testid=row-0] span[phx-value-id=1]")
           |> has_element?()

    assert view
           |> element("#[data-testid=row-0] div.w-4.h-4.border-trunks")
           |> has_element?()

    view
    |> element("#[data-testid=row-0] span[phx-value-id=1]")
    |> render_click()

    assert view
           |> element("tr.bg-beerus[data-testid=row-0]")
           |> has_element?()

    assert view
           |> element("#[data-testid=row-0] span[phx-value-id=1]")
           |> has_element?()

    assert view
           |> element("#[data-testid=row-0] div.w-4.h-4.border-piccolo.bg-piccolo")
           |> has_element?()

    view
    |> element("#[data-testid=row-0] span[phx-value-id=1]")
    |> render_click()

    assert view
           |> element("tr.bg-goku[data-testid=row-0]")
           |> has_element?()

    assert view
           |> element("#[data-testid=row-0] span[phx-value-id=1]")
           |> has_element?()

    assert view
           |> element("#[data-testid=row-0] div.w-4.h-4.border-trunks")
           |> has_element?()
  end

  # TODO: add screenshot test
end
