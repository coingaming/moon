defmodule MoonWeb.Examples.Light.TableExample.Checkboxes do
  @moduledoc false
  use Moon.Light.LiveComponent
  use MoonWeb, :example
  alias Moon.Components.Renderers.Datetime
  alias Moon.Components.Lego

  attr(:selected, :list, default: [])

  attr(:models, :list,
    default:
      Enum.map(1..5, fn x ->
        %{id: x, name: "Name #{x}", created_at: DateTime.utc_now()}
      end)
  )

  attr(:checked, :list, default: [])

  def render(assigns) do
    ~H"""
    <div>
      <.table items={@models} selected={@checked}>
        <:cols :let={model} name="id" label="ID">
          <span
            phx-click="checkbox_click"
            phx-target={@myself}
            {data_values(id: model.id)}
            class="flex cursor-pointer"
          >
            <.moon module={Lego.Checkbox} is_selected={"#{model.id}" in @checked} />
            <.moon module={Lego.Title} title={model.id} />
          </span>
        </:cols>
        <:cols :let={model} name="name" label="Name">
          <%= model.name %>
        </:cols>
        <:cols :let={model} name="created_at" label="Created at">
          <.moon module={Datetime} value={model.created_at} />
        </:cols>
      </.table>
    </div>
    """
  end

  def mount(socket) do
    {:ok, assign(socket, checked: [])}
  end

  def handle_event("checkbox_click", %{"id" => id}, socket) do
    checked =
      if id in socket.assigns[:checked] do
        Enum.filter(socket.assigns[:checked], &(&1 != id))
      else
        [id | socket.assigns[:checked]]
      end

    {:noreply, assign(socket, checked: checked)}
  end
end
