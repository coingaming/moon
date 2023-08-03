defmodule MoonWeb.Examples.Popover.TriggerElements.SpanTest do
  use MoonWeb.ConnCase, async: true

  test "should open and close Popover", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/PopoverExample.TriggerElements")

    assert view |> element("#popover_id_7 div.hidden[aria-expanded=false]") |> has_element?()
    refute view |> element("#popover_id_7 div[aria-expanded=true]") |> has_element?()
    assert view |> element("#popover_id_7 span.text-moon-14.text-trunks") |> has_element?()

    assert view
           |> element("#popover_id_7 div.bottom-full[class~=\"left-1/2\", \"-translate-x-1/2\"]")
           |> has_element?()
  end

  # TODO: add screenshot test of open panel, default and hover
end
