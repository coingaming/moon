use Mix.Config

config :moon, MoonWeb.Endpoint,
  http: [port: 1234],
  server: false

config :logger, level: :warn
