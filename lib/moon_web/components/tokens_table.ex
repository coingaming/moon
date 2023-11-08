defmodule MoonWeb.Components.TokensTable do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias Moon.Design.Table
  alias Moon.Design.Table.Column

  prop(title, :string, default: "Props")
  prop(data, :list)

  def render(assigns) do
    ~F"""
    <section class="flex flex-col gap-6 overflow-x-auto">
      <div class="text-moon-24 font-semibold">{@title}</div>
      <Table
        items={item <- @data}
        header_row_class="bg-transparent"
        class="bg-transparent"
        row_bg="bg-gohan whitespace-nowrap"
      >
        <Column name="property" label="Property">
          {item.property}
        </Column>
        <Column name="css" label="CSS variable">
          {item.css}
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
