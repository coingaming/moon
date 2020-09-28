defmodule MoonWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :moon

  @session_options [
    store: :cookie,
    key: "_moon_app",
    signing_salt: "hhuJ3xsfA"
  ]

  plug(Plug.Static,
    at: "/uploads/",
    from: "uploads"
  )

  plug(Plug.Static,
    at: "/",
    from: :moon,
    gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)
  )

  if code_reloading? do
    socket("/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket)
    plug(Phoenix.LiveReloader)
    plug(Phoenix.CodeReloader)
  end

  plug(Plug.RequestId)
  plug(Plug.Telemetry, event_prefix: [:phoenix, :endpoint])

  plug(Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()
  )

  plug(Plug.MethodOverride)
  plug(Plug.Head)
  plug(Plug.Session, @session_options)
  plug(MoonWeb.Router)

  socket("/live", Phoenix.LiveView.Socket, websocket: [connect_info: [session: @session_options]])
end
