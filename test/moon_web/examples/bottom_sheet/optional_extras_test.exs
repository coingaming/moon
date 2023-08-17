defmodule MoonWeb.Examples.BottomSheet.OptionalExtrasTest do
  use MoonWeb.ConnCase, async: true

  test "should open and close BottomSheet", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/BottomSheetExample.LargeWithAllOptionalExtras")

    button_to_open_bottomsheet = view |> element("button[data-size=md]")
    assert button_to_open_bottomsheet |> render() =~ "Show it to me!"

    assert view |> element("div.hidden[id=bottom_sheet_extras]") |> has_element?()

    button_to_open_bottomsheet |> render_click()

    assert view |> element("div[id=bottom_sheet_extras][data-is_open]") |> has_element?()
    assert view |> element("#bottom_sheet_extras div.moon-backdrop") |> has_element?()
    assert view |> element("#bottom_sheet_extras div.moon-drag-handle") |> has_element?()
    assert view |> element("#bottom_sheet_extras div.shadow-moon-lg") |> has_element?()

    button_to_close_bottomsheet = view |> element("button[data-size=lg]")
    assert button_to_close_bottomsheet |> render() =~ "Send"

    button_to_close_bottomsheet |> render_click()

    assert view |> element("div.hidden[id=bottom_sheet_extras]") |> has_element?()
  end

  # TODO: add test case for closing the bottomsheet panel on-click-away
  # TODO: add screenshot test
end
