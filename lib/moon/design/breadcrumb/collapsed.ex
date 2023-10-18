defmodule Moon.Design.Breadcrumb.Collapsed do
  @moduledoc false

  use Moon.StatefulComponent

  alias Moon.Icon

  alias Moon.Design.Breadcrumb.Item
  alias Moon.Design.Breadcrumb.CollapsedItems

  @doc "List of crumbs to display - Moon.Design.Breadcrumb.Crumb"
  prop(breadcrumbs, :list)
  @doc "Name of custom icon used as a divider between breadcrumb items"
  prop(divider, :string, default: "arrows_right")
  @doc "Name of custom icon used as a collapsed icon"
  prop(collapsed_icon, :string)

  @doc "Screen size, where breadcrumb items with multiple words are partially replaced with ellipsis (...)"
  prop(responsive_crumbs_on, :string, values: ~w(sm md lg xl 2xl))
  @doc "Additional Tailwind classes"
  prop(divider_class, :css_class)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Additional Tailwind classes"
  prop(collapsed_class, :css_class)
  @doc "Additional Tailwind classes"
  prop(collapsed_item_class, :css_class)
  @doc "Visual/Logical variant of collapsed icon button"
  prop(variant, :string,
    values: ["fill", "outline", "ghost"],
    default: "ghost"
  )

  @doc "Size of collapsed icon button"
  prop(size, :string, values: ["xs", "sm", "md", "lg", "xl"], default: "xs")
  @doc "List of shown crumbs - Moon.Design.Breadcrumb.Crumb"
  data(shown_breadcrumbs, :list, default: [])
  @doc "List of collapsed crumbs - Moon.Design.Breadcrumb.Crumb"
  data(collapsed_breadcrumbs, :list, default: [])

  @doc "Items slot"
  slot(item)
  @doc "Collapsed items slot, e.g. dropdown"
  slot(collapsed_items)

  def update(assigns, socket) do
    count = Enum.count(assigns.breadcrumbs)
    first_crumb = Enum.at(assigns.breadcrumbs, 0)
    tail_breadcrumbs = Enum.take(assigns.breadcrumbs, -2)

    shown_breadcrumbs = Enum.concat([first_crumb], tail_breadcrumbs)
    collapsed_breadcrumbs = Enum.slice(assigns.breadcrumbs, 1..(count - 3))

    socket =
      socket
      |> assign(assigns)
      |> assign(
        :shown_breadcrumbs,
        shown_breadcrumbs
      )
      |> assign(
        :collapsed_breadcrumbs,
        collapsed_breadcrumbs
      )

    {:ok, socket}
  end

  def render(assigns) do
    ~F"""
    <nav aria-label="Breadcrumb">
      <ol class="flex flex-wrap items-center">
        {#for {crumb, index} <- Enum.with_index(@shown_breadcrumbs)}
          <#slot
            {@item, crumb: crumb, index: index}
            context_put={
              value: index,
              responsive_crumbs_on: @responsive_crumbs_on,
              title: crumb.name,
              href: crumb.link,
              divider: @divider,
              divider_class: @divider_class
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
          {#if index == 0}
            <Icon
              name={@divider}
              class={merge(["rtl:rotate-180 mx-2 text-moon-14 text-trunks", @divider_class])}
            />

            <#slot
              {@collapsed_items}
              context_put={
                collapsed_breadcrumbs: @collapsed_breadcrumbs
              }
            >
              <CollapsedItems {=@id} {=@collapsed_breadcrumbs} {=@collapsed_icon} />
            </#slot>
          {/if}
        {/for}
      </ol>
    </nav>
    """
  end
end
