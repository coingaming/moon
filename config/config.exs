# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

# Configures the endpoint
config :moon, MoonWeb.Endpoint,
  url: [host: "localhost"],
  static_url: [path: "/moon/assets"],
  secret_key_base: "QYBXKQhXTKhs/D4KK44Zm4d9brKEl88TxKWcI8BpdkYEXRMbne6uxElq9j+sP+Rh",
  render_errors: [view: MoonWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Moon.PubSub,
  live_view: [signing_salt: "QAEMvs6P"]

config :moon, :s3,
  bucket: System.get_env("AWS_BUCKET"),
  region: System.get_env("AWS_DEFAULT_REGION"),
  access_key_id: System.get_env("AWS_ACCESS_KEY_ID"),
  secret_access_key: System.get_env("AWS_SECRET_ACCESS_KEY")

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# this file cn be used by our package users, so ...
import_config "surface.exs"

config :surface, :components, [
  # put here configs that are not required by our users
]

config :surface, :compiler,
  hooks_output_dir: "assets/js/_hooks",
  css_output_file: "assets/css/_components.css"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
