defmodule MoonWeb.Pages.ExamplesTest do
  use MoonWeb.ConnCase

  use Phoenix.VerifiedRoutes,
    endpoint: MoonWeb.Endpoint,
    router: MoonWeb.Router,
    statics: MoonWeb.static_paths()

  test "all examples open", %{conn: conn} do
    with {:ok, list} <- :application.get_key(:moon, :modules) do
      list
      |> Enum.filter(&(&1 |> Module.split() |> Enum.take(2) == ~w|MoonWeb Examples|))
      |> Enum.filter(&(&1 != MoonWeb.Examples.Design.TableExample.Stream))
      |> Enum.each(fn example ->
        path =
          MoonWeb.Router.Helpers.live_path(
            MoonWeb.Endpoint,
            MoonWeb.Pages.ExamplePage,
            "#{example}" |> String.replace("Elixir.MoonWeb.Examples.", "")
          )

        try do
          conn = get(conn, path)
          assert response(conn, 200)
        rescue
          e ->
            flunk(
              "Error on example #{example}\n\n#{Map.get(e, :message, "Message not available")}"
            )
        end
      end)
    end
  end
end
