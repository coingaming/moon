defmodule Moon.Parts.Table.Input do
  @moduledoc "Input styled to use inside the tables"

  use Moon.StatelessComponent

  @doc "Data-testid attribute for html tag"
  prop(testid, :string)
  @doc "Id attribute for html tag"
  prop(id, :string)
  @doc "Additional CSS classes for the html tag"
  prop(class, :css_class)

  @doc "Text to be shown when no value given"
  prop(placeholder, :string)
  @doc "Value to be shown"
  prop(value, :string)
  @doc "If the item should be marked as disabled"
  prop(disabled, :boolean)
  @doc "Additional values to be passed"
  prop(side_values, :any, default: %{})

  @doc "Keyword | Map of additional attributes for the input"
  prop(opts, :any, default: %{})

  @doc "On change event for the input"
  prop(on_change, :event)
  @doc "On keyup event for the input"
  prop(on_keyup, :event)
  @doc "On focus event for the input"
  prop(on_focus, :event)
  @doc "On blur event for the input"
  prop(on_blur, :event)

  defdelegate render(assigns), to: Moon.Design.Table.Input
end
