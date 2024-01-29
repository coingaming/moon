defmodule Moon.Parts.Table do
  @moduledoc false

  use Moon.StatelessComponent

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
  prop(row_size, :string, values!: ~w(xs sm md lg xl 2xl), default: "xl")

  @doc "If cell has border"
  prop(is_cell_border, :boolean, default: false)

  @doc "If table has column headers or not"
  prop(is_headless, :boolean, default: false)

  @doc "If table is styled to present its rows in automatically alternating colours"
  prop(is_zebra_style, :boolean, default: false)

  @doc "Can be used as an additional class for all the rows"
  prop(row_bg, :css_class, default: "bg-goku")

  @doc "Can be used as an additional class for selected rows"
  prop(selected_bg, :css_class, default: "bg-heles")

  @doc "Can be used as an additional class for header row"
  prop(header_row_class, :css_class,
    default: "text-left first:rounded-l-moon-s-none last:rounded-r-moon-s-none"
  )

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
  prop(class, :css_class, default: "bg-goku !border-collapse pb-4 rounded-moon-s-lg")

  @doc "Additional attributes for tbody tag"
  prop(body_attrs, :map, default: %{})

  @doc "Icon for sorting"
  prop(sorting_icon, :string, default: "controls_chevron_up_small")

  @doc "Icon color for sorting"
  prop(sorting_icon_color, :string, default: "text-bulma")

  defdelegate render(assigns), to: Moon.Design.Table
end
