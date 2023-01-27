defmodule MoonWeb.Pages.Design.SnackbarPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Phoenix.LiveView.JS

  alias Moon.Design.Snackbar
  alias Moon.Components.Button

  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.ExampleAndCode

  alias Moon.Icons.GenericInfo

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components v2"
      },
      %{
        to: "/components/v2/snackbar",
        name: "Snackbar"
      }
    ]
  )

  data(snackbar_1_is_open, :boolean, default: false)
  data(snackbar_2_is_open, :boolean, default: false)
  data(snackbar_3_is_open, :boolean, default: false)
  data(snackbar_4_is_open, :boolean, default: false)
  data(snackbar_5_is_open, :boolean, default: false)
  data(snackbar_6_is_open, :boolean, default: false)
  data(snackbar_7_is_open, :boolean, default: false)
  data(snackbar_8_is_open, :boolean, default: false)
  data(snackbar_9_is_open, :boolean, default: false)
  data(snackbar_10_is_open, :boolean, default: false)
  data(snackbar_11_is_open, :boolean, default: false)
  data(snackbar_12_is_open, :boolean, default: false)
  data(snackbar_13_is_open, :boolean, default: false)
  data(snackbar_14_is_open, :boolean, default: false)
  data(snackbar_15_is_open, :boolean, default: false)
  data(snackbar_16_is_open, :boolean, default: false)
  data(snackbar_17_is_open, :boolean, default: false)
  data(snackbar_18_is_open, :boolean, default: false)
  data(snackbar_19_is_open, :boolean, default: false)
  data(snackbar_20_is_open, :boolean, default: false)
  data(snackbar_21_is_open, :boolean, default: false)
  data(snackbar_22_is_open, :boolean, default: false)
  data(snackbar_23_is_open, :boolean, default: false)
  data(snackbar_24_is_open, :boolean, default: false)
  data(snackbar_25_is_open, :boolean, default: false)
  data(snackbar_26_is_open, :boolean, default: false)
  data(snackbar_27_is_open, :boolean, default: false)


  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription is_in_progress is_aria_support is_rtl_support title="Snackbar">
        <p>
          A type of alert which appears in a layer above other content, visually similar to a mobile or desktop push notification.
        </p>
      </ComponentPageDescription>

      <ExampleAndCode title="Default" id="snackbar_default">
        <:example>
          <Button variant="secondary" on_click="open_snackbar_1">Default</Button>
          <Snackbar is_open={@snackbar_1_is_open} on_close="close_snackbar_1">
            <Snackbar.Content>
              <Snackbar.Message>Snackbar message</Snackbar.Message>
            </Snackbar.Content>
          </Snackbar>
        </:example>
      </ExampleAndCode>

      <ExampleAndCode title="Positions" id="snackbar_positions">
        <:example>
          <Button variant="secondary" on_click="open_snackbar_2">Top left</Button>
          <Snackbar is_open={@snackbar_2_is_open} position="top-left">
            <Snackbar.Content>
              <Snackbar.Message>Snackbar at top-left screen corner</Snackbar.Message>
            </Snackbar.Content>
          </Snackbar>

          <Button variant="secondary" on_click="open_snackbar_3">Top center</Button>
          <Snackbar is_open={@snackbar_3_is_open} position="top-center">
            <Snackbar.Content>
              <Snackbar.Message>Snackbar at top-center screen edge</Snackbar.Message>
            </Snackbar.Content>
          </Snackbar>

          <Button variant="secondary" on_click="open_snackbar_4">Top right</Button>
          <Snackbar is_open={@snackbar_4_is_open} position="top-right">
            <Snackbar.Content>
              <Snackbar.Message>Snackbar at top-right screen corner</Snackbar.Message>
            </Snackbar.Content>
          </Snackbar>

          <Button variant="secondary" on_click="open_snackbar_5">Bottom left</Button>
          <Snackbar is_open={@snackbar_5_is_open} position="bottom-left">
            <Snackbar.Content>
              <Snackbar.Message>Snackbar at bottom-left screen corner</Snackbar.Message>
            </Snackbar.Content>
          </Snackbar>

          <Button variant="secondary" on_click="open_snackbar_6">Bottom center</Button>
          <Snackbar is_open={@snackbar_6_is_open} position="bottom-center">
            <Snackbar.Content>
              <Snackbar.Message>Snackbar at bottom-center screen edge</Snackbar.Message>
            </Snackbar.Content>
          </Snackbar>

          <Button variant="secondary" on_click="open_snackbar_7">Bottom right</Button>
          <Snackbar is_open={@snackbar_7_is_open} position="bottom-right">
            <Snackbar.Content>
              <Snackbar.Message>Snackbar at bottom-right screen corner</Snackbar.Message>
            </Snackbar.Content>
          </Snackbar>
        </:example>
      </ExampleAndCode>

      <ExampleAndCode title="Options" id="snackbar_options">
      <:example>
        <Button variant="secondary" on_click="open_snackbar_8">Multi Line</Button>
        <Snackbar is_open={@snackbar_8_is_open}>
          <Snackbar.Content>
            <Snackbar.Message>Snackbar message</Snackbar.Message>
            <Snackbar.Message>Snackbar the second line message</Snackbar.Message>
          </Snackbar.Content>
        </Snackbar>

        <Button variant="secondary" on_click="open_snackbar_9">With header</Button>
        <Snackbar is_open={@snackbar_9_is_open}>
          <Snackbar.Content>
            <Snackbar.Header>Info</Snackbar.Header>
            <Snackbar.Message>Snackbar message</Snackbar.Message>
          </Snackbar.Content>
        </Snackbar>

        <Button variant="secondary" on_click="open_snackbar_10">With close</Button>
        <Snackbar is_open={@snackbar_10_is_open} on_close="close_snackbar_10">
          <Snackbar.Content>
            <Snackbar.Message>Snackbar message</Snackbar.Message>
          </Snackbar.Content>
          <Snackbar.Close />
        </Snackbar>

        <Button variant="secondary" on_click="open_snackbar_11">With Icon</Button>
        <Snackbar is_open={@snackbar_11_is_open}>
          <Snackbar.Icon>
            <GenericInfo />
          </Snackbar.Icon>
          <Snackbar.Content>
            <Snackbar.Message>Snackbar message</Snackbar.Message>
          </Snackbar.Content>
        </Snackbar>

        <Button variant="secondary" on_click="open_snackbar_12">Multi Line with Icon</Button>
        <Snackbar is_open={@snackbar_12_is_open}>
          <Snackbar.Icon>
            <GenericInfo />
          </Snackbar.Icon>
          <Snackbar.Content>
            <Snackbar.Message>Snackbar message</Snackbar.Message>
            <Snackbar.Message>Snackbar the second line message</Snackbar.Message>
          </Snackbar.Content>
        </Snackbar>

        <Button variant="secondary" on_click="open_snackbar_13">With Close and Icon</Button>
        <Snackbar is_open={@snackbar_13_is_open} on_close="close_snackbar_13">
          <Snackbar.Icon>
            <GenericInfo />
          </Snackbar.Icon>
          <Snackbar.Content>
            <Snackbar.Message>Snackbar message</Snackbar.Message>
          </Snackbar.Content>
          <Snackbar.Close />
        </Snackbar>
      </:example>
    </ExampleAndCode>

      <ExampleAndCode title="Semantic types" id="snackbar_semantic">
        <:example>
          <Button variant="secondary" on_click="open_snackbar_14">Success</Button>
          <Snackbar is_open={@snackbar_14_is_open} on_close="close_snackbar_14">
            <Snackbar.Icon class="bg-roshi-10 text-roshi">
              <GenericInfo />
            </Snackbar.Icon>
            <Snackbar.Content>
              <Snackbar.Header>Success</Snackbar.Header>
              <Snackbar.Message>Snackbar message</Snackbar.Message>
            </Snackbar.Content>
            <Snackbar.Close />
          </Snackbar>

          <Button variant="secondary" on_click="open_snackbar_15">Warnings</Button>
          <Snackbar is_open={@snackbar_15_is_open} on_close="close_snackbar_15">
            <Snackbar.Icon class="bg-krillin-10 text-krillin">
              <GenericInfo />
            </Snackbar.Icon>
            <Snackbar.Content>
              <Snackbar.Header>Warning</Snackbar.Header>
              <Snackbar.Message>Snackbar message</Snackbar.Message>
            </Snackbar.Content>
            <Snackbar.Close />
          </Snackbar>

          <Button variant="secondary" on_click="open_snackbar_16">Error</Button>
          <Snackbar is_open={@snackbar_16_is_open} on_close="close_snackbar_16">
            <Snackbar.Icon class="bg-chichi-10 text-chichi">
              <GenericInfo />
            </Snackbar.Icon>
            <Snackbar.Content>
              <Snackbar.Header>Error</Snackbar.Header>
              <Snackbar.Message>Snackbar message</Snackbar.Message>
            </Snackbar.Content>
            <Snackbar.Close />
          </Snackbar>
        </:example>
      </ExampleAndCode>

      <ExampleAndCode title="Auto close" id="snackbar_auto_close">
      <:example>
        <Button variant="secondary" on_click="open_snackbar_17">Close after 1 sec</Button>
        <Snackbar is_open={@snackbar_17_is_open}>
          <Snackbar.Content>
            <Snackbar.Message>Snackbar message</Snackbar.Message>
          </Snackbar.Content>
        </Snackbar>

        <Button variant="secondary" on_click="open_snackbar_18">Close after 3 sec</Button>
        <Snackbar is_open={@snackbar_18_is_open}>
          <Snackbar.Content>
            <Snackbar.Message>Snackbar message</Snackbar.Message>
          </Snackbar.Content>
        </Snackbar>
      </:example>
    </ExampleAndCode>

    <ExampleAndCode title="Customization" id="snackbar_customization">
    <:example>
      <Button variant="secondary" on_click="open_snackbar_19">Border radius</Button>
      <Snackbar class="rounded-none" is_open={@snackbar_19_is_open}>
        <Snackbar.Content>
          <Snackbar.Message>Custom border radius</Snackbar.Message>
        </Snackbar.Content>
      </Snackbar>

      <Button variant="secondary" on_click="open_snackbar_20">Background</Button>
      <Snackbar class="bg-roshi" is_open={@snackbar_20_is_open}>
      <Snackbar.Content>
      <Snackbar.Message>Custom background color</Snackbar.Message>
      </Snackbar.Content>
      </Snackbar>

      <Button variant="secondary" on_click="open_snackbar_21">Width</Button>
      <Snackbar class="w-72" is_open={@snackbar_21_is_open}>
        <Snackbar.Content>
        <Snackbar.Message>Custom width</Snackbar.Message>
        </Snackbar.Content>
      </Snackbar>

      <Button variant="secondary" on_click="open_snackbar_22">Always light</Button>
      <Snackbar class="theme-moon-light" is_open={@snackbar_22_is_open}>
      <Snackbar.Content>
      <Snackbar.Message>Applying light theme</Snackbar.Message>
      </Snackbar.Content>
      </Snackbar>

      <Button variant="secondary" on_click="open_snackbar_23">Always dark</Button>
      <Snackbar class="theme-moon-dark" is_open={@snackbar_23_is_open}>
      <Snackbar.Content>
      <Snackbar.Message>Applying dark theme</Snackbar.Message>
      </Snackbar.Content>
      </Snackbar>

      <Button variant="secondary" on_click="open_snackbar_24">Fonts</Button>
      <Snackbar is_open={@snackbar_24_is_open}>
        <Snackbar.Content>
          <Snackbar.Message class="text-moon-24 text-chichi">Custom fonts</Snackbar.Message>
          <Snackbar.Message class="text-moon-12 font-medium">Even more custom fonts</Snackbar.Message>
        </Snackbar.Content>
      </Snackbar>
    </:example>
    </ExampleAndCode>

    <ExampleAndCode title="Snackbar Queue" id="snackbar_queue">
    <:example>
      <Button variant="secondary" on_click="open_snackbar_25">Queue Snackbar</Button>
      <Snackbar is_open={@snackbar_25_is_open} on_close={"open_snackbar_26"}>
        <Snackbar.Content>
          <Snackbar.Message>Number 1 Snackbar </Snackbar.Message>
        </Snackbar.Content>
        <Snackbar.Close />
      </Snackbar>
      <Snackbar position="top-center" is_open={@snackbar_26_is_open} on_close="open_snackbar_27">
        <Snackbar.Content>
          <Snackbar.Message>Number 2 Snackbar </Snackbar.Message>
        </Snackbar.Content>
        <Snackbar.Close />
      </Snackbar>
      <Snackbar is_open={@snackbar_27_is_open}>
        <Snackbar.Content>
          <Snackbar.Message>Number 3 Snackbar </Snackbar.Message>
        </Snackbar.Content>
        <Snackbar.Close />
      </Snackbar>
    </:example>
    </ExampleAndCode>
    </Page>
    """
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def handle_event("open_snackbar_1", _params, socket) do
    socket = assign(socket, snackbar_1_is_open: true)
    {:noreply, socket}
  end

  def handle_event("open_snackbar_2", _params, socket) do
    socket = assign(socket, snackbar_2_is_open: true)
    {:noreply, socket}
  end

  def handle_event("open_snackbar_3", _params, socket) do
    socket = assign(socket, snackbar_3_is_open: true)
    {:noreply, socket}
  end

  def handle_event("open_snackbar_4", _params, socket) do
    socket = assign(socket, snackbar_4_is_open: true)
    {:noreply, socket}
  end

  def handle_event("open_snackbar_5", _params, socket) do
    socket = assign(socket, snackbar_5_is_open: true)
    {:noreply, socket}
  end

  def handle_event("open_snackbar_6", _params, socket) do
    socket = assign(socket, snackbar_6_is_open: true)
    {:noreply, socket}
  end

  def handle_event("open_snackbar_7", _params, socket) do
    socket = assign(socket, snackbar_7_is_open: true)
    {:noreply, socket}
  end

  def handle_event("open_snackbar_8", _params, socket) do
    socket = assign(socket, snackbar_8_is_open: true)
    {:noreply, socket}
  end

  def handle_event("open_snackbar_9", _params, socket) do
    socket = assign(socket, snackbar_9_is_open: true)
    {:noreply, socket}
  end

  def handle_event("open_snackbar_10", _params, socket) do
    socket = assign(socket, snackbar_10_is_open: true)
    {:noreply, socket}
  end

  def handle_event("close_snackbar_10", _params, socket) do
    socket = assign(socket, snackbar_10_is_open: false)
    {:noreply, socket}
  end

  def handle_event("open_snackbar_11", _params, socket) do
    socket = assign(socket, snackbar_11_is_open: true)
    {:noreply, socket}
  end

  def handle_event("open_snackbar_12", _params, socket) do
    socket = assign(socket, snackbar_12_is_open: true)
    {:noreply, socket}
  end

  def handle_event("open_snackbar_13", _params, socket) do
    socket = assign(socket, snackbar_13_is_open: true)
    {:noreply, socket}
  end

  def handle_event("close_snackbar_13", _params, socket) do
    socket = assign(socket, snackbar_13_is_open: false)
    {:noreply, socket}
  end

  def handle_event("open_snackbar_14", _params, socket) do
    socket = assign(socket, snackbar_14_is_open: true)
    {:noreply, socket}
  end

  def handle_event("close_snackbar_14", _params, socket) do
    socket = assign(socket, snackbar_14_is_open: false)
    {:noreply, socket}
  end

  def handle_event("open_snackbar_15", _params, socket) do
    socket = assign(socket, snackbar_15_is_open: true)
    {:noreply, socket}
  end

  def handle_event("close_snackbar_15", _params, socket) do
    socket = assign(socket, snackbar_15_is_open: false)
    {:noreply, socket}
  end

  def handle_event("open_snackbar_16", _params, socket) do
    socket = assign(socket, snackbar_16_is_open: true)
    {:noreply, socket}
  end

  def handle_event("close_snackbar_16", _params, socket) do
    socket = assign(socket, snackbar_16_is_open: false)
    {:noreply, socket}
  end

  def handle_event("open_snackbar_17", _params, socket) do
    socket = assign(socket, snackbar_17_is_open: true)
    {:noreply, socket}
  end

  def handle_event("open_snackbar_18", _params, socket) do
    socket = assign(socket, snackbar_18_is_open: true)
    {:noreply, socket}
  end

  def handle_event("open_snackbar_19", _params, socket) do
    socket = assign(socket, snackbar_19_is_open: true)
    {:noreply, socket}
  end

  def handle_event("open_snackbar_20", _params, socket) do
    socket = assign(socket, snackbar_20_is_open: true)
    {:noreply, socket}
  end

  def handle_event("open_snackbar_21", _params, socket) do
    socket = assign(socket, snackbar_21_is_open: true)
    {:noreply, socket}
  end

  def handle_event("open_snackbar_22", _params, socket) do
    socket = assign(socket, snackbar_22_is_open: true)
    {:noreply, socket}
  end

  def handle_event("open_snackbar_23", _params, socket) do
    socket = assign(socket, snackbar_23_is_open: true)
    {:noreply, socket}
  end

  def handle_event("open_snackbar_24", _params, socket) do
    socket = assign(socket, snackbar_24_is_open: true)
    {:noreply, socket}
  end

  def handle_event("open_snackbar_25", _params, socket) do
    socket = assign(socket, snackbar_25_is_open: true)
    {:noreply, socket}
  end

  def handle_event("close_snackbar_25", _params, socket) do
    socket = assign(socket, snackbar_25_is_open: false)
    {:noreply, socket}
  end

  def handle_event("close_snackbar_26", _params, socket) do
    socket = assign(socket, snackbar_26_is_open: false)
    {:noreply, socket}
  end

  def handle_event("open_snackbar_27", _params, socket) do
    socket = assign(socket, snackbar_27_is_open: true)
    {:noreply, socket}
  end

end
