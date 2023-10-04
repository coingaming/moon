defmodule MoonWeb.Examples.Snackbar.AutoCloseTest do
  use MoonWeb.ConnCase, async: true

  test "should after 1 sec", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.SnackbarExample.AutoClose")

    assert view
           |> element(
             "div[id=snackbar_16][data-autoclose=true][data-timeout=1000][data-animate_class=animate-rightslide]"
           )
           |> has_element?()
  end

  test "should after 3 sec", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/example/Design.SnackbarExample.AutoClose")

    assert view
           |> element(
             "div[id=snackbar_17][data-autoclose=true][data-timeout=3000][data-animate_class=animate-rightslide]"
           )
           |> has_element?()
  end

  # TODO: add screenshot test
end
