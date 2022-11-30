defmodule Moon.Components.Table.Column do
  @moduledoc false

  use Surface.Component, slot: "cols"

  @doc "The title of the column"
  prop(name, :string)
  prop(label, :string)
  prop(sortable, :boolean, default: true)
  prop(width, :css_class, default: "min-w-[200px]")
end
