use Mix.Config

config :moon, MoonWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "UIegzxon3DL/eIG2KV0IyxHTbSEtw3y2FmtFEEa1/rF62pYoUkbaixV8s9XxdoJwx",
  render_errors: [view: MoonWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Moon.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [
    signing_salt: "Pc9Ia8dj77Ti3S3SYOv5FmwtdH81NWDJX"
  ]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{Mix.env()}.exs"
