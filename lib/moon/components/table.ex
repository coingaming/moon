defmodule Moon.Components.Table do
  use Surface.LiveComponent

  alias Moon.Components.Table.Paging
  alias Moon.Icon

  @doc "Params from LiveView mount(params, session, socket) that must be passed on"
  prop(limit, :integer, default: 10)
  prop(offset, :integer, default: 0)
  prop(selected, :string)
  prop(sort_key, :any)
  prop(sort_dir, :any, default: "ASC")

  @doc "The list of items to be rendered"
  prop(items, :generator, required: true)

  prop(row_click, :event)
  prop(paging_click, :event)
  prop(sorting_click, :event)
  prop(paging_info, :any)

  @doc "The list of columns defining the Grid"
  slot(cols, generator_prop: :items)

  def render(assigns) do
    ~F"""
    <div class="w-full grid gap-4">
      {#if @paging_info}
        <Paging paging_info={@paging_info} paging_click={@paging_click} limit={@limit} offset={@offset} />
      {/if}
      <div class="w-full overflow-x-scroll">
        <table class="text-sm border-collapse border-t border-beerus-100" style="min-width: 100%;">
          <thead>
            <tr>
              {#for col <- @cols}
                <th
                  class="border-r last:border-r-0 border-beerus-100 p-2 text-left text-trunks-100 font-normal"
                  style="min-width: 200px"
                  :on-click={(col.sortable && @sorting_click) || nil}
                  :values={"sort-key": col.name, "sort-dir": toggle_sort_dir(@sort_dir)}
                  data-testid={"sort-column-#{col.name}"}
                >
                  {col.label}
                  {#if "#{@sort_key}" == "#{col.name}"}
                    <Icon class="text-[1.5em]" name="arrows_up" :if={"#{@sort_dir}" == "ASC"} />
                    <Icon class="text-[1.5em]" name="arrows_down" :if={"#{@sort_dir}" == "DESC"} />
                  {/if}
                </th>
              {/for}
            </tr>
          </thead>
          <tbody>
            {#for {item, row_index} <- Enum.with_index(@items)}
              <tr
                class={
                  "bg-goku-120": @selected == "#{item.id}",
                  "bg-gohan-100": @selected != "#{item.id}" && rem(row_index, 2) == 0
                }
                }
                :on-click={@row_click}
                :values={selected: item.id}
                data-testid={"row-#{row_index}"}
              >
                {#for {col, col_index} <- Enum.with_index(@cols)}
                  <td
                    class="border-r last:border-r-0 border-beerus-100 p-2"
                    data-testid={"row-#{row_index}-col-#{col_index}"}
                  >
                    <#slot {col} generator_value={item} />
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

  def toggle_sort_dir(sort_dir) do
    sort_dir = "#{sort_dir}"

    if sort_dir == "ASC" do
      "DESC"
    else
      "ASC"
    end
  end
end
