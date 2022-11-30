defmodule Moon.Components.Table do
  @moduledoc false

  use Surface.Component

  alias Moon.Components.Table.Paging
  alias Moon.Icon

  @doc "Params from LiveView mount(params, session, socket) that must be passed on"
  prop(limit, :integer, default: 10)
  prop(offset, :integer, default: 0)
  @doc "List of  selected ids, or just id, or [], or nil"
  prop(selected, :any, default: [])
  prop(sort_key, :any)
  prop(sort_dir, :any, default: "ASC")

  @doc "The list of items to be rendered"
  prop(items, :generator, required: true)

  prop(row_click, :event)
  prop(paging_click, :event)
  prop(sorting_click, :event)
  prop(paging_info, :any)

  prop(row_gap, :css_class, default: "border-spacing-y-1")
  prop(row_size, :string, values!: ~w(2xs xs sm md lg xl 2xl), default: "md")
  prop(is_cell_border, :boolean, default: false)
  prop(is_headless, :boolean, default: false)

  prop(row_bg, :css_class, default: "bg-gohan")
  prop(selected_bg, :css_class, default: "bg-beerus")
  prop(hover_bg, :css_class)

  @doc "The list of columns defining the Grid"
  slot(cols, generator_prop: :items)

  @doc "Just an id for a HTML container"
  prop(id, :string)

  def render(assigns) do
    ~F"""
    <div class="w-full grid gap-4" {=@id}>
      {#if @paging_info}
        <Paging paging_info={@paging_info} paging_click={@paging_click} limit={@limit} offset={@offset} />
      {/if}
      <div class="w-full overflow-x-scroll">
        <table class={"text-sm border-separate border-spacing-x-0 border-beerus min-w-full", @row_gap}>
          <thead :if={!@is_headless}>
            <tr>
              {#for {col, col_index} <- Enum.with_index(@cols)}
                <th
                  class={
                    "text-left font-medium",
                    col.width,
                    text_size_classes(@row_size),
                    "#{inter_cell_border()}": @is_cell_border && col_index < Enum.count(@cols) - 1,
                    "cursor-pointer": col.sortable && @sorting_click
                  }
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
                  (is_selected(item.id, @selected) && @selected_bg) || @row_bg,
                  @hover_bg,
                  "cursor-pointer": @row_click
                }
                :on-click={@row_click}
                :values={selected: "#{item.id}"}
                data-testid={"row-#{row_index}"}
              >
                {#for {col, col_index} <- Enum.with_index(@cols)}
                  <td
                    class={
                      "first:rounded-l-moon-s-sm last:rounded-r-moon-s-sm",
                      col.width,
                      text_size_classes(@row_size),
                      "#{inter_cell_border()}": @is_cell_border && col_index < Enum.count(@cols) - 1
                    }
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
    if "#{sort_dir}" == "ASC" do
      "DESC"
    else
      "ASC"
    end
  end

  defp is_selected(id, selected) when is_list(selected), do: "#{id}" in selected
  defp is_selected(id, selected), do: "#{id}" == "#{selected}"

  defp inter_cell_border() do
    "after:content-[\"\"] after:absolute after:w-px after:bg-beerus " <>
      "after:h-3/5 after:bottom-[20%] after:right-0 after:translate-x-[-50%] relative"
  end

  defp text_size_classes(row_size) do
    case row_size do
      "2xs" -> "text-moon-10 py-0 px-2"
      "xs" -> "text-moon-12 py-1 px-2"
      "sm" -> "text-moon-14 py-1 px-3"
      "md" -> "text-moon-14 py-2 px-3"
      "lg" -> "text-moon-14 py-3 px-3"
      "xl" -> "text-moon-14 py-4 px-3"
      "2xl" -> "text-moon-14 py-5 px-3"
    end
  end
end
