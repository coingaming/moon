defmodule Moon.Design.Drawer do
  @moduledoc false

  use Moon.StatefulComponent

  prop(is_open, :boolean, default: false)
  prop(on_click, :event)
  prop(on_close, :event)

  prop(test_id, :string)

  slot(panel, required: true)
  slot(backdrop)
  slot(trigger, required: true)

  def render(assigns) do
    ~F"""
    <div>
        <div role="button" :on-click={@on_click || "open_panel"}>
          <#slot {@trigger} />
        </div>
        <div
          aria-expanded={(@is_open && "true") || "false"}
          class={"fixed z-50 inset-0", hidden: @is_open == false}
          data-testid={@test_id}

        >
          <#slot {@backdrop} />
          <span :on-click-away="close_panel"> <#slot
            {@panel}
            context_put={
              on_close: @on_close
            }
          />
          </span>
        </div>
    </div>
    """
  end

  def handle_event("open_panel", _, socket) do
    {:noreply, assign(socket, is_open: true)}
  end

  def handle_event("close_panel", _, socket) do
    {:noreply, assign(socket, is_open: false)}
  end
end
