defmodule MoonWeb.Examples.Design.TableExample.Sorting do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Table

  prop(models, :list,
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

  prop(sort, :keyword, default: [name: "ASC"])

  def handle_event(
        "handle_sorting_click",
        %{"sort-dir" => sort_dir, "sort-key" => sort_key},
        socket
      ) do
    {:noreply, socket |> assign(sort: ["#{sort_key}": sort_dir]) |> sort_models()}
  end

  def update(assigns, socket) do
    {:ok, socket |> assign(assigns) |> sort_models()}
  end

  defp sort_models(socket) do
    [{field, sort_dir} | _] = socket.assigns.sort

    assign(socket,
      models:
        socket.assigns.models
        |> Enum.sort_by(& &1[field], &if(sort_dir == "ASC", do: &1 < &2, else: &1 > &2))
    )
  end

  def render(assigns) do
    ~F"""
    <Table {=@sort} items={model <- @models} sorting_click="handle_sorting_click" is_cell_border>
      <Table.Column name="id" label="ID" sortable>
        {model.id}
      </Table.Column>
      <Table.Column name="name" label="Name" sortable>
        {model.name}
      </Table.Column>
      <Table.Column name="user" label="User" sortable>
        {model.user}
      </Table.Column>
      <Table.Column name="created_at" label="Created at" sortable>
        {Timex.format!(model.created_at, "%b %d, %Y, %H:%M:%S", :strftime)}
      </Table.Column>
      <Table.Column label="Description">
        {model.lorem}
      </Table.Column>
    </Table>
    """
  end

  def code() do
    """
    alias Moon.Design.Table

    prop(models, :list,
      default:
        Enum.map(1..5, fn x ->
          %{
            id: x,
            name: "Name \#{x}",
            created_at: DateTime.add(DateTime.utc_now(), -3600 * x),
            user: "User #\#{x}",
            lorem: "lorem ipsum dolor sit almet"
          }
        end)
    )

    prop(sort, :keyword, default: [name: "ASC"])

    def handle_event(
          "handle_sorting_click",
          %{"sort-dir" => sort_dir, "sort-key" => sort_key},
          socket
        ) do
      {:noreply, socket |> assign(sort: ["\#{sort_key}": sort_dir]) |> sort_models()}
    end

    def update(assigns, socket) do
      {:ok, socket |> assign(assigns) |> sort_models()}
    end

    defp sort_models(socket) do
      [{field, sort_dir} | _] = socket.assigns.sort

      assign(socket,
        models:
          socket.assigns.models
          |> Enum.sort_by(& &1[field], &if(sort_dir == "ASC", do: &1 < &2, else: &1 > &2))
      )
    end

    def render(assigns) do
      ~F\"""
      <Table {=@sort} items={model <- @models} sorting_click="handle_sorting_click" is_cell_border>
        <Table.Column name="id" label="ID" sortable>
          {model.id}
        </Table.Column>
        <Table.Column name="name" label="Name" sortable>
          {model.name}
        </Table.Column>
        <Table.Column name="user" label="User" sortable>
          {model.user}
        </Table.Column>
        <Table.Column name="created_at" label="Created at" sortable>
          {Timex.format!(model.created_at, "%b %d, %Y, %H:%M:%S", :strftime)}
        </Table.Column>
        <Table.Column label="Description">
          {model.lorem}
        </Table.Column>
      </Table>
      \"""
    end
    """
  end
end
