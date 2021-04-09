defmodule MoonWeb.Pages.Components.ToastPage do
  use MoonWeb, :live_view
  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Components.Button
  alias Moon.Components.CodePreview
  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias Moon.Components.Stack
  alias Moon.Components.Toast

  def mount(params, _session, socket) do
    socket =
      assign(socket,
        theme_name: params["theme_name"] || "sportsbet-dark",
        active_page: __MODULE__,
        message: "Hey! Your toast is ready.",
        variant: "success",
        hidden: true
      )

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <Stack>
      <Heading size=32>Toast</Heading>

      <p>
        Short, time-based messages that slide in and out of a page.
      </p>

      <p>
        <Link to="https://www.figma.com/file/S3q1SkVngbwHuwpxHKCsgtJj/Moon---Components?node-id=15488%3A332">Figma design</Link>
        <Link to="https://github.com/coingaming/moon/blob/master/lib/moon_web/pages/components/toast.ex">Sourcecode of this page</Link>
        <Link to="https://moon.io/toolkit/toast">React implementation</Link>
      </p>

      <ExampleAndCode show_state={{ true }}>
        <template slot="example">
          <Button variant="secondary" on_click="toggle_toast">Show toast</Button>

          <Toast
            message={{ @message }}
            variant={{ @variant }}
            hidden={{ @hidden }}
            on_show="toggle_toast"
          />
        </template>

        <template slot="code">
      <#CodePreview>
        <Toast
          message={{ @message }}
          variant={{ @variant }}
          hidden={{ @hidden }}
          on_show="toggle_toast"
        />
      </#CodePreview>
        </template>

        <template slot="state">@hidden = {{ @hidden }}</template>
      </ExampleAndCode>
    </Stack>
    """
  end

  def handle_event("toggle_toast", _, socket) do
    {:noreply, assign(socket, hidden: !socket.assigns.hidden)}
  end
end
