use Mix.Config

config :moon, MoonWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "CYnO+hTTV0B+sKIZnq2S+trh9LnqypwT+Sof0VZCKKCEyX0ANreuJxnYEo0vaDU1",
  render_errors: [view: MoonWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Moon.PubSub,
  live_view: [signing_salt: "vYSsn3y0"]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{Mix.env()}.exs"
