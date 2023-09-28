defmodule MoonWeb.Examples.BottomSheet.ResponsiveTest do
  use MoonWeb.ConnCase, async: true

  test "should open and close BottomSheet", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/BottomSheetExample.Responsive")

    button_to_open_bottomsheet = view |> element("button[data-size=md]")
    assert button_to_open_bottomsheet |> render() =~ "Modal"

    assert view |> element("div.hidden[id=modal_bottom_sheet]") |> has_element?()

    button_to_open_bottomsheet |> render_click()

    assert view |> element("div[id=modal_bottom_sheet][data-is_open]") |> has_element?()
    assert view |> element("#modal_bottom_sheet div.moon-backdrop") |> has_element?()
    assert view |> element("#modal_bottom_sheet div.moon-drag-handle") |> has_element?()

    assert view |> element("#modal_bottom_sheet div.lg\\:align-middle") |> has_element?()

    button_to_close_bottomsheet = view |> element("button[data-size=lg]")
    assert button_to_close_bottomsheet |> render() =~ "Got it!"

    button_to_close_bottomsheet |> render_click()

    assert view |> element("div.hidden[id=modal_bottom_sheet]") |> has_element?()
  end

  # TODO: add test case for closing the bottomsheet panel on-click-away
  # TODO: add screenshot test
end
