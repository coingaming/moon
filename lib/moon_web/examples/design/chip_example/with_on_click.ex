defmodule MoonWeb.Examples.Design.ChipExample.WithOnClick do
  @moduledoc false

  use MoonWeb, :stateful_component
  use MoonWeb, :example

  require Logger

  alias Moon.Design.Chip

  prop(chip_status, :string, default: "Click me!")

  def render(assigns) do
    ~F"""
    <div>
      <Chip on_click="on_click">{@chip_status}</Chip>
    </div>
    """
  end

  def handle_event("on_click", _, socket) do
    socket =
      socket
      |> assign(:chip_status, "Chip clicked!")

    {:noreply, socket}
  end

  def code() do
    """
    alias Moon.Design.Chip

    prop(chip_status, :string, default: "Click me!")

    ...

    <Chip on_click="on_click">{@chip_status}</Chip>
    """
  end
end
