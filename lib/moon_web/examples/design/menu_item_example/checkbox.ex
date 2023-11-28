defmodule MoonWeb.Examples.Design.MenuItemExample.Checkbox do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.MenuItem
  alias Moon.Lego

  data(selected0, :boolean, default: false)
  data(selected1, :boolean, default: true)

  def render(assigns) do
    ~F"""
    <div class="flex justify-around w-full">
      <div class="w-56">
        <MenuItem role="checkbox" title="Your value" on_click="on_select1" is_selected={@selected1} />
      </div>
      <div class="w-56">
        <MenuItem role="checkbox" on_click="on_select0" is_selected={@selected0}>
          <Lego.Title>Your value</Lego.Title>
          <Lego.Checkbox />
        </MenuItem>
      </div>
    </div>
    """
  end

  def handle_event("on_select" <> number, params, socket) do
    {:noreply, assign(socket, :"selected#{number}", Map.get(params, "is-selected") == "true")}
  end

  def code() do
    """
    alias Moon.Design.MenuItem
    alias Moon.Lego

    data(selected0, :boolean, default: false)
    data(selected1, :boolean, default: true)

    def render(assigns) do
      ~F\"""
      <div class="flex justify-around w-full">
        <div class="w-56">
          <MenuItem role="checkbox" title="Your value" on_click="on_select1" is_selected={@selected1} />
        </div>
        <div class="w-56">
          <MenuItem role="checkbox" on_click="on_select0" is_selected={@selected0}>
            <Lego.Title>Your value</Lego.Title>
            <Lego.Checkbox />
          </MenuItem>
        </div>
      </div>
      \"""
    end

    def handle_event("selected0, params, socket) do
      {:noreply, assign(socket, :selected0, Map.has_key?(params, "is_selected"))}
    end

    def handle_event("selected1, params, socket) do
      {:noreply, assign(socket, :selected1, Map.has_key?(params, "is_selected"))}
    end
    """
  end
end
