defmodule MoonWeb.Examples.Popover.TriggerElements.ButtonTest do
  use MoonWeb.ConnCase, async: true

  test "should open and close Popover", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.PopoverExample.TriggerElements")

    assert view |> element("#popover_id_5 button.bg-piccolo[data-size=md]") |> has_element?()
    assert view |> element("#popover_id_5 div.hidden[aria-expanded=false]") |> has_element?()
    refute view |> element("#popover_id_5 div[aria-expanded=true]") |> has_element?()

    assert view
           |> element("#popover_id_5 div.bottom-full[class~=\"left-1/2\", \"-translate-x-1/2\"]")
           |> has_element?()
  end

  # TODO: add screenshot test of open panel, default and hover
end
