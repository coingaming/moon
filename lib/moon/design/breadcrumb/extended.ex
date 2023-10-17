defmodule Moon.Design.Breadcrumb.Extended do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Design.Breadcrumb.Item

  @doc "List of crumbs to display - Moon.Design.Breadcrumb.Crumb"
  prop(breadcrumbs, :list)
  @doc "Name of custom icon used as a divider between breadcrumb items"
  prop(divider, :string)

  @doc "Screen size, where breadcrumb items with multiple words are partially replaced with ellipsis (...)"
  prop(responsive_crumbs_on, :string, values: ~w(sm md lg xl 2xl))
  @doc "Additional Tailwind classes"
  prop(divider_class, :css_class)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Item slot"
  slot(item)

  def render(assigns) do
    ~F"""
    <nav aria-label="Breadcrumb">
      <ol class="flex flex-wrap items-center">
        {#for {crumb, index} <- Enum.with_index(@breadcrumbs)}
          <#slot
            {@item, crumb: crumb, index: index}
            context_put={
              value: index,
              responsive_crumbs_on: @responsive_crumbs_on,
              title: crumb.name,
              href: crumb.link
            }
          >
            <Item
              {=@divider}
              {=@responsive_crumbs_on}
              {=@divider_class}
              {=@class}
              value={index}
              href={crumb.link}
              title={crumb.name}
              icon={Map.get(crumb, :icon)}
            />
          </#slot>
        {/for}
      </ol>
    </nav>
    """
  end
end
