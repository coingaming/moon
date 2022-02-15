defmodule MoonWeb.Pages.Components.Dialog.ModalPage do
  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Autolayouts.PullAside
  alias Moon.Autolayouts.LeftToRight
  alias Moon.Components.Button
  alias Moon.Components.Dialog.Modal
  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "#",
        name: "Dialog"
      },
      %{
        to: "/components/dialog/modal",
        name: "Modal"
      }
    ]

  data modal_is_open, :boolean, default: false

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown>
        <Heading size={56} class="mb-4">Modal</Heading>

        <Link to="https://www.figma.com/file/S3q1SkVngbwHuwpxHKCsgtJj/Moon---Components?node-id=60%3A25">Figma design</Link>

        <ExampleAndCode title="Modal" id="modal_1">
          <:example>
            <Button variant="primary" on_click="open_modal">Open modal</Button>
            <Modal close="close_modal" :if={@modal_is_open}>
              <:title>Title text</:title>
              <:content>Content here</:content>
              <:footer>
                <PullAside>
                  <:left>
                    <Button>Label</Button>
                  </:left>
                  <:right>
                    <LeftToRight>
                      <Button variant="tertiary">Label</Button>
                      <Button variant="primary">Label</Button>
                    </LeftToRight>
                  </:right>
                </PullAside>
              </:footer>
            </Modal>
          </:example>
          <:code>{get_example_code_1()}</:code>
          <:state>{get_state(assigns)}</:state>
        </ExampleAndCode>
      </TopToDown>
    </Page>
    """
  end

  def mount(params, _session, socket) do
    {:ok,
     assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def handle_event("open_modal", _params, socket) do
    socket = assign(socket, modal_is_open: true)
    {:noreply, socket}
  end

  def handle_event("close_modal", _params, socket) do
    socket = assign(socket, modal_is_open: false)
    {:noreply, socket}
  end

  def get_example_code_1() do
    """
    Code
    """
  end

  def get_state(assigns) do
    inspect(%{modal_is_open: assigns.modal_is_open})
  end

end
