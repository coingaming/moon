defmodule MoonWeb.Examples.Design.AlertExample.HandleClose do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Button
  alias Moon.Design.Alert

  prop(is_open, :boolean, default: true)

  def render(assigns) do
    ~F"""
    <div class="flex flex-wrap items-center justify-around gap-2 w-full bg-transparent">
      {#if @is_open == true}
        <Alert>
          Click the Close button to hide the Alert
          <Alert.Close on_click="close_alert" />
        </Alert>
      {#else}
        <Button variant="secondary" on_click="open_alert">
          Show Alert
        </Button>
      {/if}
    </div>
    """
  end

  def handle_event("open_alert", _params, socket) do
    socket = assign(socket, is_open: true)
    {:noreply, socket}
  end

  def handle_event("close_alert", _params, socket) do
    socket = assign(socket, is_open: false)
    {:noreply, socket}
  end

  def code() do
    """
    alias Moon.Design.Button
    alias Moon.Design.Alert

    prop(is_open, :boolean, default: true)

    ...

    <div class="flex flex-wrap items-center justify-around gap-2 w-full bg-transparent">
      {#if @is_open == true}
        <Alert>
          Click the Close button to hide the Alert
          <Alert.Close on_click="close_alert" />
        </Alert>
      {#else}
        <Button variant="secondary" on_click="open_alert">
          Show Alert
        </Button>
      {/if}
    </div>

    ...

    def handle_event("open_alert", _params, socket) do
      socket = assign(socket, is_open: true)
      {:noreply, socket}
    end

    def handle_event("close_alert", _params, socket) do
      socket = assign(socket, is_open: false)
      {:noreply, socket}
    end
    """
  end
end
