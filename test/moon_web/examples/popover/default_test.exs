defmodule MoonWeb.Examples.Popover.DefaultTest do
  use MoonWeb.ConnCase, async: true

  test "should open and close Popover", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.PopoverExample.Default")

    assert view |> element("#popover_id_1 div[role=button]")
    assert view |> element("#popover_id_1 div.hidden[aria-expanded=false]") |> has_element?()
    refute view |> element("#popover_id_1 div[aria-expanded=true]") |> has_element?()

    assert view
           |> element("#popover_id_1 div.bottom-full[class~=\"left-1/2\", \"-translate-x-1/2\"]")
           |> has_element?()

    view
    |> element("#popover_id_1 div[role=button]")
    |> render_click()

    assert view |> element("#popover_id_1 div[aria-expanded=true]") |> has_element?()
    refute view |> element("#popover_id_1 div.hidden[aria-expanded=false]") |> has_element?()

    view
    |> element("#popover_id_1 div[role=button]")
    |> render_click()

    assert view |> element("#popover_id_1 div.hidden[aria-expanded=false]") |> has_element?()
    refute view |> element("#popover_id_1 div[aria-expanded=true]") |> has_element?()
  end

  # TODO: add test case for closing the popover panel on-click-away
  # TODO: add screenshot test of open panel, default and hover
end
