defmodule Moon.Parts.Chart.AxisX do
  @moduledoc false

  use Moon.StatelessComponent

  @doc "Just an id for a table tag"
  prop(id, :string)

  @doc "Data-testid attribute for a table tag"
  prop(testid, :string)

  @doc "Additional classes for a table tag"
  prop(class, :css_class)

  @doc "Labels for axis"
  prop(labels, :list, default: [])

  @doc "Label for the axis"
  slot(default)

  def render(assigns) do
    ~F"""
    <div
      data-testid={@testid}
      {=@id}
      class={merge(["flex min-h-8 justify-around col-start-2 row-start-2 flex-row", @class])}
    >
      <span :for={label <- @labels}>{label}</span>
    </div>
    """
  end
end
