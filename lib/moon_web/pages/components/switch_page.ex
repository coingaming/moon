defmodule MoonWeb.Pages.Components.SwitchPage do
  use MoonWeb, :live_view
  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Components.CodePreview
  alias Moon.Components.Heading
  alias Moon.Components.Stack
  alias Moon.Components.Switch
  alias Moon.Components.Link

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
    ~F"""
    <Stack>
      <Heading size={32}>Switch</Heading>

      <p>
        An alternate checkbox appearance for simulating on/off state.
      </p>

      <p>
        <Link to="https://www.figma.com/file/S3q1SkVngbwHuwpxHKCsgtJj/Components?node-id=60%3A31">Figma design</Link>
        <Link to="https://github.com/coingaming/moon/blob/master/lib/moon_web/pages/components/switch_page.ex">Sourcecode of this page</Link>
        <Link to="https://moon.io/components/switcher">React implementation</Link>
      </p>

      <div id="first_switch">
        <ExampleAndCode class="mt-3" show_state>
          <:example>
            <Switch checked={@first_switch_checked} on_change="handle_first_switch" />
          </:example>

          <:code>
            <#CodePreview>
              <Switch
                checked={ @checked }
                on_change="handle_switch"
              />
            </#CodePreview>
          </:code>

          <:state>@checked = {@first_switch_checked}</:state>
        </ExampleAndCode>
      </div>

      <Heading size={24} class="mt-4" is_regular>Size</Heading>

      <p>
        Use <code class="bg-goku-40">size</code> prop. Default size is medium.
      </p>

      <ExampleAndCode class="mt-3">
        <:example>
          <Stack>
            <Switch size="small" checked={@small_switch_checked} on_change="handle_small_switch" />

            <Switch size="medium" checked={@medium_switch_checked} on_change="handle_medium_switch" />

            <Switch size="large" checked={@large_switch_checked} on_change="handle_large_switch" />
          </Stack>
        </:example>

        <:code>
          <#CodePreview>
            <Switch size="small" />

            <Switch size="medium" />

            <Switch size="large" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Heading size={24} class="mt-4" is_regular>Icons</Heading>

      <p>
        Use <code class="bg-goku-40">icons</code> prop. Default value is <code class="bg-goku-40">false</code>.
      </p>

      <ExampleAndCode class="mt-3">
        <:example>
          <Stack>
            <Switch checked={@icons_switch_checked} icons size="small" on_change="handle_icons_switch" />

            <Switch checked={@icons_switch_checked} icons size="medium" on_change="handle_icons_switch" />

            <Switch checked={@icons_switch_checked} icons size="large" on_change="handle_icons_switch" />
          </Stack>
        </:example>

        <:code>
          <#CodePreview>
            <Switch icons={ true } />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Heading size={24} class="mt-4" is_regular>Captions</Heading>

      <p>
        Use <code class="bg-goku-40">caption_unchecked</code> and <code class="bg-goku-40">caption_checked</code> props.
      </p>

      <ExampleAndCode class="mt-3">
        <:example>
          <Stack>
            <Switch
              checked={@captions_switch_checked}
              on_change="handle_captions_switch"
              icons={false}
              size="small"
              caption_unchecked="AM"
              caption_checked="PM"
            />

            <Switch
              checked={@captions_switch_checked}
              on_change="handle_captions_switch"
              icons
              size="medium"
              caption_unchecked="OFF"
              caption_checked="ON"
            />

            <Switch
              checked={@captions_switch_checked}
              on_change="handle_captions_switch"
              icons
              size="large"
              caption_unchecked="Moon"
              caption_checked="Sun"
            />
          </Stack>
        </:example>

        <:code>
          <#CodePreview>
            <Switch
              caption_unchecked="OFF"
              caption_checked="ON"
            />
          </#CodePreview>
        </:code>
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
