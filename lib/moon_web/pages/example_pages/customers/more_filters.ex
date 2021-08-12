defmodule MoonWeb.Pages.ExamplePages.Customers.MoreFilters do
  use MoonWeb, :stateful_component

  alias Moon.Components.{Chip, Modal, Button}

  data show_modal, :boolean, default: false

  def render(assigns) do
    ~F"""
      <div>
        <Chip
          on_click="toggle_show_modal"
          right_icon="icon_chevron_down_rounded"
        >
          {"More Filters"}
        </Chip>

        <Modal :if={@show_modal} on_close="toggle_show_modal">
          <:heading>More Filters</:heading>

          <:content>
            <div>More filters come here</div>
          </:content>

          <:footer>
            <div class="flex justify-between">
              <Button variant="danger" size="small" class="rounded">Clear</Button>
              <div class="flex">
                <Button variant="danger" size="small" class="rounded border-bulma-100 mr-4" on_click="toggle_show_modal">
                  Discard
                </Button>
                <Button variant="primary" size="small" class="rounded">
                  Apply
                </Button>
              </div>
            </div>
          </:footer>
        </Modal>
      </div>
    """
  end

  def handle_event("toggle_show_modal", _, socket = %{assigns: %{show_modal: show_modal}}) do
    {:noreply, socket |> assign(show_modal: !show_modal)}
  end
end
