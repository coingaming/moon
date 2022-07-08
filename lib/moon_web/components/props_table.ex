defmodule MoonWeb.Components.PropsTable do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias MoonWeb.Components.Table.Table
  alias MoonWeb.Components.Table.Column

  prop title, :string, default: "Props"
  prop data, :list
  slot default

  def render(assigns) do
    ~F"""
    <section class="flex flex-col gap-6">
      <div class="text-moon-24 font-semibold">{@title}</div>
      <Table items={@data}>
        <Column name="name" label="Name" :let={item: item} is_row_header>
          {item.name}
        </Column>
        <Column name="type" label="Type" :let={item: item}>
          {item.type}
        </Column>
        <Column name="required" label="Required" :let={item: item}>
          {item.required}
        </Column>
        <Column name="default" label="Default" :let={item: item}>
          {item.default}
        </Column>
        <Column name="description" label="Description" :let={item: item}>
          {item.description}
        </Column>
      </Table>
    </section>
    """
  end
end
