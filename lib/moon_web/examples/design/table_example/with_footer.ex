defmodule MoonWeb.Examples.Design.TableExample.WithFooter do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Table
  alias Moon.Design.Table.Column
  alias Moon.Design.Table.FooterColumn
  alias Moon.Components.Renderers.Datetime

  prop(models, :list,
    default:
      Enum.map(1..5, fn x ->
        %{
          id: x,
          name: "Name #{x}",
          created_at: DateTime.utc_now(),
          counter: x
        }
      end)
  )

  prop(footer_items, :list, default: [%{name: "Total", counter_total: 15}])

  def render(assigns) do
    ~F"""
    <div>
      <Table
        items={model <- @models}
        footer_items={footer_item <- @footer_items}
        selected={nil}
        footer_class="font-bold"
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
        <Column name="counter" label="Counter">
          {model.counter}
        </Column>
        <FooterColumn>
          {footer_item.name}
        </FooterColumn>
        <FooterColumn colspan={2} />
        <FooterColumn>
          {footer_item.counter_total}
        </FooterColumn>
      </Table>
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
            created_at: DateTime.utc_now(),
            counter: x
          }
        end)
    )

    def render(assigns) do
      ~F\"""
      <Table items={model <- @models} selected={nil} footer_class="font-bold">
        <Column name="id" label="ID">
          {model.id}
        </Column>
        <Column name="name" label="First Name">
          {model.name}
        </Column>
        <Column name="created_at" label="Created at">
          <Datetime value={model.created_at} />
        </Column>
        <Column name="counter" label="Counter">
          {model.counter}
        </Column>
        <FooterColumn>
          {footer_item.name}
        </FooterColumn>
        <FooterColumn colspan={2}/>
        <FooterColumn>
          {footer_item.counter_total}
        </FooterColumn>
      </Table>
      \"""
    end
    """
  end
end
