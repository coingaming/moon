defmodule MoonWeb.Pages.Components.Dialog.ModalPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.PullAside
  alias Moon.Autolayouts.LeftToRight
  alias Moon.Components.Button
  alias Moon.Components.Dialog.Modal
  alias Moon.Components.Select.SingleSelect
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.Facing.DeprecationWarning

  data(breadcrumbs, :any,
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
  )

  data(modal_is_open, :boolean, default: true)

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Modal">
        <DeprecationWarning
          name="Modal"
          href={live_path(MoonWeb.Endpoint, MoonWeb.Pages.Design.ModalPage,
            theme_name: @theme_name,
            direction: @direction
          )}
        />
      </ComponentPageDescription>

      <ExampleAndCode title="Modal" id="modal_1">
        <:example>
          <Button variant="primary" on_click="open_modal">Open modal</Button>
          <Modal close="close_modal" :if={@modal_is_open}>
            <:title>Title text</:title>
            <:content>
              <SingleSelect
                id="permissions-1"
                options={MoonWeb.Pages.Tutorials.AddDataUsingForm.User.available_permissions_with_left_icon()}
              />
            </:content>
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
    </Page>
    """
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
    """
  end

  def get_state(assigns) do
    inspect(%{modal_is_open: assigns.modal_is_open})
  end
end
