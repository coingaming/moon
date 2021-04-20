defmodule MoonWeb.Pages.Components.DatepickerPage do
  use MoonWeb, :live_view
  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Components.CodePreview
  alias Moon.Components.Datepicker
  alias Moon.Components.Heading
  alias Moon.Components.Stack
  alias Moon.Components.Link

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
      <Heading size=32>Datepicker</Heading>

      <p>
        <Link to="https://github.com/coingaming/moon/blob/master/lib/moon_web/pages/components/datepicker.ex">Sourcecode of this page</Link>
        <Link to="https://moon.io/components/datepicker">React implementation</Link>
      </p>
    </Stack>
    """
  end
end
