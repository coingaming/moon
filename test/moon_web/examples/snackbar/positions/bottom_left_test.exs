defmodule MoonWeb.Examples.Snackbar.Positions.BottomLeftTest do
  use MoonWeb.ConnCase, async: true

  test "should be top left snackbar", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/SnackbarExample.Positions")

    assert view
           |> element(
             "div[id=snackbar_4][data-autoclose=true][data-timeout=5000][data-animate_class=animate-leftslide]"
           )
           |> has_element?()

    assert view
           |> element("#snackbar_4 div[data-testid=snackbar_4-trigger]")
           |> has_element?()

    assert view
           |> element("#snackbar_4 div.hidden.bottom-4.left-4[data-testid=snackbar_4-content]")
           |> has_element?()
  end

  # TODO: add screenshot test
end
