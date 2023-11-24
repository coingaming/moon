defmodule Moon.Design.Breadcrumb.Item.Divider do
  @moduledoc false

  use Moon.StatelessComponent, slot: "divider_slot"

  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Index of the item in the list of breadcrumbs"
  prop(value, :integer, from_context: :value)
  @doc "Default slot"
  slot(default)

  def render(assigns) do
    ~F"""
    <div :if={@value} {=@class} {=@id} data-testid={@testid}><#slot /></div>
    """
  end
end
