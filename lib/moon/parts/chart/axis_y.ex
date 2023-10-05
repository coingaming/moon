defmodule Moon.Parts.Chart.AxisY do
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

  @doc "Axis label"
  slot(default)

  def render(assigns) do
    ~F"""
    <div
      {=@id}
      data-testid={@testid}
      class={merge([
        "flex min-w-8 content-around col-start-1 row-start-1 flex-col-reverse",
        @class
      ])}
    >
      <span :for={label <- @labels}>{label}</span>
    </div>
    """
  end
end
