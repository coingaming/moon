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
  secret_key_base: "HvnTSH/M+OeJdeHb+nG4dUO5y9EOWlTDVKjk3Rx+0A6K0oZAeKs5ThKwr9XR6dEx",
  render_errors: [view: MoonWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Moon.PubSub,
  live_view: [signing_salt: "9rDJ6t0A"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
