defmodule Moon.Design.Breadcrumb.ShownItems do
  @moduledoc false

  use Moon.StatelessComponent, slot: "shown_items"

  alias Moon.Design.Breadcrumb.Item
  alias Moon.Icon

  @doc "Screen size, where breadcrumb items with multiple words are partially replaced with ellipsis (...)"
  prop(responsive_crumbs_on, :string, from_context: :responsive_crumbs_on)
  @doc "Additional Tailwind classes"
  prop(divider_class, :css_class, from_context: :divider_class)
  @doc "Additional Tailwind classes"
  prop(class, :css_class, from_context: :class)
  @doc "Name of custom icon used as a divider between breadcrumb items"
  prop(divider, :string, from_context: :divider)
  @doc "Index of the item in the list of breadcrumbs"
  prop(value, :integer, from_context: :value)
  @doc "Link to the crumb"
  prop(href, :string, from_context: :href)
  @doc "Title of the crumb"
  prop(title, :string, from_context: :title)
  @doc "Icon of the crumb"
  prop(icon, :string, from_context: :icon)

  @doc "Divider slot"
  slot(default)

  def render(assigns) do
    ~F"""
    <Item
      :if={@value > 0}
      {=@responsive_crumbs_on}
      {=@href}
      {=@title}
      {=@icon}
      {=@class}
      {=@divider}
      {=@divider_class}
    >
    </Item>
    """
  end
end
