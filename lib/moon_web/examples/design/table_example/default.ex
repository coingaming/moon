defmodule MoonWeb.Examples.Design.TableExample.Default do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Table
  alias Moon.Design.Table.Column
  alias Moon.Components.Renderers.Datetime

  prop(models, :list,
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
    <Table items={model <- @models} selected={nil}>
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
    """
  end

  def code() do
    """
    alias Moon.Design.Table
    alias Moon.Design.Table.Column
    alias Moon.Components.Renderers.Datetime

    data(models, :list,
      default:
        Enum.map(1..5, fn x ->
          %{
            id: x,
            name: "Name \#{x}",
            created_at: DateTime.utc_now()
          }
        end)
    )

    def render(assigns) do
      ~F\"""
      <Table items={model <- @models} selected={nil}>
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
    """
  end
end
