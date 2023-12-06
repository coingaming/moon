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
    <section class="flex flex-col gap-2 w-full overflow-x-auto">
      <div class="text-moon-24 font-semibold">
        {(@module && "#{@module} props" |> String.replace("Elixir.Moon.Design.", "")) || @title}
      </div>
      <div
        :if={@module && function_exported?(@module, :__moduledoc__, 0) && @module.__moduledoc__()}
        class="text-moon-14"
      >{@module.__moduledoc__()}</div>
      <Table items={item <- @data || data_from_module(@module)} class="p-4">
        <Column name="name" label="Name">
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
    # Button / IconButton variant property fix
    ((module.__props__()
      |> Enum.map(fn prop ->
        %{
          :name => "#{prop[:name]}",
          :type =>
            (Keyword.get(prop[:opts], :values!) ||
               Keyword.get(prop[:opts], :values) ||
               ["#{prop[:type]}"])
            |> Enum.join(" | ")
            |> String.replace(
              "fill | outline | ghost | primary | secondary | tertiary",
              "fill | outline | ghost"
            ),
          :required => (Keyword.get(prop[:opts], :required, false) && "Yes") || "No",
          :default =>
            Keyword.get(prop[:opts], :default) |> inspect() |> String.replace(~r/^nil$/, "-"),
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
        end)))
    |> Enum.filter(
      &(!String.starts_with?(&1[:description], "Experimental:") &&
          !String.starts_with?(&1[:description], "Deprecated:"))
    )
  end
end
