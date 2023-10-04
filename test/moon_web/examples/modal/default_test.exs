defmodule MoonWeb.Examples.Modal.DefaultTest do
  use MoonWeb.ConnCase, async: true

  test "should open and close Modal", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.ModalExample.Default")

    assert view |> element("button[data-testid=open-modal]") |> has_element?()
    assert view |> element("div.hidden[id=default_modal]") |> has_element?()

    view
    |> element("button[data-testid=open-modal]")
    |> render_click()

    assert view |> element("div[id=default_modal][data-is_open]") |> has_element?()
    assert view |> element("#default_modal div.moon-backdrop") |> has_element?()
    assert view |> element("button[data-testid=close-modal]") |> has_element?()

    view
    |> element("button[data-testid=close-modal]")
    |> render_click()

    assert view |> element("div.hidden[id=default_modal]") |> has_element?()
  end

  # TODO: add test case for closing the modal panel on-click-away
  # TODO: add screenshot test
end
