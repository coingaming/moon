defmodule MoonWeb.Pages.Components.SwitchPage do
  use MoonWeb, :live_view
  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Components.CodePreview
  alias Moon.Components.Heading
  alias Moon.Components.Stack
  alias Moon.Components.Switch

  def mount(params, _session, socket) do
    socket =
      assign(socket,
        theme_name: params["theme_name"] || "sportsbet-dark",
        active_page: __MODULE__,
        first_switch_checked: false,
        small_switch_checked: false,
        medium_switch_checked: false,
        large_switch_checked: false
      )

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <Stack>
      <Heading size=32 class="">Switch</Heading>

      <p>
        An alternate checkbox appearance for simulating on/off state.
      </p>

      <ExampleAndCode class="mt-3" show_state={{ true }}>
        <template slot="example">
          <Switch checked={{ @first_switch_checked }} on_change="handle_first_switch"></Switch>
        </template>

        <template slot="code">
          <#CodePreview>
            <Switch
              checked={{ @checked }}
              on_change="handle_switch"
            ></Switch>
          </#CodePreview>
        </template>

        <template slot="state">
          @checked = {{ @first_switch_checked }}
        </template>
      </ExampleAndCode>

      <Heading size=24 class="pt-4" is_regular>Size</Heading>

      <p>
        Use <code class="bg-gohan-40">size</code> prop. Default size is medium.
      </p>

      <ExampleAndCode class="mt-3">
        <template slot="example">
          <Stack>
            <Switch
              size="small"
              checked={{ @small_switch_checked }}
              on_change="handle_small_switch"
            ></Switch>

            <Switch
              size="medium"
              checked={{ @medium_switch_checked }}
              on_change="handle_medium_switch"
            ></Switch>

            <Switch
              size="large"
              checked={{ @large_switch_checked }}
              on_change="handle_large_switch"
            ></Switch>
          </Stack>
        </template>

        <template slot="code">
          <#CodePreview>
            <Switch size="small"></Switch>

            <Switch size="medium"></Switch>

            <Switch size="large"></Switch>
          </#CodePreview>
        </template>
      </ExampleAndCode>
    </Stack>
    """
  end

  def handle_event("handle_first_switch", _, socket) do
    socket = assign(socket, first_switch_checked: !socket.assigns.first_switch_checked)
    {:noreply, socket}
  end

  def handle_event("handle_small_switch", _, socket) do
    socket = assign(socket, small_switch_checked: !socket.assigns.small_switch_checked)
    {:noreply, socket}
  end

  def handle_event("handle_medium_switch", _, socket) do
    socket = assign(socket, medium_switch_checked: !socket.assigns.medium_switch_checked)
    {:noreply, socket}
  end

  def handle_event("handle_large_switch", _, socket) do
    socket = assign(socket, large_switch_checked: !socket.assigns.large_switch_checked)
    {:noreply, socket}
  end
end
