defmodule Moon.Parts.Chart.Corner do
  @moduledoc false

  use Moon.StatelessComponent

  @doc "Just an id for a table tag"
  prop(id, :string)

  @doc "Data-testid attribute for a table tag"
  prop(testid, :string)

  @doc "Additional classes for a table tag"
  prop(class, :css_class)

  @doc "Inner content of the corner"
  slot(default)

  def render(assigns) do
    ~F"""
    <div
      {=@id}
      class={merge([
        "min-w-8 min-h-8 col-start-1 row-start-2",
        @class
      ])}
      data-testid={@testid}
    >
      <#slot> </#slot>
    </div>
    """
  end
end
