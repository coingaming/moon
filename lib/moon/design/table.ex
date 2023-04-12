defmodule Moon.Design.Table do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.Table.Paging
  alias Moon.Icon

  @doc "Pagination stuff"
  prop(limit, :integer, default: 10)

  @doc "Pagination stuff"
  prop(offset, :integer, default: 0)

  @doc "List of  selected ids, or just id, or [], or nil"
  prop(selected, :any, default: [])

  @doc "Sorting stuff"
  prop(sort_key, :any)

  @doc "Sorting stuff"
  prop(sort_dir, :any, default: "ASC")

  @doc "The list of items to be rendered. Each item should have an id"
  prop(items, :generator, required: true)

  @doc "Event that firset on row click"
  prop(row_click, :event)

  @doc "Paging stuff"
  prop(paging_click, :event)

  @doc "Sorting stuff"
  prop(sorting_click, :event)

  @doc "Paging stuff"
  prop(paging_info, :any)

  @doc "can be used to add any class to the table"
  prop(row_gap, :css_class, default: "border-spacing-y-1")

  @doc "size of the row. not a css class!"
  prop(row_size, :string, values!: ~w(2xs xs sm md lg xl 2xl), default: "md")

  @doc "if cell has border"
  prop(is_cell_border, :boolean, default: false)

  @doc "wherever table has column headers or not"
  prop(is_headless, :boolean, default: false)

  @doc "can be used as an additional class for all the rows"
  prop(row_bg, :css_class, default: "bg-gohan")

  @doc "can be used as an additional class for selected rows"
  prop(selected_bg, :css_class, default: "bg-beerus")

  @doc "can be used as an additional class for header row"
  prop(header_row_class, :css_class)

  @doc "can be used as an additional class for all rows. please use hover:... tailwind's format"
  prop(hover_bg, :css_class)

  @doc "The list of columns defining the Grid"
  slot(cols, generator_prop: :items)

  @doc "Just an id for a HTML container"
  prop(id, :string)

  @doc "data-testid attribute for a HTML container"
  prop(testid, :string)

  @doc "additional classes for a HTML container"
  prop(class, :css_class)

  def render(assigns) do
    ~F"""
    <div class={merge(["w-full grid gap-4", @class])} {=@id} data-testid={@testid}>
      {#if @paging_info}
        <Paging paging_info={@paging_info} paging_click={@paging_click} limit={@limit} offset={@offset} />
      {/if}
      <div class="w-full overflow-x-scroll">
        <table class={"text-sm border-separate border-spacing-x-0 border-beerus min-w-full", @row_gap}>
          <thead :if={!@is_headless}>
            <tr class={@header_row_class}>
              {#for {col, col_index} <- Enum.with_index(@cols)}
                <th
                  class={merge([
                    "text-left font-medium whitespace-nowrap",
                    text_size_classes(@row_size),
                    [
                      "#{inter_cell_border()}": @is_cell_border && col_index < Enum.count(@cols) - 1,
                      "cursor-pointer": col.sortable && @sorting_click
                    ],
                    col.width,
                    col.class
                  ])}
                  :on-click={(col.sortable && @sorting_click) || nil}
                  :values={"sort-key": col.name, "sort-dir": toggle_sort_dir(@sort_dir)}
                  data-testid={"sort-column-#{col.name}"}
                >
                  {col.label}
                  <Icon
                    :if={col.name && "#{@sort_key}" == "#{col.name}"}
                    class={
                      "text-[1.5em] transition-transform transition-200",
                      "rotate-180": @sort_dir != "ASC"
                    }
                    name="arrows_up"
                  />
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
                    class={merge([
                      "first:rounded-l-moon-s-sm last:rounded-r-moon-s-sm",
                      col.width,
                      text_size_classes(@row_size),
                      ["#{inter_cell_border()}": @is_cell_border && col_index < Enum.count(@cols) - 1],
                      col.class
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
