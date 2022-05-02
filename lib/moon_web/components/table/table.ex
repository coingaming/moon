defmodule MoonWeb.Components.Table.Table do
  @moduledoc false

  use Moon.StatelessComponent

  @doc "The list of items to be rendered"
  prop items, :list, required: true

  @doc "The list of columns defining the Grid"
  slot cols, args: [item: ^items]

  def render(assigns) do
    ~F"""
    <div className="flex flex-col">
      <div className="-my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
        <div className="py-2 align-middle inline-block min-w-full sm:px-4 lg:px-8">
          <div className="shadow overflow-hidden border-b border-gray-200 sm:rounded-lg">
            <table class="min-w-full divide-y divide-gray-200" style="min-width: 100%;">
              <thead class="bg-gray-50">
                <tr>
                  {#for col <- @cols}
                    <th
                      class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                      style="min-width: 200px"
                      data-testid={"sort-column-#{col.name}"}
                    >
                      {col.label}
                    </th>
                  {/for}
                </tr>
              </thead>
              <tbody>
                {#for {item, row_index} <- Enum.with_index(@items)}
                  <tr
                    data-testid={"row-#{row_index}"}
                    class={if rem(row_index, 2) == 0, do: "bg-white", else: "bg-gohan-100"}
                  >
                    {#for {_, col_index} <- Enum.with_index(@cols)}
                      <td
                        class={"px-4 py-4 whitespace-nowrap text-sm text-left", "text-gray-900, font-medium": col_index == 0}
                        data-testid={"row-#{row_index}-col-#{col_index}"}
                      >
                        <#slot name="cols" index={col_index} :args={item: item} />
                      </td>
                    {/for}
                  </tr>
                {/for}
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
