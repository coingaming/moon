defmodule MoonWeb.Examples.Popover.WithCloseTest do
  use MoonWeb.ConnCase, async: true

  test "should open and close Popover", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/PopoverExample.WithClose")

    assert view |> element("#popover_id_8 div[data-testid=-trigger]")
    assert view |> element("#popover_id_8 div.hidden[aria-expanded=false]") |> has_element?()
    refute view |> element("#popover_id_8 div[aria-expanded=true]") |> has_element?()

    view
    |> element("#popover_id_8 div[data-testid=-trigger]")
    |> render_click()

    assert view |> element("#popover_id_8 div[aria-expanded=true]") |> has_element?()
    refute view |> element("#popover_id_8 div.hidden[aria-expanded=false]") |> has_element?()

    view
    |> element("#popover_id_8 button[data-testid=close_popover]")
    |> render_click()

    assert view |> element("#popover_id_8 div.hidden[aria-expanded=false]") |> has_element?()
    refute view |> element("#popover_id_8 div[aria-expanded=true]") |> has_element?()
  end

  # TODO: add screenshot test of open panel, default and hover
end
