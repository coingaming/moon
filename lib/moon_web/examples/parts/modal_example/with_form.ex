defmodule MoonWeb.Examples.Parts.ModalExample.WithForm do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Parts.Modal
  alias Moon.Design.Button
  alias Moon.Design.Form

  alias MoonWeb.Schema.Dates

  prop(is_open, :boolean, default: false)
  data(changeset, :any)

  def render(assigns) do
    ~F"""
    <div>
      <Button on_click="open">Open</Button>
      <Modal id="custom-date-selector" {=@is_open}>
          <Form
            id={"#{assigns.id}-form"}
            for={@changeset}
            change="update_selected"
            target={@myself}
            submit="apply"
          >
            <Form.Field label="Start date" field={:date_from} class="flex flex-col gap-2">
              <Form.Input size="lg" type="date" class="text-trunks" />
            </Form.Field>
            <Form.Field label="End date" field={:date_to} class="flex flex-col gap-2">
              <Form.Input size="lg" type="date" class="text-trunks" />
            </Form.Field>
            <Button type="submit" class="rounded-full">Apply</Button>
          </Form>
      </Modal>
    </div>
    """
  end

  def mount(socket) do
    changeset = Dates.create_changeset(%{})
    socket = assign(socket, changeset: changeset)

    {:ok, socket}
  end

  def handle_event("close", _params, socket) do
    Moon.Design.Modal.close("custom-date-selector")
    {:noreply, assign(socket, is_open: false)}
  end

  def handle_event("open", _params, socket) do
    Moon.Design.Modal.open("custom-date-selector")
    {:noreply, assign(socket, is_open: true)}
  end

  def handle_event("update_selected", %{"dates" => params}, socket) do
    changeset = Dates.create_changeset(params)

    {:noreply, assign(socket, changeset: changeset)}
  end

  def handle_event("apply", _params, socket) do
    changeset = Map.merge(socket.assigns.changeset, %{action: :insert})

    socket =
      if changeset.valid? do
        params = %{value: "custom", dates: Ecto.Changeset.apply_changes(changeset)}
        send(self(), {:updated_date_filter, params})
        assign(socket, is_open: false)
      else
        assign(socket, is_open: true, changeset: changeset)
      end

    {:noreply, socket}
  end
end
