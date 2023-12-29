defmodule Moon.Light do
  @moduledoc false
  use Moon.Light.Component

  alias Moon.Design.Button.Utils

  import Moon.Helpers.MergeClass

  attr(:click, :any, default: nil)
  attr(:class, :any, doc: "Additional classes for the <svg> tag", default: nil)

  attr(:name, :string,
    required: true,
    values: MoonIcons.Helpers.Icons.list_all() ++ []
  )

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

  slot(:cols, generator_prop: :items, doc: "The list of columns defining the Grid") do
    attr(:label, :string)
    attr(:name, :string)
    attr(:sortable, :boolean)
  end

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

  attr(:checked, :boolean, default: false)
  attr(:disabled, :boolean, default: false)
  attr(:size, :string, values: ["2xs", "xs", "sm"], default: "sm")
  attr(:on_bg_color, :any, default: "bg-piccolo")
  attr(:off_bg_color, :any, default: "bg-beerus")
  attr(:switcher_class, :any, default: nil)
  attr(:on_change, Event, default: nil)
  slot(:off_icon, [])
  slot(:on_icon, [])
  attr(:id, :string, default: nil)
  attr(:testid, :string, default: nil)
  attr(:class, :any, default: nil)

  def switch(assigns) do
    ~H"""
    <button
      id={@id}
      type="button"
      aria-pressed={"#{@checked}"}
      disabled={@disabled}
      class={
        merge([
          [
            "block rounded-full transition",
            (@checked && @on_bg_color) || @off_bg_color,
            "w-7 h-4 p-0.5": @size == "2xs",
            "w-11 h-6 p-1": @size == "xs",
            "w-[3.75rem] h-8 p-1": @size == "sm",
            "cursor-pointer": !@disabled,
            "opacity-60 cursor-not-allowed select-none": @disabled
          ],
          @class
        ])
      }
      value={"#{!@checked}"}
      data-testid={@testid}
      phx-click={Event.from(@on_change).name}
      phx-target={Event.from(@on_change).target}
    >
      <span class="block relative h-full w-full">
        <%= if has_slot?(@on_icon)  do %>
          <span
            class={
              merge([
                "z-1 absolute ltr:left-0 rtl:right-0 top-1/2 -translate-y-1/2 transition-opacity flex text-goten opacity-100",
                get_icon_size(@size),
                "opacity-0": !@checked
              ])
            }
            aria-hidden="true"
          >
            <%= render_slot(@on_icon) %>
          </span>
        <% end %>
        <%= if has_slot?(@off_icon)  do %>
          <span
            class={
              merge([
                "z-1 absolute ltr:right-0 rtl:left-0 top-1/2 -translate-y-1/2 transition-opacity flex text-bulma opacity-0",
                get_icon_size(@size),
                "opacity-100": !@checked
              ])
            }
            aria-hidden="true"
          >
            <%= render_slot(@off_icon) %>
          </span>
        <% end %>
        <span
          aria-hidden="true"
          class={
            merge([
              [
                "z-5 absolute top-1/2 -translate-y-1/2 translate-x-0 shadow-moon-sm pointer-events-none rounded-full",
                "bg-goten transition-all",
                "w-3 h-3 ltr:left-[calc(100%-12px)] rtl:right-[calc(100%-12px)]": @size == "2xs",
                "w-4 h-4 ltr:left-[calc(100%-16px)] rtl:right-[calc(100%-16px)]": @size == "xs",
                "w-6 h-6 ltr:left-[calc(100%-24px)] rtl:right-[calc(100%-24px)]": @size == "sm",
                "ltr:left-0 rtl:right-0": !@checked
              ],
              @switcher_class
            ])
          }
        />
      </span>
    </button>
    """
  end

  defp get_icon_size(size) do
    case size do
      "2xs" -> "text-moon-12 "
      "xs" -> "text-moon-16 "
      "sm" -> "text-moon-24 "
    end
  end

  attr(:variant, :string,
    values: ["fill", "outline", "ghost"],
    default: "fill",
    doc: "Visual/Logical variant of button"
  )

  attr(:size, :string,
    values: ["xs", "sm", "md", "lg", "xl"],
    default: "md",
    doc: "Size of button"
  )

  attr(:disabled, :boolean, doc: "Disabled button", default: nil)
  attr(:class, :any, doc: "Additional Tailwind classes", default: nil)
  attr(:type, :string, default: "button", doc: "Type attribute for DOM element")
  attr(:on_click, Event, doc: "On click event", default: nil)

  attr(:values, :any,
    default: [],
    doc: "list of additional values to associate with the DOM element"
  )

  attr(:value, :string, doc: "Value attribute for DOM element", default: nil)
  attr(:id, :string, doc: "Id attribute for DOM element", default: nil)
  attr(:testid, :string, doc: "Data-testid attribute for DOM element", default: nil)
  attr(:attrs, :any, default: [], doc: "Additional attributes for DOM element")
  attr(:aria_label, :string, doc: "Aria label attribute for DOM element", default: nil)
  attr(:target, :string, doc: "Target attribute for DOM element", default: nil)
  attr(:rel, :string, doc: "Rel attribute for DOM element", default: nil)
  attr(:animation, :string, values: ~w(progress success error pulse) ++ [nil], default: nil)
  slot(:inner_block, doc: "Inner content of the component")

  def button(assigns) do
    ~H"""
    <button
      id={@id}
      class={
        merge([
          [
            "flex row justify-center items-center relative overflow-hidden active:scale-90 transition-all duration-200 font-semibold group z-0",
            "whitespace-nowrap select-none",
            Utils.get_button_size_classes(@size),
            Utils.variant_classes(assigns),
            Utils.get_no_icon_padding(@size)
          ],
          @class
        ])
      }
      phx-click={@on_click && @on_click.name}
      phx-target={@on_click && @on_click.target}
      testid={@testid}
      aria_label={@aria_label}
      values={@values}
      value={@value}
      target={@target}
      rel={@rel}
      data-size={@size}
      type={@type}
      {@attrs}
    >
      <.loader
        :if={@animation == "progress"}
        color={if @variant in ["primary", "fill", "tertiary"], do: "gohan", else: "trunks"}
        size={if @size == "xs", do: "2xs", else: "xs"}
      />
      <.icon
        :if={@animation == "success"}
        name="generic_check_alternative"
        color="currentColor"
        class={Utils.icon_class(@size)}
      />
      <%= if !(@animation in ~w(progress success)) do %>
        <%= render_slot(@inner_block) %>
      <% end %>
      <span class={merge(Utils.hover_overlay_classes(assigns))} />
    </button>
    """
  end

  attr(:size, :string, values: ["2xs", "xs", "md", "lg"], default: "md")
  attr(:color, :string, default: "hit", values: Moon.colors())
  attr(:class, :any, default: nil)
  attr(:testid, :string, default: nil)
  attr(:id, :string, default: nil)

  def loader(assigns) do
    ~H"""
    <div
      id={@id}
      class={
        merge([
          "relative",
          "w-4 h-4": @size == "2xs",
          "w-6 h-6": @size in ~w(xs sm),
          "w-10 h-10": @size == "md",
          "w-12 h-12": @size == "xl"
        ])
      }
      data-testid={@testid}
    >
      <%= for cls <- [""] ++ ~w(animation-delay-minus-45 animation-delay-minus-30 animation-delay-minus-15) do %>
        <div class={
          merge([
            "box-border block absolute w-full h-full border-solid rounded-[50%]",
            "border-t-#{@color} border-r-transparent border-b-transparent border-l-transparent",
            "animate-loader",
            cls,
            (@size in ~w(2xs xs) && "border-2") || "border-4",
            "border-#{@color}",
            @class
          ])
        } />
      <% end %>
    </div>
    """
  end
end
