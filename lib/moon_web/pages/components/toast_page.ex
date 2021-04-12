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
        message: "Hey! Your toast is ready."
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
          <Button
            variant="secondary"
            on_click="show_toast"
            value_name="id"
            value="default_toast"
          >Show toast</Button>

          <Toast
            id="default_toast"
            message={{ @message }}
            variant="success"
            closeable={{ true }}
          />
        </template>

        <template slot="code">
      <#CodePreview>
        <Toast
          message="Hey! Your toast is ready."
          variant="success"
          closeable={{ true }}
        />
      </#CodePreview>
        </template>

        <template slot="state"></template>
      </ExampleAndCode>

      <Heading size=24 class="mt-4" is_regular>Variant</Heading>

      <p>
        Use <code class="bg-goku-40">variant</code> prop.
      </p>

      <ExampleAndCode>
        <template slot="example">
          <Stack>
            <Button
              variant="secondary"
              on_click="show_toast"
              value_name="id"
              value="error_toast"
            >Error toast</Button>

            <Button
              variant="secondary"
              on_click="show_toast"
              value_name="id"
              value="warning_toast"
            >Warning toast</Button>

            <Button
              variant="secondary"
              on_click="show_toast"
              value_name="id"
              value="info_toast"
            >Info toast</Button>

            <Button
              variant="secondary"
              on_click="show_toast"
              value_name="id"
              value="success_toast"
            >Success toast</Button>

            <Button
              variant="secondary"
              on_click="show_toast"
              value_name="id"
              value="no_icon_toast"
            >Default toast</Button>
          </Stack>

          <Toast
            id="error_toast"
            message="Error!"
            variant="error"
          />
          <Toast
            id="warning_toast"
            message="Warning."
            variant="warning"
          />
          <Toast
            id="info_toast"
            message="Info."
            variant="info"
          />
          <Toast
            id="success_toast"
            message="Success!"
            variant="success"
          />
          <Toast
            id="no_icon_toast"
            message="Default."
          />
        </template>

        <template slot="code">
      <#CodePreview>
        <Toast
          id="error_toast"
          message="Error!"
          variant="error"
        />
        <Toast
          id="warning_toast"
          message="Warning."
          variant="warning"
        />
        <Toast
          id="info_toast"
          message="Info."
          variant="info"
        />
        <Toast
          id="success_toast"
          message="Success!"
          variant="success"
        />
        <Toast
          id="default_toast"
          message="Default."
        />
      </#CodePreview>
        </template>
      </ExampleAndCode>

      <Heading size=24 class="mt-4" is_regular>Actions</Heading>

      <p>
        Use <code class="bg-goku-40">closeable</code> prop. Default value is true.
      </p>

      <ExampleAndCode>
        <template slot="example">
          <Stack>
            <Button
              variant="secondary"
              on_click="show_toast"
              value_name="id"
              value="closeable_toast"
            >Closeable toast</Button>

            <Button
              variant="secondary"
              on_click="show_toast"
              value_name="id"
              value="not_closeable_toast"
            >Not closeable toast</Button>
          </Stack>

          <Toast
            id="closeable_toast"
            message="You can close this toast."
            variant="success"
            closeable={{ true }}
          />
          <Toast
            id="not_closeable_toast"
            message="You cannot close this toast."
            variant="warning"
            closeable={{ false }}
          />
        </template>

        <template slot="code">
      <#CodePreview>
        <Toast
          id="closeable_toast"
          message="You can close this toast."
          variant="success"
          closeable={{ true }}
        />

        <Toast
          id="not_closeable_toast"
          message="You cannot close this toast."
          variant="warning"
          closeable={{ false }}
        />
      </#CodePreview>
        </template>
      </ExampleAndCode>
    </Stack>
    """
  end

  def handle_event("show_toast", %{"id" => id}, socket) do
    Toast.show(id, true)
    {:noreply, socket}
  end
end
