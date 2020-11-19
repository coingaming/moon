defmodule MoonWeb.Controllers.HealthcheckController do
  use MoonWeb, :controller

  def index(conn, _params) do
    json(conn, %{all_good: "true"})
  end
end
