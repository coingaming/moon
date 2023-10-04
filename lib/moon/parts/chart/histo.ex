defmodule Moon.Parts.Chart.Histo do
  @moduledoc false

  use Moon.StatelessComponent

  @doc "Just an id for a table tag"
  prop(id, :string)

  @doc "Data-testid attribute for a table tag"
  prop(testid, :string)

  @doc "Additional classes for a table tag"
  prop(class, :css_class)

  @doc "Line - lists of integer values to be shown"
  prop(data, :list, default: [])

  @doc "Min value on a graph"
  prop(min, :integer, from_context: :min)

  @doc "Max value on a graph"
  prop(max, :integer, from_context: :max)

  @doc "Line color and other css props"
  prop(color, :css_class)

  def render(assigns) do
    ~F"""
    <div
      {=@id}
      class={merge([
        "flex justify-around items-end absolute inset-0",
        @class
      ])}
      data-testid={@testid}
    >
      <div
        :for={height <- @data}
        class={merge(["w-4 bg-krillin rounded-t-full", @color])}
        style={"height: #{(height - @min) * 100.0 / (@max - @min)}%"}
      > </div>
    </div>
    """
  end
end
