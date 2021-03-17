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
        large_switch_checked: false,
        icons_switch_checked: false,
        captions_switch_checked: false
      )

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <Stack>
      <Heading size=32>Switch</Heading>

      <p>
        An alternate checkbox appearance for simulating on/off state.
      </p>

      <div id="first_switch">
        <ExampleAndCode class="mt-3" show_state={{ true }}>
          <template slot="example">
            <Switch checked={{ @first_switch_checked }} on_change="handle_first_switch" />
          </template>

          <template slot="code">
            <#CodePreview>
              <Switch
                checked={{ @checked }}
                on_change="handle_switch"
              />
            </#CodePreview>
          </template>

          <template slot="state">@checked = {{ @first_switch_checked }}</template>
        </ExampleAndCode>
      </div>

      <Heading size=24 class="mt-4" is_regular>Size</Heading>

      <p>
        Use <code class="bg-goku-40">size</code> prop. Default size is medium.
      </p>

      <ExampleAndCode class="mt-3">
        <template slot="example">
          <Stack>
            <Switch
              size="small"
              checked={{ @small_switch_checked }}
              on_change="handle_small_switch"
            />

            <Switch
              size="medium"
              checked={{ @medium_switch_checked }}
              on_change="handle_medium_switch"
            />

            <Switch
              size="large"
              checked={{ @large_switch_checked }}
              on_change="handle_large_switch"
            />
          </Stack>
        </template>

        <template slot="code">
          <#CodePreview>
            <Switch size="small" />

            <Switch size="medium" />

            <Switch size="large" />
          </#CodePreview>
        </template>
      </ExampleAndCode>

      <Heading size=24 class="mt-4" is_regular>Icons</Heading>

      <p>
        Use <code class="bg-goku-40">icons</code> prop. Default value is <code class="bg-goku-40">false</code>.
      </p>

      <ExampleAndCode class="mt-3">
        <template slot="example">
          <Stack>
            <Switch
              checked={{ @icons_switch_checked }}
              icons={{ true }}
              size="small"
              on_change="handle_icons_switch"
            />

            <Switch
              checked={{ @icons_switch_checked }}
              icons={{ true }}
              size="medium"
              on_change="handle_icons_switch"
            />

            <Switch
              checked={{ @icons_switch_checked }}
              icons={{ true }}
              size="large"
              on_change="handle_icons_switch"
            />
          </Stack>
        </template>

        <template slot="code">
          <#CodePreview>
            <Switch icons={{ true }} />
          </#CodePreview>
        </template>
      </ExampleAndCode>

      <Heading size=24 class="mt-4" is_regular>Captions</Heading>

      <p>
        Use <code class="bg-goku-40">caption_unchecked</code> and <code class="bg-goku-40">caption_checked</code> props.
      </p>

      <ExampleAndCode class="mt-3">
        <template slot="example">
          <Stack>
            <Switch
              checked={{ @captions_switch_checked }}
              on_change="handle_captions_switch"
              icons={{ false }}
              size="small"
              caption_unchecked="AM"
              caption_checked="PM"
            />

            <Switch
              checked={{ @captions_switch_checked }}
              on_change="handle_captions_switch"
              icons={{ true }}
              size="medium"
              caption_unchecked="OFF"
              caption_checked="ON"
            />

            <Switch
              checked={{ @captions_switch_checked }}
              on_change="handle_captions_switch"
              icons={{ true }}
              size="large"
              caption_unchecked="Moon"
              caption_checked="Sun"
            />
          </Stack>
        </template>

        <template slot="code">
          <#CodePreview>
            <Switch
              caption_unchecked="OFF"
              caption_checked="ON"
            />
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

  def handle_event("handle_icons_switch", _, socket) do
    socket = assign(socket, icons_switch_checked: !socket.assigns.icons_switch_checked)
    {:noreply, socket}
  end

  def handle_event("handle_captions_switch", _, socket) do
    socket = assign(socket, captions_switch_checked: !socket.assigns.captions_switch_checked)
    {:noreply, socket}
  end
end
