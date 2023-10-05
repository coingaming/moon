defmodule MoonWeb.Examples.Tabs.DefaultTest do
  use MoonWeb.ConnCase, async: true

  test "should switch tab and panel", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.TabsExample.Default")

    assert view
           |> element(
             "#tabs-ex-1 button.text-piccolo[value=0][tabindex=0][role=tab][aria-selected=true]"
           )
           |> has_element?()

    assert view
           |> element("#tabs-ex-1 button.text-bulma[value=1][tabindex=1][role=tab]")
           |> has_element?()

    assert view
           |> element("#tabs-ex-1 button.text-bulma[value=2][tabindex=2][role=tab]")
           |> has_element?()

    assert view
           |> element("#tabs-ex-1 div[tabindex=0][role=tabpanel]")
           |> has_element?()

    refute view
           |> element("#tabs-ex-1 div[tabindex=1][role=tabpanel]")
           |> has_element?()

    refute view
           |> element("#tabs-ex-1 div[tabindex=2][role=tabpanel]")
           |> has_element?()

    view
    |> element("#tabs-ex-1 button.text-bulma[value=1][tabindex=1][role=tab]")
    |> render_click()

    assert view
           |> element("#tabs-ex-1 button.text-bulma[value=0][tabindex=0][role=tab]")
           |> has_element?()

    assert view
           |> element(
             "#tabs-ex-1 button.text-piccolo[value=1][tabindex=1][role=tab][aria-selected=true]"
           )
           |> has_element?()

    assert view
           |> element("#tabs-ex-1 button.text-bulma[value=2][tabindex=2][role=tab]")
           |> has_element?()

    refute view
           |> element("#tabs-ex-1 div[tabindex=0][role=tabpanel]")
           |> has_element?()

    assert view
           |> element("#tabs-ex-1 div[tabindex=1][role=tabpanel]")
           |> has_element?()

    refute view
           |> element("#tabs-ex-1 div[tabindex=2][role=tabpanel]")
           |> has_element?()
  end

  # TODO: add screenshot test
end
