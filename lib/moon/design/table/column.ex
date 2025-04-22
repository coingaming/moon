defmodule Moon.Design.Table.Column do
  @moduledoc false

  use Moon.StatelessComponent, slot: "cols"

  @doc "Is used for sorting"
  prop(name, :string)
  @doc "The title of the column"
  prop(label, :string)
  @doc "The is the column sortable"
  prop(sortable, :boolean, default: false)
  @doc "Can be used for adding any class to both th & td tags"
  prop(width, :css_class)
  @doc "Simple additional css class, will be added to td tag only"
  prop(class, :css_class)

  @doc "Set custom data-testid in a <td> attribute within the <tbody> tag. recieves row_id and column map
   Example: fn row_id, col -> {col.label}-row-\#{row_id}\" end"
  prop(testid, :fun, default: nil)
end
