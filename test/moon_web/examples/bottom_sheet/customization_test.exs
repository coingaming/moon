defmodule MoonWeb.Examples.BottomSheet.CustomizationTest do
  use MoonWeb.ConnCase, async: true

  test "should open and close BottomSheet", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.BottomSheetExample.Customization")

    button_to_open_bottomsheet = view |> element("button[data-size=md]")
    assert button_to_open_bottomsheet |> render() =~ "Customized Bottom Sheet"

    assert view |> element("div.hidden[id=customized_bottom_sheet]") |> has_element?()

    button_to_open_bottomsheet |> render_click()

    assert view |> element("div[id=customized_bottom_sheet][data-is_open]") |> has_element?()
    assert view |> element("#customized_bottom_sheet div.moon-drag-handle") |> has_element?()
  end

  # TODO: add test case for closing the bottomsheet panel on-click-away
  # TODO: add screenshot test
end
