defmodule Moon.Components.Table do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.Table.Paging
  alias Moon.Icon

  # import Moon.Helpers.MergeClass

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

  prop(class, :css_class)
  prop(row_class, :css_class)
  prop(id, :string)
  prop(even_row_class, :css_class, default: "bg-gohan")

  prop(has_no_cell_borders, :boolean, default: false)

  @doc "The list of columns defining the Grid"
  slot(cols, generator_prop: :items)

  def render(assigns) do
    ~F"""
    <div class="w-full grid gap-4" {=@id}>
      {#if @paging_info}
        <Paging paging_info={@paging_info} paging_click={@paging_click} limit={@limit} offset={@offset} />
      {/if}
      <div class={merge(["w-full overflow-x-scroll", @class])}>
        <table class="border-collapse text-sm min-w-full">
          <thead>
            <tr class="text-trunks">
              {#for col <- @cols}
                <th
                  class={merge([
                    "py-2 px-4 text-left font-normal",
                    "cursor-pointer": col.name && col.sortable,
                    "#{col.width}": true
                  ])}
                  :on-click={(col.sortable && @sorting_click) || nil}
                  :values={"sort-key": col.name, "sort-dir": toggle_sort_dir(@sort_dir)}
                  data-testid={"sort-column-#{col.name}"}
                >
                  {col.label}
                  {#if col.sortable && "#{@sort_key}" == "#{col.name}"}
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
                class={merge(
                  "#{@even_row_class}": @selected != "#{item.id}" && rem(row_index, 2) == 0,
                  "bg-goku-120": @selected == "#{item.id}",
                  "#{@row_class}": true
                )}
                :on-click={@row_click}
                :values={selected: item.id}
                data-testid={"row-#{row_index}"}
              >
                {#for {col, col_index} <- Enum.with_index(@cols)}
                  <td
                    class={merge([
                      "p-4",
                      "#{inter_cell_border()}": !@has_no_cell_borders && col_index < Enum.count(@cols) - 1,
                      "#{col.width}": true
                    ])}
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

  defp toggle_sort_dir(sort_dir) do
    sort_dir = "#{sort_dir}"

    if sort_dir == "ASC" do
      "DESC"
    else
      "ASC"
    end
  end

  defp inter_cell_border() do
    "after:content-[\"\"] after:absolute after:w-px after:bg-beerus " <>
      "after:h-2/5 after:bottom-[30%] after:right-0 after:translate-x-[-50%] relative"
  end
end
