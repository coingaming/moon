defmodule Moon.Design.Alert.Title do
  @moduledoc false

  use Moon.StatelessComponent, slot: "title"

  @doc "Tailwind classes for customization"
  prop(class, :css_class)
  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Title of Alert item"
  slot(default)

  def render(assigns) do
    ~F"""
    <h6 {=@id} class={merge(["flex gap-3 font-medium", @class])} data-testid={@testid}>
      <#slot />
    </h6>
    """
  end
end
