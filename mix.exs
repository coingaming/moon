defmodule Moon.MixProject do
  use Mix.Project

  @version "0.0.1"

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

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:surface, github: "msaraiva/surface"},
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
