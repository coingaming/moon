# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :moon, MoonWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "QYBXKQhXTKhs/D4KK44Zm4d9brKEl88TxKWcI8BpdkYEXRMbne6uxElq9j+sP+Rh",
  render_errors: [view: MoonWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Moon.PubSub,
  live_view: [signing_salt: "QAEMvs6P"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :asset_import, MoonWeb.Assets,
  assets_base_url: "/moon/assets/",
  assets_path: Path.expand("assets"),
  manifest_path: Path.expand("priv/static/manifest.json"),
  entrypoints_path: Path.expand("assets/entrypoints.json")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
