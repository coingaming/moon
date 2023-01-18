defmodule Moon.Design.Tooltip do
  @moduledoc false

  use Moon.StatefulComponent

  prop(variant, :string,
    values: ["hover", "clickable"],
    default: "hover"
  )

  prop(on_click, :event)
  prop(close, :event)
  prop(is_open, :boolean, default: false)

  slot(default, required: true)
  slot(trigger, required: true)

  def render(assigns) do
    ~F"""
    <div>
    {#if @variant == "hover"}
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
    {#elseif @variant == "clickable"}
      <div
        class="relative inline-block"
        ,
        :on-click={@on_click || "toggle_open"}
        :on-click-away={@close || "close_content"}
      >
        <div class={"transition-opacity transition-200", hidden: @is_open == false}>
          <#slot />
        </div>
        <div class="inline-block">
          <#slot {@trigger} />
        </div>
      </div>
    {/if}
    </div>
    """
  end

  def handle_event("toggle_open", _, socket) do
    if socket.assigns[:is_open] == false do
      {:noreply, assign(socket, is_open: true)}
    else
      {:noreply, assign(socket, is_open: false)}
    end
  end

  def handle_event("close_content", _, socket) do
    socket = assign(socket, is_open: false)
    {:noreply, socket}
  end
end
