use Mix.Config

config :moon, MoonWeb.Endpoint,
  url: [host: "example.com", port: 5000],
  cache_static_manifest: "priv/static/cache_manifest.json"

config :logger, level: :info
