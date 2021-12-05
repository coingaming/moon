defmodule Moon.MixProject do
  use Mix.Project

  @version "0.1.55"

  def project do
    [
      app: :moon,
      version: @version,
      elixir: "~> 1.11",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:gettext] ++ Mix.compilers(),
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
    deps_override([
      {:phoenix, "~> 1.6"},
      {:phoenix_live_view, "~> 0.16"},
      {:phoenix_html, "~> 3.0"},
      {:phoenix_live_dashboard, "~> 0.5.2"},
      {:phoenix_ecto, "~> 4.0"},
      {:ecto_sql, "~> 3.1"},
      {:faker, "~> 0.16.0"},
      {:gettext, "~> 0.18"},
      {:jason, "~> 1.0"},
      {:plug_cowboy, "~> 2.0"},
      {:vega_lite, "~> 0.1.0"},
      {:surface, "~> 0.6"},
      {:timex, "~> 3.6"},
      {:distillery, "~> 2.1"},

      # test
      {:excoveralls, "~> 0.10", only: :test},
      {:floki, ">= 0.27.0", only: :test},
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false},

      # dev
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:surface_formatter, "~> 0.6", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.0", only: [:dev, :test], runtime: false}
    ])
  end

  defp deps_override(deps, path \\ ".mix_override.exs") do
    case Path.expand(path) do
      "/.mix_override.exs" ->
        deps

      _ ->
        if File.exists?(path) do
          Code.require_file(path)
          MixOverride.deps(deps)
        else
          deps_override(deps, Path.join("..", path))
        end
    end
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get", "cmd npm install --prefix assets"],
      "assets.setup": ["cmd --cd assets npm i"],
      "assets.clean": ["cmd --cd assets rm -rf node_modules"],
      "assets.deploy": ["cmd --cd assets npm run deploy", "phx.digest"],
      "ensure-quality": [
        "format",
        "surface.format"
      ],
      "check-quality": [
        "format --check-formatted",
        "compile --all-warnings --warnings-as-errors",
        "credo",
        "surface.format --check-formatted"
      ]
    ]
  end
end
