defmodule Moon.Parts.Chart.Field do
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

  @doc "Min value on a graph"
  prop(min, :integer, required: true)

  @doc "Max value on a graph"
  prop(max, :integer, required: true)

  @doc "HTML-grid-formatted inner content of the "
  slot(default)

  @spec render(map) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~F"""
    <div
      {=@id}
      class={merge([
        "relative col-start-2 row-start-1",
        @class
      ])}
      data-testid={@testid}
    >
      <#slot context_put={min: @min, max: @max}/>
    </div>
    """
  end
end
