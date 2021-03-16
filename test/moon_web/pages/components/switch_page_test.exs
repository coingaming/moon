defmodule MoonWeb.Pages.Components.SwitchPageTest do
  use MoonWeb.ConnCase, async: true

  test "handle on_change event", %{conn: conn} do
    {:ok, view, html} = live(conn, "/moon-design-dark/components/switch")

    assert html =~ "@checked = false"

    assert view
           |> element("#first_switch button")
           |> render_click() =~ "@checked = true"
  end
end
