defmodule MoonWeb.Examples.Design.ChipExample.WithOnClick do
  @moduledoc false

  use MoonWeb, :stateful_component
  use MoonWeb, :example

  require Logger

  alias Moon.Design.Chip

  def render(assigns) do
    ~F"""
    <Chip on_click="on_click">Default</Chip>
    """
  end

  def handle_event("on_click", _, socket) do
    Logger.info("Chip clicked!")
    {:noreply, socket}
  end

  def code() do
    """
    alias Moon.Design.Chip

    ...

    <Chip on_click="on_click">Default</Chip>
    """
  end
end
