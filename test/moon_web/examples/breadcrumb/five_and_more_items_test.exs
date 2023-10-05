defmodule MoonWeb.Examples.Breadcrumb.FiveAndMoreItemsTest do
  use MoonWeb.ConnCase, async: true

  # TODO: fix test

  test "should open and close Breadcrumb panel", %{conn: conn} do
    {:ok, _view, _html} = live(conn, "/example/BreadcrumbExample.FiveAndMoreItems")

    # assert view
    #        |> element("#breadcrumb_5 ol.hidden[id=breadcrumb_5_inner_breadcrumb_flyout]")
    #        |> has_element?()

    # assert view |> element("#breadcrumb_5 svg.h-4.moon-icon.w-4") |> has_element?()
    # assert view |> element("#breadcrumb_5 button.text-trunks[data-size=xs]") |> has_element?()
    # assert view |> element("#breadcrumb_5 li.text-trunks") |> has_element?()

    # assert view
    #        |> element("#breadcrumb_5 svg.moon-icon.fill-none.rtl\\:rotate-180")
    #        |> has_element?()

    # view |> element("#breadcrumb_5 button.text-trunks[data-size=xs]")
    # |> render_click()

    # assert view |> element("#breadcrumb_5 ol.flex[id=breadcrumb_5_inner_breadcrumb_flyout]") |> has_element?()
    # refute view |> element("#breadcrumb_5 ol.hidden[id=breadcrumb_5_inner_breadcrumb_flyout]") |> has_element?()
  end

  # TODO: add test case for closing the panel on-click-away
  # TODO: add screenshot test
end
