defmodule Moon.Design.Breadcrumb.Extended do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Design.Breadcrumb.Item

  prop(breadcrumbs, :list)
  prop(divider, :string)
  prop(responsive_crumbs_on, :string, values: ~w(sm md lg xl 2xl))
  prop(divider_class, :css_class)
  prop(class, :css_class)

  slot(item)

  def render(assigns) do
    ~F"""
    <nav aria-label="Breadcrumb">
      <ol class="flex flex-wrap items-center">
        {#for {crumb, index} <- Enum.with_index(@breadcrumbs)}
          <#slot
            {@item, crumb: crumb}
            context_put={
              value: index,
              responsive_crumbs_on: @responsive_crumbs_on,
              title: crumb.name
            }
          >
            <Item
              {=@breadcrumbs}
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
