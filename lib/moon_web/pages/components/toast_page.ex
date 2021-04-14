defmodule MoonWeb.Pages.Components.ToastPage do
  use MoonWeb, :live_view
  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Components.Button
  alias Moon.Components.CodePreview
  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias Moon.Components.Stack
  alias Moon.Components.Toast
  alias Moon.Components.Toast.Message
  alias Moon.Components.ToastStack

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
      <Heading size=32>Toast</Heading>

      <p>
        Short, time-based messages that slide in and out of a page.
      </p>

      <p>
        <Link to="https://www.figma.com/file/S3q1SkVngbwHuwpxHKCsgtJj/Moon---Components?node-id=15488%3A332">Figma design</Link>
        <Link to="https://github.com/coingaming/moon/blob/master/lib/moon_web/pages/components/toast.ex">Sourcecode of this page</Link>
        <Link to="https://moon.io/toolkit/toast">React implementation</Link>
      </p>

      <ToastStack id="toasts" />

      <ExampleAndCode>
        <template slot="example">
          <Toast
            id="default"
            message="Hey! Your toast is ready."
            variant="success"
          />

          <Button
            variant="secondary"
            on_click="show_default_toast"
            class="block mt-2"
            size="xsmall"
          >Show</Button>
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
          <div class="flex flex-col items-start">
            <Toast
              :for={{ toast <- variant_toasts() }}
              id={{ toast.id }}
              message={{ toast.message }}
              variant={{ toast.variant }}
            />
          </div>

          <Button
            variant="secondary"
            on_click="show_variant_toasts"
            class="block mt-2"
            size="xsmall"
          >Show all</Button>
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
          <div class="flex flex-col items-start">
            <Toast
              :for={{ toast <- closeable_toasts() }}
              id={{ toast.id }}
              message={{ toast.message }}
              variant={{ toast.variant }}
              closeable={{ toast.closeable }}
            />
          </div>

          <Button
            variant="secondary"
            on_click="show_closeable_toasts"
            class="block mt-2"
            size="xsmall"
          >Show all</Button>
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

  def handle_event("show_default_toast", _, socket) do
    ToastStack.show(
      %Message{
        message: "Hey! Your toast is ready.",
        variant: "success"
      },
      "toasts"
    )

    {:noreply, socket}
  end

  def handle_event("show_variant_toasts", _, socket) do
    ToastStack.show(variant_toasts(), "toasts")

    {:noreply, socket}
  end

  def handle_event("show_closeable_toasts", _, socket) do
    ToastStack.show(closeable_toasts(), "toasts")

    {:noreply, socket}
  end

  def handle_info({:hide_toast, toast_id}, socket) do
    ToastStack.hide_toast(toast_id, "toasts")

    {:noreply, socket}
  end

  defp variant_toasts do
    [
      %Message{id: "error_toast", message: "Error!", variant: "error"},
      %Message{id: "warning_toast", message: "Warning.", variant: "warning"},
      %Message{id: "info_toast", message: "Info.", variant: "info"},
      %Message{id: "success_toast", message: "Success!", variant: "success"},
      %Message{id: "no_icon_toast", message: "Default."}
    ]
  end

  defp closeable_toasts do
    [
      %Message{
        id: "closeable_toast",
        message: "You can close this toast.",
        variant: "success",
        closeable: true
      },
      %Message{
        id: "not_closeable_toast",
        message: "You cannot close this toast.",
        variant: "warning",
        closeable: false
      }
    ]
  end
end
