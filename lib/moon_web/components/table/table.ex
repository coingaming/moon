defmodule MoonWeb.Components.Table.Table do
  @moduledoc false

  use Moon.StatelessComponent

  @doc "The list of items to be rendered"
  prop items, :list, required: true

  @doc "The list of columns defining the Grid"
  slot cols, args: [item: ^items]

  def render(assigns) do
    ~F"""
    <div class="w-full grid gap-4">
      <div class="w-full overflow-x-scroll">
        <table class="text-sm border-collapse border-t border-beerus-100" style="min-width: 100%;">
          <thead>
            <tr>
              {#for col <- @cols}
                <th
                  class="border-r last:border-r-0 border-beerus-100 p-2 text-left text-trunks-100 font-normal"
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
              <tr data-testid={"row-#{row_index}"}>
                {#for {_, col_index} <- Enum.with_index(@cols)}
                  <td
                    class="border-r last:border-r-0 border-beerus-100 p-2"
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
    """
  end
end
