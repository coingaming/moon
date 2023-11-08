defmodule Moon.MixProject do
  use Mix.Project

  @version (case File.read("VERSION") do
              {:ok, version} -> String.trim(version)
              {:error, _} -> "ERRROR"
            end)

  def project do
    [
      app: :moon,
      version: @version,
      elixir: "~> 1.11",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: Mix.compilers() ++ [:surface],
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      package: package(),
      # docs
      name: "Moon",
      source_url: "https://github.com/coingaming/moon",
      homepage_url: "https://github.com/coingaming/moon/tree/v#{@version}",
      docs: [
        source_ref: "v#{@version}"
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

  defp package do
    [
      licenses: ["UNLICENSED"],
      files: [
        "lib",
        "config/surface.exs",
        "assets",
        "priv/static/{themes,fonts,moon.js}",
        "priv/templates",
        "mix.exs",
        "README.md",
        "CHANGELOG.md",
        "VERSION"
      ],
      links: %{
        "GitHub" => "https://github.com/coingaming/moon/tree/v#{@version}"
      }
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
      {:phoenix, ">= 1.6.15"},
      {:phoenix_live_view, ">= 0.18.3"},
      {:phoenix_html, "~> 3.0"},
      {:phoenix_live_dashboard, ">= 0.7.0"},
      {:phoenix_ecto, "~> 4.0"},
      {:ecto_sql, "~> 3.1"},
      {:faker, "~> 0.17"},
      {:gettext, "~> 0.21"},
      {:jason, "~> 1.0"},
      {:plug_cowboy, "~> 2.0"},
      {:vega_lite, "~> 0.1.0"},
      {:surface, "> 0.9.1"},
      {:timex, "~> 3.6"},
      {:distillery, "~> 2.1"},
      {:moon_icons, "~> 0.1"},
      {:esbuild, "~> 0.7", runtime: Mix.env() == :dev},

      # test
      {:excoveralls, "~> 0.10", only: :test},
      {:floki, ">= 0.27.0", only: :test},
      {:snapshy, "~> 0.3.0", only: :test},

      # dev
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:surface_formatter, "~> 0.7.0", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.0", only: [:dev, :test], runtime: false},
      {:ex_doc, ">= 0.0.0", only: [:dev, :test], runtime: false}
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
      setup: ["deps.get", "assets.setup", "compile", "assets.build"],
      "assets.setup": ["cmd --cd assets npm i", "esbuild.install --if-missing"],
      "assets.build": ["cmd --cd assets npm run build", "esbuild default"],
      "assets.clean": ["cmd rm -rf assets/node_modules", "phx.digest.clean --all"],
      "assets.deploy": [
        "cmd --cd assets npm run deploy",
        "esbuild default --minify",
        "phx.digest"
      ],
      "check-quality": [
        "compile --all-warnings --warnings-as-errors",
        "format --check-formatted",
        "credo"
      ],
      fromat: ["format"],
      "semantic.release": [
        "cmd npm i",
        "cmd npx semantic-release --extends ./scripts/deploy/semantic-release.js"
      ]
    ]
  end
end
