defmodule Moon.Design.Breadcrumb do
  @moduledoc false

  use Moon.StatefulComponent

  alias Moon.Design.Breadcrumb

  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "List of crumbs to display - Moon.Design.Breadcrumb.Crumb"
  prop(breadcrumbs, :list, default: [])
  @doc "Number of visible crumbs. Additional ones collapse for a streamlined view"
  prop(collapsible_crumbs, :integer, default: 4)
  @doc "Name of custom icon used as a divider between breadcrumb items"
  prop(divider, :string, default: "arrows_right")
  @doc "Name of custom icon used as a collapsed icon"
  prop(icon, :string)

  @doc "Screen size, where breadcrumb items with multiple words are partially replaced with ellipsis (...)"
  prop(responsive_crumbs_on, :string, values: ~w(sm md lg xl 2xl))
  @doc "Additional Tailwind classes"
  prop(list_item_class, :css_class)
  @doc "Additional Tailwind classes"
  prop(divider_class, :css_class)

  @doc "Items slot"
  slot(item)

  def render(assigns) do
    ~F"""
    <div class={@class} data-testid={@testid}>
      {#if Enum.count(@breadcrumbs) > @collapsible_crumbs}
        <Breadcrumb.Collapsed
          id={"#{@id}_inner_breadcrumb"}
          breadcrumbs={@breadcrumbs}
          {=@divider}
          {=@icon}
          {=@responsive_crumbs_on}
          class={@list_item_class}
          {=@divider_class}
        >
          <:item :let={crumb: crumb, index: index}>
            <#slot
              {@item, crumb: crumb, index: index}
              context_put={
                value: index,
                responsive_crumbs_on: @responsive_crumbs_on,
                title: crumb.name,
                href: crumb.link,
                divider: @divider,
                divider_class: @divider_class,
                icon: crumb.icon
              }
            >
              <Breadcrumb.Item
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
          </:item>
        </Breadcrumb.Collapsed>
      {#else}
        <Breadcrumb.Extended
          breadcrumbs={@breadcrumbs}
          {=@divider}
          {=@responsive_crumbs_on}
          class={@list_item_class}
          {=@divider_class}
        >
          <:item :let={crumb: crumb, index: index}>
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
              <Breadcrumb.Item
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
          </:item>
        </Breadcrumb.Extended>
      {/if}
    </div>
    """
  end
end
