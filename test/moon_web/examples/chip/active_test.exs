defmodule MoonWeb.Examples.Chip.ActiveTest do
  use MoonWeb.ConnCase, async: true

  test "active chip", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.ChipExample.Active")

    assert view |> element("button.bg-jiren.text-piccolo[data-testid=active]") |> has_element?()
    refute view |> element("button.shadow-interactive[data-testid=active]") |> has_element?()
    refute view |> element("button.bg-goku.text-bulma") |> has_element?()
  end

  test "active chip with stroke", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.ChipExample.Active")

    assert view
           |> element(
             "button.bg-jiren.text-piccolo.shadow-interactive[data-testid=active_stroke]"
           )
           |> has_element?()

    refute view |> element("button.bg-goku.text-bulma") |> has_element?()
  end

  # TODO: add screenshot test for default and hover state
end
