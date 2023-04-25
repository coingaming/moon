defmodule MoonWeb.Examples.Form.RadioExample.Default do
  @moduledoc false

  use Moon.StatefulComponent

  use MoonWeb, :example

  alias Moon.Design.Form.Radio

  data(value, :string, default: "")

  def handle_event("changed", %{"value" => value}, socket) do
    {:noreply, assign(socket, value: value)}
  end

  def render(assigns) do
    ~F"""
    <Radio {=@value} on_change="changed" options={first: "First option", second: "Second option"} />
    """
  end

  def code() do
    """
    alias Moon.Design.Form.Radio

    data(value, :string, default: "")

    def handle_event("changed", %{"value" => value}, socket) do
      {:noreply, assign(socket, value: value)}
    end

    def render(assigns) do
      ~F\"""
      <Radio {=@value} on_change="changed" options={first: "First option", second: "Second option"} />
      \"""
    end
    """
  end
end
