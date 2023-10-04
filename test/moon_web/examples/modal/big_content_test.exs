defmodule MoonWeb.Examples.Modal.BigContentTest do
  use MoonWeb.ConnCase, async: true

  test "should open and close Modal", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.ModalExample.ExampleWithBigContent")

    assert view |> element("button[data-testid=open-modal]") |> has_element?()
    assert view |> element("div.hidden[id=big_content_modal]") |> has_element?()

    view
    |> element("button[data-testid=open-modal]")
    |> render_click()

    assert view |> element("div[id=big_content_modal][data-is_open]") |> has_element?()
    assert view |> element("#big_content_modal div.moon-backdrop") |> has_element?()
    assert view |> element("button[data-testid=close-modal]") |> has_element?()

    view
    |> element("button[data-testid=close-modal]")
    |> render_click()

    assert view |> element("div.hidden[id=big_content_modal]") |> has_element?()
  end

  # TODO: add screenshot test
end
