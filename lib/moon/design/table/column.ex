defmodule Moon.Design.Table.Column do
  @moduledoc false

  use Moon.StatelessComponent, slot: "cols"

  @doc "The title of the column"
  prop(name, :string)
  prop(label, :string)
  prop(sortable, :boolean, default: true)
  prop(width, :css_class)
end
