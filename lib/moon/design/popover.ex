defmodule Moon.Design.Popover do
  @moduledoc false

  use Moon.StatelessComponent

  slot(default, required: true)
  slot(trigger, required: true)

  def render(assigns) do
    ~F"""
    <div class="relative inline-block group">
      <div
        role="tooltip"
        class="hidden group-hover:block pointer-events-none transition-opacity transition-200"
      >
        <#slot />
      </div>
      <div aria-describedby="tooltip" class="inline-block">
        <#slot {@trigger} />
      </div>
    </div>
    """
  end
end


# defmodule Moon.Design.Popover do
#   @moduledoc false

#   use Moon.StatelessComponent

#   slot(default, required: true)
#   slot(trigger, required: true)

#   def render(assigns) do
#     ~F"""
#     <div class="relative inline-block" phx-click-away={close}>
#       <div
#         class="transition-opacity transition-200"
#       >
#         <#slot />
#       </div>
#       <div class="inline-block" phx-click={toggle_popover}>
#         <#slot {@trigger} />
#       </div>
#     </div>
#     """
#   end

#   def handle_event("close", _params, socket) do
#     socket = assign(socket, open: false)
#     {:noreply, socket}
#   end

#   def handle_event("toggle_open", _params, socket) do
#     if socket.assigns.disabled == false do
#       {:noreply, assign(socket, open: !socket.assigns.open)}
#     else
#       {:noreply, socket}
#     end
#   end
# end
