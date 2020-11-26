defmodule MoonWeb.Pages.Tutorials.Installation do
  use MoonWeb, :live_view

  alias Moon.Components.Heading

  def mount(%{"theme_name" => theme_name}, _session, socket) do
    {:ok, assign(socket, theme_name: theme_name, active_page: __MODULE__)}
  end

  def render(assigns) do
    ~H"""
    <Heading size=32>Usage</Heading>
    <pre>
    # 1. Create empty project
    mix phx.new aposta10_design --live --no-ecto --no-dashboard
    cd aposta10_design

    # 2. Configure https://github.com/coingaming/asset_import
    # check diff https://github.com/coingaming/aposta10_design/commit/7889b319463ad68f3192a5dfe8c6d7414697b5cf

    # 3. Include Moon Surface
    # check diff https://github.com/coingaming/aposta10_design/commit/4f84046f273bf9b60d8278cbce76855ece62b572

    # 4. Install Moon Surface dependencies
    (cd deps/moon/ && mix deps.get)

    # 5. Install Moon Surface Assets
    (cd deps/moon/assets/ && npm i)

    # 6. Run project
    mix phx.server

    </pre>
    """
  end
end
