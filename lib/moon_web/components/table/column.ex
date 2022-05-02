defmodule MoonWeb.Components.Table.Column do
  use Surface.Component, slot: "cols"

  @doc "The title of the column"
  prop name, :string, required: true
  prop label, :string
  prop is_row_header, :boolean, default: false
end
