defmodule MoonWeb.Examples.Table.EditableTest do
  use MoonWeb.ConnCase, async: true

  test "should have editable fields", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.TableExample.Editable")

    assert view
           |> element("#[data-testid=row-0-col-0] input[autocomplete=off]")
           |> has_element?()

    assert view
           |> element("#[data-testid=row-0-col-1] input[autocomplete=off]")
           |> has_element?()

    assert view
           |> element("#[data-testid=row-0-col-2] input[autocomplete=off]")
           |> has_element?()
  end

  # TODO: add screenshot test
end
