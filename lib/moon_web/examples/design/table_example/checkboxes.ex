defmodule MoonWeb.Examples.Design.TableExample.Checkboxes do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Table
  alias Moon.Design.Table.Column
  alias Moon.Components.Renderers.Datetime
  alias Moon.Components.Lego

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

  data(checked, :list, default: [])

  def render(assigns) do
    ~F"""
    <div>
      <Table items={model <- @models} selected={@checked}>
        <Column name="id" label="ID">
          <span :on-click="checkbox_click" :values={id: model.id} class="flex cursor-pointer">
            <Lego.Checkbox is_selected={"#{model.id}" in @checked} />
            <Lego.Title title={model.id} />
          </span>
        </Column>
        <Column name="name" label="Name">
          {model.name}
        </Column>
        <Column name="created_at" label="Created at">
          <Datetime value={model.created_at} />
        </Column>
      </Table>
    </div>
    """
  end

  def mount(socket), do: {:ok, assign(socket, checked: [])}

  def handle_event("checkbox_click", %{"id" => id}, socket) do
    checked =
      if id in socket.assigns[:checked] do
        Enum.filter(socket.assigns[:checked], &(&1 != id))
      else
        [id | socket.assigns[:checked]]
      end

    {:noreply, assign(socket, checked: checked)}
  end

  def code() do
    """
    alias Moon.Design.Table
    alias Moon.Design.Table.Column
    alias Moon.Components.Renderers.Datetime
    alias Moon.Components.Lego

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

    data(checked, :list, default: [])

    def mount(_params, _session, socket) do
      socket =
        assign(socket,
          selected: []
        )

      {:ok, socket}
    end

    def render(assigns) do
      ~F\"""
      <Table items={model <- @models} selected={@checked}>
        <Column name="id" label="ID">
          <span :on-click="checkbox_click" :values={id: model.id} class="flex cursor-pointer">
            <Lego.Checkbox is_selected={"#\{model.id}" in @checked} />
            <Lego.Title title={model.id} />
          </span>
        </Column>
        <Column name="name" label="Name">
          {model.name}
        </Column>
        <Column name="created_at" label="Created at">
          <Datetime value={model.created_at} />
        </Column>
      </Table>
      \"""
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
    """
  end
end
