defmodule MoonWeb.Examples.Design.TableExample.Editable do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Table

  data(models, :list,
    default:
      Enum.map(1..5, fn x ->
        %{
          id: x,
          name: "Name #{x}",
          created_at: DateTime.add(DateTime.utc_now(), -3600 + x)
        }
      end)
  )

  def render(assigns) do
    ~F"""
    <Table items={model <- @models} selected={nil}>
      <Table.Column name="id" label="ID">
        <Table.Input value={model.id} />
      </Table.Column>
      <Table.Column name="name" label="First Name">
        <Table.Input value={model.name} />
      </Table.Column>
      <Table.Column name="created_at" label="Created at">
        <Table.Input value={Timex.format!(model.created_at, "%b %d, %Y, %H:%M:%S", :strftime)} />
      </Table.Column>
    </Table>
    """
  end

  def code() do
    """
    alias Moon.Design.Table

    data(models, :list,
      default:
        Enum.map(1..5, fn x ->
          %{
            id: x,
            name: "Name \#{x}",
            created_at: DateTime.add(DateTime.utc_now(), -3600 + x)
          }
        end)
    )

    def render(assigns) do
      ~F\"""
      <Table items={model <- @models} selected={nil}>
        <Table.Column name="id" label="ID">
          <Table.Input value={model.id} />
        </Table.Column>
        <Table.Column name="name" label="First Name">
          <Table.Input value={model.name} />
        </Table.Column>
        <Table.Column name="created_at" label="Created at">
          <Table.Input value={Timex.format!(model.created_at, "%b %d, %Y, %H:%M:%S", :strftime)} />
        </Table.Column>
      </Table>
      \"""
    end
    """
  end
end
