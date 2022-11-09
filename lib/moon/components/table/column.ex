defmodule Moon.Components.Table.Column do
  use Surface.Component, slot: "cols"

  @doc "The title of the column"
  prop(name, :string, required: true)
  prop(label, :string)
  prop(sortable, :boolean, default: true)
end
