defmodule Moon.Design.Table.Column do
  @moduledoc false

  use Moon.StatelessComponent, slot: "cols"

  @doc "The used for sorting"
  prop(name, :string)
  @doc "The title of the column"
  prop(label, :string)
  @doc "The is the column sortable"
  prop(sortable, :boolean, default: false)
  @doc "Can be used for adding any class to column"
  prop(width, :css_class)
  prop(class, :css_class)
end
