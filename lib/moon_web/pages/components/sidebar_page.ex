defmodule MoonWeb.Pages.Components.SidebarPage do
  use MoonWeb, :live_view
  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Components.CodePreview
  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias Moon.Components.Sidebar
  alias Moon.Components.Stack

  def mount(params, _session, socket) do
    socket =
      assign(socket,
        theme_name: params["theme_name"] || "sportsbet-dark",
        active_page: __MODULE__
      )

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <Stack>
      <Heading size=32>Sidebar</Heading>

      <p>
        <Link to="https://github.com/coingaming/moon/blob/master/lib/moon_web/pages/components/sidebar_page.ex">Sourcecode of this page</Link>
        <Link to="https://moon.io/toolkit/sidebar">React implementation</Link>
      </p>

      <ExampleAndCode show_state={{ true }} layout="column">
        <template slot="example">
          <Sidebar />
        </template>

        <template slot="code">
      <#CodePreview>
        alias Moon.Components.Sidebar

        <Sidebar />
      </#CodePreview>
        </template>

        <template slot="state"></template>
      </ExampleAndCode>
    </Stack>
    """
  end
end
