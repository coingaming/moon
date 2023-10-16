defmodule Moon.Design.Breadcrumb.FirstItem do
  @moduledoc false

  use Moon.StatelessComponent, slot: "first_item"

  alias Moon.Design.Breadcrumb.Item

  @doc "Screen size, where breadcrumb items with multiple words are partially replaced with ellipsis (...)"
  prop(responsive_crumbs_on, :string, values: ~w(sm md lg xl 2xl))
  @doc "Index of the item in the list of breadcrumbs"
  prop(value, :integer, from_context: :value)
  @doc "Link to the crumb"
  prop(href, :string, from_context: :href)
  @doc "Title of the crumb"
  prop(title, :any, from_context: :title)
  @doc "Icon of the crumb"
  prop(icon, :any, from_context: :icon)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Default slot"
  slot(default)

  def render(assigns) do
    ~F"""
    <Item {=@responsive_crumbs_on} {=@value} {=@href} {=@title} {=@icon} {=@class} />
    <#slot />
    """
  end
end
