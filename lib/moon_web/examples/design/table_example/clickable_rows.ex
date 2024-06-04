defmodule MoonWeb.Examples.Design.TableExample.ClickableRows do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Table
  alias Moon.Design.Table.Column
  alias Moon.Components.Renderers.Datetime

  prop(selected, :list, default: [])

  data(models, :list,
    default:
      Enum.map(1..5, fn x ->
        %{
          id: x,
          name: "Name #{x}",
          created_at: DateTime.utc_now()
        }
      end)
  )

  def render(assigns) do
    ~F"""
    <div>
      <Table items={model <- @models} row_click="single_row_click" {=@selected}>
        <Column name="id" label="ID">
          {model.id}
        </Column>
        <Column name="name" label="First Name">
          {model.name}
        </Column>
        <Column name="created_at" label="Created at">
          <Datetime value={model.created_at} />
        </Column>
      </Table>
    </div>
    """
  end

  def handle_event("single_row_click", %{"selected" => selected}, socket) do
    {:noreply, assign(socket, selected: [selected])}
  end

  def code() do
    """
    alias Moon.Design.Table
    alias Moon.Design.Table.Column
    alias Moon.Components.Renderers.Datetime

    prop(selected, :list, default: [])

    data(models, :list,
      default:
        Enum.map(1..5, fn x ->
          %{
            id: x,
            name: "Name #\{x}",
            created_at: DateTime.utc_now()
          }
        end)
    )

    def mount(_params, _session, socket) do
      socket =
        assign(socket,
          selected: []
        )

      {:ok, socket}
    end

    def render(assigns) do
      ~F\"""
      <Table items={model <- @models} row_click="single_row_click" {=@selected}>
        <Column name="id" label="ID">
          {model.id}
        </Column>
        <Column name="name" label="First Name">
          {model.name}
        </Column>
        <Column name="created_at" label="Created at">
          <Datetime value={model.created_at} />
        </Column>
      </Table>
      \"""
    end

    def handle_event("single_row_click", %{"selected" => selected}, socket) do
      {:noreply, assign(socket, selected: [selected])}
    end
    """
  end
end
