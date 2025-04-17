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
  @doc "Uses a custom column name instead of a column index for the data-testid attribute in a <td> within the <tbody> tag."
  prop(tb_custom_testid_prefix, :string)
end
