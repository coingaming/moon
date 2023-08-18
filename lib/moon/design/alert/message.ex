defmodule Moon.Design.Alert.Message do
  @moduledoc false

  use Moon.StatelessComponent, slot: "message"

  @doc "Tailwind classes for customization"
  prop(class, :css_class)
  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Message of Alert item"
  slot(default)

  def render(assigns) do
    ~F"""
    <p {=@id} class={merge(["flex gap-3", @class])} data-testid={@testid}>
      <#slot />
    </p>
    """
  end
end
