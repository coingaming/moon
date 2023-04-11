defmodule MoonWeb.Components.PropsTable do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias MoonWeb.Components.Table.Table
  alias MoonWeb.Components.Table.Column

  prop(title, :string, default: "Props")
  prop(data, :list)
  prop(module, :module)
  slot(default)

  def render(assigns) do
    ~F"""
    <section class="flex flex-col gap-6">
      <div class="text-moon-24 font-semibold">{@title}</div>
      <Table items={item <- (@module && data_from_module(@module)) || @data}>
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
    (module.__props__()
     |> Enum.map(fn prop ->
       %{
         :name => "#{prop[:name]}",
         :type => Keyword.get(prop[:opts], :values!, ["#{prop[:type]}"]) |> Enum.join(" | "),
         :required => (Keyword.get(prop[:opts], :required, false) && "Yes") || "No",
         :default => Keyword.get(prop[:opts], :default, "-"),
         :description => prop[:doc] || "-"
       }
     end)) ++
      (module.__slots__()
       |> Enum.map(fn prop ->
         %{
           :name => "#{prop[:name]}",
           :type => "slot",
           :required => (Keyword.get(prop[:opts], :required, false) && "Yes") || "No",
           :default => "-",
           :description => prop[:doc] || "-"
         }
       end))
  end
end
