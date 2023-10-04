defmodule MoonWeb.Examples.Breadcrumb.OneItemTest do
  use MoonWeb.ConnCase, async: true

  test "doesn't have collapsed crumbs and arrow", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.BreadcrumbExample.OneItem")

    refute view |> element("#breadcrumb_1 ol.hidden.absolute") |> has_element?()
    refute view |> element("#breadcrumb_1 button.text-trunks[data-size=xs]") |> has_element?()

    refute view
           |> element("#breadcrumb_1 svg.moon-icon.fill-none.rtl\\:rotate-180")
           |> has_element?()
  end

  # TODO: add screenshot test
end
