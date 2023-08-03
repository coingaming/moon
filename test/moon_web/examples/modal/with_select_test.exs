defmodule MoonWeb.Examples.WithSelectTest do
  use MoonWeb.ConnCase, async: true

  test "should open and close Modal", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/ModalExample.ExampleWithSelect")

    assert view |> element("button[data-testid=open-modal]") |> has_element?()
    assert view |> element("div.hidden[id=with_select_modal]") |> has_element?()

    view
    |> element("button[data-testid=open-modal]")
    |> render_click()

    assert view |> element("div[id=with_select_modal][data-is_open]") |> has_element?()
    assert view |> element("#with_select_modal div.moon-backdrop") |> has_element?()
    assert view |> element("#with_select_modal select[id=user_size]") |> has_element?()
    assert view |> element("#with_select_modal select[id=user_color]") |> has_element?()
    assert view |> element("#with_select_modal select[id=user_material]") |> has_element?()

    assert view |> element("button[data-testid=close-modal]") |> has_element?()

    view
    |> element("button[data-testid=close-modal]")
    |> render_click()

    assert view |> element("div.hidden[id=with_select_modal]") |> has_element?()
  end

  # TODO: add screenshot test
end
