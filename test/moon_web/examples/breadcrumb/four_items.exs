defmodule MoonWeb.Examples.Breadcrumb.FourItemsTest do
  use MoonWeb.ConnCase, async: true

  test "doesn't have collapsed crumbs", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/BreadcrumbExample.FourItems")

    refute view |> element("#breadcrumb_4 ol.hidden.absolute") |> has_element?()
    refute view |> element("#breadcrumb_4 button.text-trunks[data-size=xs]") |> has_element?()

    assert view
           |> element("#breadcrumb_4 svg.moon-icon.fill-none.rtl\\:rotate-180")
           |> has_element?()
  end

  # TODO: add screenshot test
end
