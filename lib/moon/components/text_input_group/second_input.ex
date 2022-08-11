defmodule Moon.Components.TextInputGroup.SecondInput do
  use Surface.Component, slot: "cols"

  @doc "The title of the column"
  prop name, :string, required: true
  prop label, :string
end
