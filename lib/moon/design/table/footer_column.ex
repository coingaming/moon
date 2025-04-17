defmodule Moon.Design.Table.FooterColumn do
  @moduledoc false

  use Moon.StatelessComponent, slot: "footer_cols"

  @doc "Can be used for adding any class to both th & td tags"
  prop(width, :css_class)
  @doc "Simple additional css class, will be added to td tag only"
  prop(class, :css_class)
  @doc "it makes a cell span over multiple columns"
  prop(colspan, :integer, default: 1)

  @doc "Set custom data-testid in a <td> attribute within the <tfoot> tag. recieves row_id and column map
   Example: fn row_id, col -> {col.label}-row-\#{row_id}\" end"
  prop(data_testid, :fun, default: nil)
end
