defmodule Moon.MixProject do
  use Mix.Project

  @version "0.1.53"

  def project do
    [
      app: :moon,
      version: @version,
      elixir: "~> 1.11",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Moon.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.5"},
      {:phoenix_live_view, "~> 0.15.5"},
      {:phoenix_html, "~> 2.11"},
      {:phoenix_live_dashboard, "~> 0.3 or ~> 0.2.9"},
      {:phoenix_ecto, "~> 4.0"},
      {:ecto_sql, "~> 3.1"},
      {:faker, "~> 0.16"},
      {:telemetry_metrics, "~> 0.4"},
      {:telemetry_poller, "~> 0.4"},
      {:gettext, "~> 0.11"},
      {:jason, "~> 1.0"},
      {:plug_cowboy, "~> 2.0"},
      {:vega_lite, "~> 0.1.0"},
      {:asset_import, "~> 0.4"},
      {:surface, "~> 0.5.0"},
      {:timex, "~> 3.6"},
      {:distillery, "~> 2.1"},

      # test
      {:excoveralls, "~> 0.10", only: :test},
      {:floki, ">= 0.27.0", only: :test},
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false},

      # dev
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:surface_formatter, "~> 0.5.1", only: :dev},
      {:dialyxir, "~> 1.0", only: :dev, runtime: false}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get", "cmd npm install --prefix assets"]
    ]
  end
end
