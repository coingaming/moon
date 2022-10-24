defmodule MoonWeb.Components.Table.Table do
  @moduledoc false

  use Moon.StatelessComponent

  @doc "The list of items to be rendered"
  prop items, :list, required: true

  @doc "The list of columns defining the Grid"
  slot cols, args: [item: ^items]

  def render(assigns) do
    ~F"""
    <div class="overflow-x-auto text-bulma-100">
      <table class="min-w-full divide-y divide-beerus-100">
        <thead class="bg-goku-100">
          <tr>
            {#for col <- @cols}
              <th
                class="px-4 py-3 text-left text-moon-12 font-semibold uppercase"
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
              class={if rem(row_index, 2) == 0, do: "bg-gohan-100", else: "bg-goku-100"}
            >
              {#for {_, col_index} <- Enum.with_index(@cols)}
                <td
                  class={
                    "px-4 py-4 whitespace-nowrap text-moon-14 text-left",
                    "font-semibold": col_index == 0
                  }
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
    """
  end
end
