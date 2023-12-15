defmodule MoonWeb.Examples.Design.TableExample.DifferentRowGaps do
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
          created_at: DateTime.utc_now()
        }
      end)
  )

  def render(assigns) do
    ~F"""
    <div class="flex flex-wrap w-full">
      {#for gap <-
          ~w(border-spacing-y-0 border-spacing-y-1 border-spacing-y-2 border-spacing-y-4 border-spacing-y-8)}
        <Table items={model <- @models |> Enum.slice(0, 2)} row_gap={gap}>
          <Column name="id" label="ID">
            {model.id}
          </Column>
          <Column name="name" label="Name">
            {model.name}
          </Column>
          <Column name="created_at" label="Created at">
            <Datetime value={model.created_at} />
          </Column>
        </Table>
      {/for}
    </div>
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
      {#for gap <-
          ~w(border-spacing-y-0 border-spacing-y-1 border-spacing-y-2 border-spacing-y-4 border-spacing-y-8)}
        <Table items={model <- @models |> Enum.slice(0, 2)} row_gap={gap}>
          <Column name="id" label="ID">
            {model.id}
          </Column>
          <Column name="name" label="Name">
            {model.name}
          </Column>
          <Column name="created_at" label="Created at">
            <Datetime value={model.created_at} />
          </Column>
        </Table>
      {/for}
      \"""
    end
    """
  end
end
