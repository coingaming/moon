defmodule MoonWeb.Components.PropsTable do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias Moon.Design.Table
  alias Moon.Design.Table.Column

  prop(title, :string, default: "Props")
  prop(data, :list)
  prop(module, :module)
  slot(default)

  def render(assigns) do
    ~F"""
    <section class="flex flex-col gap-6">
      <div class="text-moon-24 font-semibold">{@title}</div>
      <Table
        items={item <- (@module && data_from_module(@module)) || data_from_data(@data)}
        class="bg-goku p-4 rounded-moon-s-sm"
      >
        <Column name="name" label="Name" is_row_header>
          {item.name}
        </Column>
        <Column name="type" label="Type">
          {item.type}
        </Column>
        <Column name="required" label="Required">
          {item.required}
        </Column>
        <Column name="default" label="Default">
          {item.default}
        </Column>
        <Column name="description" label="Description">
          {item.description}
        </Column>
      </Table>
    </section>
    """
  end

  defp data_from_module(module) do
    (Enum.with_index(module.__props__())
     |> Enum.map(fn {prop, index} ->
       %{
         :id => index,
         :name => "#{prop[:name]}",
         :type => Keyword.get(prop[:opts], :values!, ["#{prop[:type]}"]) |> Enum.join(" | "),
         :required => (Keyword.get(prop[:opts], :required, false) && "Yes") || "No",
         :default => Keyword.get(prop[:opts], :default, "-"),
         :description => prop[:doc] || "-"
       }
     end)) ++
      (Enum.with_index(module.__slots__())
       |> Enum.map(fn {prop, index} ->
         %{
           :id => index + 1000,
           :name => "#{prop[:name]}",
           :type => "slot",
           :required => (Keyword.get(prop[:opts], :required, false) && "Yes") || "No",
           :default => "-",
           :description => prop[:doc] || "-"
         }
      end))
  end

  defp data_from_data(data) do
    Enum.with_index(data) |> Enum.map(fn {item, index} -> Map.merge(item, %{id: index}) end)
  end
end
