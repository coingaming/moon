defmodule MoonWeb.Examples.Snackbar.DefaultTest do
  use MoonWeb.ConnCase, async: true

  test "should open top right snackbar", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/SnackbarExample.Default")

    assert view
           |> element(
             "div[id=snackbar_default][data-autoclose=true][data-timeout=5000][data-animate_class=animate-rightslide]"
           )
           |> has_element?()

    assert view
           |> element("#snackbar_default div[data-testid=snackbar_default-trigger]")
           |> has_element?()

    assert view
           |> element(
             "#snackbar_default div.hidden.justify-end.top-4.right-4[data-testid=snackbar_default-content]"
           )
           |> has_element?()

    view
    |> element("#snackbar_default div[data-testid=snackbar_default-trigger]")
    |> render_click()

    assert view
           |> element(
             "#snackbar_default div.justify-end.top-4.right-4[data-testid=snackbar_default-content]"
           )
           |> has_element?()

    # TODO: cannot check refute hidden, bacause it is added after timeout
  end

  # TODO: add screenshot test
end
