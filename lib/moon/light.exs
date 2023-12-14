defmodule Moon.Light do
  @moduledoc false
  use Moon.Light.Component
  alias Moon.Icon
  attr(:click, :any, default: nil)
  attr(:class, :any, doc: "Additional classes for the <svg> tag", default: nil)
  attr(:name, :string, required: true, values: MoonIcons.Helpers.Icons.list_all())
  attr(:color, :string, values: Moon.colors() ++ [nil], default: nil)
  attr(:background_color, :string, values: Moon.colors() ++ [nil], default: nil)
  attr(:font_size, :string, default: nil)
  attr(:id, :string, doc: "Id HTML attribute", default: nil)
  attr(:testid, :string, doc: "Data-testid attribute value", default: nil)

  def icon(assigns) do
    ~H"""
    <svg
      id={@id}
      data-testid={@testid}
      class={
        merge([
          "moon-icon fill-none",
          [
            {:"text-#{@color}", @color},
            {:"bg-#{@background_color}", @background_color},
            {:"text-#{@font_size}", @font_size},
            "cursor-pointer": @click
          ],
          @class
        ])
      }
      phx-on-click={@click}
      style={get_style(color: @color, background_color: @background_color, font_size: @font_size)}
    >
      <use href={"/moon_icons/svgs/icons_new/#{@name |> to_string() |> String.replace("_", "-")}.svg#item"} />
    </svg>
    """
  end

  attr(:selected, :any, default: [], doc: "List of  selected ids, or just id, or [], or nil")

  attr(:sort, :any,
    default: [],
    doc:
      "Sorting of the table, format [field:, \"ASC\"|\"DESC\"]. If given, component will sort given items before displaying"
  )

  attr(:items, :any,
    required: true,
    doc:
      "The list of items to be rendered. If item does not have id - than index is used instead. Able to work with streams"
  )

  attr(:row_click, Event, doc: "Event that firset on row click", default: nil)

  attr(:row_click_cb, :any,
    doc: "Callback for generating on_click per row. row and row_id will bi given as parameters",
    default: nil
  )

  attr(:sorting_click, Event, doc: "Sorting stuff", default: nil)

  attr(:row_gap, :any,
    default: "border-spacing-y-1",
    doc: "Can be used to add any class to the table"
  )

  attr(:row_size, :string,
    values: ~w(xs sm md lg xl 2xl),
    default: "md",
    doc: "Size of the row. not a css class!"
  )

  attr(:is_cell_border, :boolean, default: false, doc: "If cell has border")
  attr(:is_headless, :boolean, default: false, doc: "If table has column headers or not")

  attr(:is_zebra_style, :boolean,
    default: false,
    doc: "If table is styled to present its rows in automatically alternating colours"
  )

  attr(:row_bg, :any,
    default: "bg-goku",
    doc: "Can be used as an additional class for all the rows"
  )

  attr(:selected_bg, :any,
    default: "bg-beerus",
    doc: "Can be used as an additional class for selected rows"
  )

  attr(:header_row_class, :any,
    doc: "Can be used as an additional class for header row",
    default: nil
  )

  attr(:even_row_bg, :any,
    default: "bg-transparent",
    doc: "Can be used as an additional class for even rows in zebra-style table"
  )

  attr(:hover_bg, :any,
    doc:
      "Can be used as an additional class for all rows. please use hover:... tailwind's format",
    default: nil
  )

  slot(:cols, generator_prop: :items, doc: "The list of columns defining the Grid")
  attr(:id, :string, doc: "Just an id for a table tag", default: nil)
  attr(:testid, :string, doc: "Data-testid attribute for a table tag", default: nil)
  attr(:class, :any, doc: "Additional classes for a table tag", default: nil)
  attr(:body_attrs, :map, default: %{}, doc: "Additional attributes for tbody tag")

  def table(assigns) do
    import Moon.Light.Table.Helper

    ~H"""
    <table
      class={
        merge([
          [
            "text-sm border-spacing-x-0 border-beerus min-w-full bg-gohan rounded-moon-s-sm border-separate",
            @row_gap,
            "border-spacing-y-0": @is_zebra_style
          ],
          @class
        ])
      }
      id={@id}
      data-testid={@testid}
    >
      <thead :if={!@is_headless}>
        <tr class={@header_row_class}>
          <%= for {col, col_index} <- Enum.with_index(@cols)  do %>
            <th
              class={
                merge([
                  "text-left font-medium whitespace-nowrap",
                  text_size_classes(@row_size),
                  [
                    {:"#{inter_cell_border()}", @is_cell_border && col_index < Enum.count(@cols) - 1},
                    "cursor-pointer": col[:sortable] && @sorting_click
                  ],
                  col[:width]
                ])
              }
              phx-click={col[:sortable] && col[:name] && @sorting_click && @sorting_click.name}
              phx-target={col[:sortable] && col[:name] && @sorting_click && @sorting_click.target}
              {data_values(["sort-key": col[:name], "sort-dir": toggle_sort_dir(@sort[:"#{col[:name]}"])])}
              data-testid={"sort-column-#{col[:name]}"}
            >
              <%= col[:label] %>
              <.icon
                :if={col[:name] && col[:sortable]}
                class={[
                  "text-[1.5em] transition-transform transition-200",
                  "rotate-180": @sort[:"#{col[:name]}"] != "ASC",
                  "opacity-0": !@sort[:"#{col[:name]}"]
                ]}
                name="arrows_up"
              />
            </th>
          <% end %>
        </tr>
      </thead>
      <tbody {@body_attrs}>
        <%= for {row_index, item} <- stream_data(assigns)  do %>
          <tr
            class={
              merge([
                (is_selected_item(item, @selected) && @selected_bg) || @row_bg,
                @hover_bg,
                {:"#{@even_row_bg}",
                 @is_zebra_style && !is_selected_item(item, @selected) && rem(row_index, 2) == 1},
                "cursor-pointer": @row_click
              ])
            }
            phx-click={@row_click && @row_click.name}
            phx-target={@row_click && @row_click.target}
            {data_values([selected: "#{item.id}", domid: dom_id(row_index, @id)])}
            data-testid={"row-#{row_index}"}
            id={dom_id(row_index, @id)}
          >
            <%= for {col, col_index} <- Enum.with_index(@cols)  do %>
              <td
                class={
                  merge([
                    "first:rounded-l-moon-s-sm last:rounded-r-moon-s-sm",
                    col[:width],
                    text_size_classes(@row_size),
                    [
                      {:"#{inter_cell_border()}",
                       @is_cell_border && col_index < Enum.count(@cols) - 1}
                    ],
                    col[:class]
                  ])
                }
                data-testid={"row-#{row_index}-col-#{col_index}"}
              >
                <%= render_slot(col, item) %>
              </td>
            <% end %>
          </tr>
        <% end %>
      </tbody>
    </table>
    """
  end

  def sort_items(items, sort) do
    Moon.Light.Table.Helper.sort_items(items, sort)
  end
end
