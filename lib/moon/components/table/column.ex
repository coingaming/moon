defmodule Moon.Components.Table.Column do
  @moduledoc false

  use Surface.Component, slot: "cols"

  @doc "The title of the column"
  prop(name, :string)
  prop(label, :string)
  prop(sortable, :boolean, default: false)
  prop(width, :css_class, default: "min-w-[200px]")

  @doc "Set custom data-testid in a <td> attribute within the <tbody> tag. recieves row_id and column map
   Example: fn row_id, col -> {col.label}-row-\#{row_id}\" end"
  prop(testid, :fun, default: nil)
end
