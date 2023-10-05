defmodule MoonWeb.Examples.Modal.StyledContentTest do
  use MoonWeb.ConnCase, async: true

  test "should open and close Modal", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.ModalExample.ExampleWithStyledContent")

    assert view |> element("button.bg-piccolo") |> has_element?()
    assert view |> element("div.hidden[id=styled_modal]") |> has_element?()

    view
    |> element("button.bg-piccolo")
    |> render_click()

    assert view |> element("div[id=styled_modal][data-is_open]") |> has_element?()
    assert view |> element("#styled_modal div.moon-backdrop") |> has_element?()
    assert view |> element("#styled_modal div.bg-roshi.moon-panel") |> has_element?()
    assert view |> element("button.bg-transparent") |> has_element?()
    assert view |> element("svg.moon-icon") |> has_element?()

    view
    |> element("button.bg-transparent")
    |> render_click()

    assert view |> element("button.bg-piccolo") |> has_element?()
    assert view |> element("div.hidden[id=styled_modal]") |> has_element?()

    view
    |> element("button.bg-piccolo")
    |> render_click()

    assert view |> element("div[id=styled_modal][data-is_open]") |> has_element?()
    assert view |> element("#styled_modal div.bg-roshi.moon-panel") |> has_element?()
    assert view |> element("#styled_modal div.moon-backdrop") |> has_element?()
    assert view |> element("button.bg-transparent") |> has_element?()
    assert view |> element("svg.moon-icon") |> has_element?()

    view
    |> element("svg.moon-icon")
    |> render_click()

    assert view |> element("div.hidden[id=styled_modal]") |> has_element?()
  end

  # TODO: add screenshot test
end
