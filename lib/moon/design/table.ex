defmodule Moon.Design.Table do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Icon

  @doc "List of  selected ids, or just id, or [], or nil"
  prop(selected, :any, default: [])

  @doc "Sorting of the table, format [field:, \"ASC\"|\"DESC\"]. If given, component will sort given items before displaying"
  prop(sort, :keyword, default: [])

  @doc "The list of items to be rendered. If item does not have id - than index is used instead. Able to work with streams"
  prop(items, :generator, required: true)

  @doc "Event that fires on row click"
  prop(row_click, :event)

  @doc "Callback for generating on_click per row. row and row_id will be given as parameters"
  prop(row_click_cb, :any)

  @doc "Sorting stuff"
  prop(sorting_click, :event)

  @doc "Can be used to add any class to the table"
  prop(row_gap, :css_class, default: "border-spacing-y-1")

  @doc "Size of the row. not a css class!"
  prop(row_size, :string, values!: ~w(xs sm md lg xl 2xl), default: "md")

  @doc "If cell has border"
  prop(is_cell_border, :boolean, default: false)

  @doc "If table has column headers or not"
  prop(is_headless, :boolean, default: false)

  @doc "If table is styled to present its rows in automatically alternating colours"
  prop(is_zebra_style, :boolean, default: false)

  @doc "Can be used as an additional class for all the rows"
  prop(row_bg, :css_class, default: "bg-goku")

  @doc "Can be used as an additional class for selected rows"
  prop(selected_bg, :css_class, default: "bg-beerus")

  @doc "Can be used as an additional class for header row"
  prop(header_row_class, :css_class)

  @doc "Can be used as an additional class for even rows in zebra-style table"
  prop(even_row_bg, :css_class, default: "bg-transparent")

  @doc "Can be used as an additional class for all rows. please use hover:... tailwind's format"
  prop(hover_bg, :css_class)

  @doc "The list of columns defining the Grid"
  slot(cols, generator_prop: :items)

  @doc "Just an id for a table tag"
  prop(id, :string)

  @doc "Data-testid attribute for a table tag"
  prop(testid, :string)

  @doc "Additional classes for a table tag"
  prop(class, :css_class)

  @doc "Additional attributes for tbody tag"
  prop(body_attrs, :map, default: %{})

  @doc "Icon for sorting"
  prop(sorting_icon, :string, default: "controls_chevron_up_small")

  @doc "Icon color for sorting"
  prop(sorting_icon_color, :string)

  def render(assigns) do
    import Moon.Light.Table.Helper

    ~F"""
    <table
      class={merge([
        [
          "text-sm border-spacing-x-0 border-beerus min-w-full bg-gohan rounded-moon-s-sm border-separate",
          @row_gap,
          "border-spacing-y-0": @is_zebra_style
        ],
        @class
      ])}
      {=@id}
      data-testid={@testid}
    >
      <thead :if={!@is_headless}>
        <tr class={@header_row_class}>
          {#for {col, col_index} <- Enum.with_index(@cols)}
            <th
              class={merge([
                "text-left font-medium whitespace-nowrap",
                text_size_classes(@row_size),
                [
                  "#{inter_cell_border()}": @is_cell_border && col_index < Enum.count(@cols) - 1,
                  "cursor-pointer": col[:sortable] && @sorting_click
                ],
                col[:width]
              ])}
              :on-click={(col[:sortable] && col[:name] && @sorting_click) || nil}
              :values={"sort-key": col[:name], "sort-dir": toggle_sort_dir(@sort[:"#{col[:name]}"])}
              data-testid={"sort-column-#{col[:name]}"}
            >
              {col[:label]}
              <Icon
                :if={col[:name] && col[:sortable]}
                class={
                  @sorting_icon_color,
                  "text-[1.5em] transition-transform transition-200",
                  "rotate-180": @sort[:"#{col[:name]}"] != "ASC",
                  "opacity-0": !@sort[:"#{col[:name]}"]
                }
                name={@sorting_icon}
              />
            </th>
          {/for}
        </tr>
      </thead>
      <tbody {...@body_attrs}>
        {#for {row_index, item} <- stream_data(assigns)}
          <tr
            class={merge([
              (is_selected_item(item, @selected) && @selected_bg) || @row_bg,
              @hover_bg,
              "#{@even_row_bg}":
                @is_zebra_style && !is_selected_item(item, @selected) && rem(row_index, 2) == 1,
              "cursor-pointer": @row_click
            ])}
            :on-click={(@row_click_cb && @row_click_cb.(item, row_index)) || @row_click}
            :values={selected: "#{item.id}", domid: dom_id(row_index, @id)}
            data-testid={"row-#{row_index}"}
            id={dom_id(row_index, @id)}
          >
            {#for {col, col_index} <- Enum.with_index(@cols)}
              <td
                class={merge([
                  "first:rounded-l-moon-s-sm last:rounded-r-moon-s-sm",
                  col[:width],
                  text_size_classes(@row_size),
                  ["#{inter_cell_border()}": @is_cell_border && col_index < Enum.count(@cols) - 1],
                  col[:class]
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
    """
  end

  @doc "Sorts items by sort given"
  def sort_items(items, sort) do
    Moon.Light.Table.Helper.sort_items(items, sort)
  end
end
