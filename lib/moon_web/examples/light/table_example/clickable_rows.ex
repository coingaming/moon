defmodule MoonWeb.Examples.Light.TableExample.ClickableRows do
  @moduledoc false
  use Moon.Light.LiveComponent
  use MoonWeb, :example
  alias Moon.Components.Renderers.Datetime
  attr(:selected, :list, default: [])

  attr(:models, :list,
    default:
      Enum.map(1..5, fn x ->
        %{id: x, name: "Name #{x}", created_at: DateTime.add(DateTime.utc_now(), -3600 + x)}
      end)
  )

  def render(assigns) do
    ~H"""
    <div>
      <.table
        items={@models}
        row_click={%Event{name: "single_row_click", target: @myself}}
        selected={@selected}
      >
        <:cols :let={model} name="id" label="ID">
          <%= model.id %>
        </:cols>
        <:cols :let={model} name="name" label="First Name">
          <%= model.name %>
        </:cols>
        <:cols :let={model} name="created_at" label="Created at">
          <.moon module={Datetime} value={model.created_at} />
        </:cols>
      </.table>
    </div>
    """
  end

  def handle_event("single_row_click", %{"selected" => selected}, socket) do
    {:noreply, assign(socket, selected: [selected])}
  end
end
