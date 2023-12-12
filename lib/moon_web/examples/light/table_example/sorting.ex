defmodule MoonWeb.Examples.Light.TableExample.Sorting do
  @moduledoc false
  use Moon.Light.LiveComponent
  use MoonWeb, :example

  attr(:models, :list,
    default:
      Enum.map(1..5, fn x ->
        %{
          id: x,
          name: "Name #{x}",
          created_at: DateTime.add(DateTime.utc_now(), -3600 * x),
          user: "User ##{x}",
          lorem: "lorem ipsum dolor sit almet"
        }
      end)
  )

  attr(:sort, :any, default: [name: "ASC"])

  def render(assigns) do
    ~H"""
    <div class="w-full">
      <.table sort={@sort} items={@models} sorting_click="handle_sorting_click" is_cell_border={true}>
        <:cols :let={model} name="id" label="ID" sortable={true}>
          <%= model.id %>
        </:cols>
        <:cols :let={model} name="name" label="Name" sortable={true}>
          <%= model.name %>
        </:cols>
        <:cols :let={model} name="user" label="User" sortable={true}>
          <%= model.user %>
        </:cols>
        <:cols :let={model} name="created_at" label="Created at" sortable={true}>
          <%= Timex.format!(model.created_at, "%b %d, %Y, %H:%M:%S", :strftime) %>
        </:cols>
        <:cols :let={model} label="Description">
          <%= model.lorem %>
        </:cols>
      </.table>
    </div>
    """
  end

  def handle_event(
        "handle_sorting_click",
        %{"sort-dir" => sort_dir, "sort-key" => sort_key},
        socket
      ) do
    {:noreply, socket |> assign(sort: [{:"#{sort_key}", sort_dir}])}
  end
end
