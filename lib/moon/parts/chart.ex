defmodule Moon.Parts.Chart do
  @moduledoc false

  use Moon.StatelessComponent

  @doc "Just an id for a table tag"
  prop(id, :string)

  @doc "Data-testid attribute for a table tag"
  prop(testid, :string)

  @doc "Additional classes for a table tag"
  prop(class, :css_class)

  # @doc "Labels for x-axis"
  # prop(labels, :list, default: [])

  # @doc "List of lines - lists of values to be shown"
  # prop(data, :list, default: [])

  @doc "HTML-grid-formatted inner content of the chart - axis, field, etc."
  slot(default)

  def render(assigns) do
    ~F"""
    <div
      {=@id}
      class={merge([
        "w-full",
        "grid gap-4 place-items-stretch",
        "grid-cols-[auto_1fr]",
        "grid-rows-[1fr_auto]",
        @class
      ])}
      data-testid={@testid}
    >
      <#slot />
    </div>
    """
  end
end
