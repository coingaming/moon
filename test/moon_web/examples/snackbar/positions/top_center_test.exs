defmodule MoonWeb.Examples.Snackbar.Positions.TopCenterTest do
  use MoonWeb.ConnCase, async: true

  test "should be top left snackbar", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.SnackbarExample.Positions")

    assert view
           |> element(
             "div[id=snackbar_2][data-autoclose=true][data-timeout=5000][data-animate_class=animate-topslide]"
           )
           |> has_element?()

    assert view
           |> element("#snackbar_2 div[data-testid=snackbar_2-trigger]")
           |> has_element?()

    assert view
           |> element(
             "#snackbar_2 div.hidden.top-4.left-4.justify-center[data-testid=snackbar_2-content]"
           )
           |> has_element?()
  end

  # TODO: add screenshot test
end
