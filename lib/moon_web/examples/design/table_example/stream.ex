defmodule MoonWeb.Examples.Design.TableExample.Stream do
  @moduledoc false

  use Moon.LiveView
  use MoonWeb, :example

  alias Moon.Design.Table
  alias Moon.Design.Table.Column
  alias Moon.Components.Renderers.Datetime

  def mount(_params, _session, socket) do
    {:ok, stream(socket, :models, models())}
  end

  defp models() do
    Enum.map(1..5, fn x ->
      %{
        id: x,
        name: "Name #{x}",
        created_at: DateTime.utc_now()
      }
    end)
  end

  def render(assigns) do
    ~F"""
    <div>
      <Table
        items={model <- @streams.models}
        body_attrs={%{"phx-update" => "stream"}}
        row_click="row_click"
      >
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

  def handle_event("row_click", params, socket) do
    data =
      models()
      |> Enum.map(&(("#{&1.id}" == params["selected"] && Map.put(&1, :is_selected, true)) || &1))

    {:noreply, stream(socket, :models, data, reset: true)}
  end

  def code() do
    """
    use Phoenix.LiveView

    alias Moon.Design.Table
    alias Moon.Design.Table.Column
    alias Moon.Components.Renderers.Datetime

    def mount(_params, _session, socket) do
      {:ok, stream(socket, :models, models())}
    end

    defp models() do
      Enum.map(1..5, fn x ->
        %{
          id: x,
          name: "Name \#{x}",
          created_at: DateTime.utc_now()
        }
      end)
    end

    def render(assigns) do
      ~F\"""
      <div>
        <Table items={model <- @streams.models} selected={nil} body_attrs={%{"phx-update" => "stream"}}>
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
      \"""
    end

    def handle_event("row_click", params, socket) do
      data = models()
      |> Enum.map(&("\#{&1.id}" == params["selected"] && Map.put(&1, :is_selected, true) || &1))
      {:noreply, stream(socket, :models, data, reset: true )}
    end
    """
  end
end
