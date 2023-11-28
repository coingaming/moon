defmodule Moon.Lego.Title do
  @moduledoc false

  use Moon.StatelessComponent

  @doc "Title of the menu item"
  prop(title, :string)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Id attribute for the DOM element"
  prop(id, :string)
  @doc "Default slot"
  slot(default)

  def render(assigns) do
    ~F"""
    <span
      {=@id}
      data-testid={@testid}
      class={merge(["block grow text-start text-bulma overflow-hidden", @class])}
    >
      <#slot>{@title}</#slot>
    </span>
    """
  end
end
