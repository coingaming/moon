import Config

secret_key_base =
  System.get_env("SECRET_KEY_BASE") ||
    "zMBKDyfVAWJLhzEomz2JktQhqVEH9GAnnmytbouvPqFKwbQBgN80QJb8/NbmGHgw"

http_port = String.to_integer(System.get_env("SERVICE_PORT") || "80")

IO.puts("HTTP PORT #{http_port}")

config :moon, MoonWeb.Endpoint,
  http: [port: http_port],
  url: [host: "moon-surface.coingaming.io", port: http_port],
  check_origin: [
    "//moon-surface.coingaming.io",
    "//localhost:5000",
    "//localhost"
  ],
  server: true,
  live_view: [
    signing_salt: "AAgP5N6wP3Z9WiJUOGlRMvoWiz9lxwsUPswhzkOxbHi4xTuqm1lgXIE6Zll3DhOX"
  ],
  secret_key_base: secret_key_base,
  cache_static_manifest: "priv/static/cache_manifest.json"

config :logger, level: :info

import_config "prod.secret.exs"
