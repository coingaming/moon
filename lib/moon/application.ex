defmodule Moon.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start Mock DB
      %{id: :mock_db, start: {MoonWeb.MockDB, :start_link, []}},
      # Start the Telemetry supervisor
      MoonWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Moon.PubSub},
      # Start the Endpoint (http/https)
      MoonWeb.Endpoint
      # Start a worker by calling: Moon.Worker.start_link(arg)
      # {Moon.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Moon.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    MoonWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
