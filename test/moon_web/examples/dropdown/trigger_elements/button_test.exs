defmodule MoonWeb.Examples.Dropdown.TriggerElements.ButtonTest do
  use MoonWeb.ConnCase, async: true

  test "should have Button as trigger", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.DropdownExample.TriggerElements")

    assert view
           |> element("#dropdown-trigger-02 div[aria-haspopup=true]")
           |> has_element?()

    assert view
           |> element(
             "#dropdown-trigger-02 div[role=listbox][class*=\"max-h-0\"][class*=\"opacity-0\"]"
           )
           |> has_element?()

    assert view |> element("#dropdown-trigger-02 button.bg-piccolo") |> has_element?()
  end

  # TODO: add screenshot test of default state, hover state, open non-selected state, open selected state
end
