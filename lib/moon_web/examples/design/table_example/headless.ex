defmodule MoonWeb.Examples.Design.TableExample.Headless do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Table
  alias Moon.Design.Table.Column
  alias Moon.Components.Renderers.Datetime

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
    <Table items={model <- @models} is_headless>
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
            created_at: DateTime.add(DateTime.utc_now(), -3600 + x)
          }
        end)
    )

    def render(assigns) do
      ~F\"""
      <Table items={model <- @models} is_headless>
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
