defmodule Moon.MixProject do
  use Mix.Project

  @version "0.0.3"

  def project do
    [
      app: :moon,
      version: @version,
      elixir: "~> 1.10.2",
      description: "A component based library for Phoenix LiveView on top of Surface",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      package: package()
    ]
  end

  def application do
    [
      mod: {Moon.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:phoenix, "~> 1.5.5"},
      {:phoenix_pubsub, "~> 2.0"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:plug_cowboy, "~> 2.0"},
      {:jason, "~> 1.0"},
      {:surface, git: "git@github.com:msaraiva/surface.git"},
      {:decimal, "~> 2.0"}
    ]
  end

  defp docs do
    [
      main: "Moon",
      source_ref: "v#{@version}",
      source_url: "https://github.com/coingaming/moon"
    ]
  end

  defp package do
    %{
      licenses: ["Coingaming owned"],
      links: %{"GitHub" => "https://github.com/coingaming/moon"}
    }
  end
end
