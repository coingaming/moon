defmodule MoonWeb.Components.TokensTable do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias MoonWeb.Components.Table.Table
  alias MoonWeb.Components.Table.Column

  prop(title, :string, default: "Props")
  prop(data, :list)

  def render(assigns) do
    ~F"""
    <section class="flex flex-col gap-6">
      <div class="text-moon-24 font-semibold">{@title}</div>
      <Table items={item <- @data}>
        <Column name="property" label="Property" is_row_header>
          {item.property}
        </Column>
        <Column name="key" label="Class name">
          {item.key}
        </Column>
        <Column name="value" label="Value">
          {item.value}
        </Column>
      </Table>
    </section>
    """
  end
end
