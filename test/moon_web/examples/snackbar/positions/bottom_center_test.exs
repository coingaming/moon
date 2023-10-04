defmodule MoonWeb.Examples.Snackbar.Positions.BottomCenterTest do
  use MoonWeb.ConnCase, async: true

  test "should be top left snackbar", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.SnackbarExample.Positions")

    assert view
           |> element(
             "div[id=snackbar_5][data-autoclose=true][data-timeout=5000][data-animate_class=animate-bottomslide]"
           )
           |> has_element?()

    assert view
           |> element("#snackbar_5 div[data-testid=snackbar_5-trigger]")
           |> has_element?()

    assert view
           |> element(
             "#snackbar_5 div.hidden.bottom-4.left-4.justify-center[data-testid=snackbar_5-content]"
           )
           |> has_element?()
  end

  # TODO: add screenshot test
end
