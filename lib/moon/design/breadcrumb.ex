defmodule Moon.Design.Breadcrumb do
  @moduledoc false

  use Moon.StatefulComponent

  alias Moon.Design.Breadcrumb.Collapsed
  alias Moon.Design.Breadcrumb.Extended

  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "List of crumbs to display - Moon.Design.Breadcrumb.Crumb"
  prop(breadcrumbs, :list, default: [])
  @doc "Number of visible crumbs. Additional ones collapse for a streamlined view"
  prop(collapsible_crumbs, :integer, default: 4)
  @doc "Name of custom icon used as a divider between breadcrumb items"
  prop(divider, :string)
  @doc "Name of custom icon used to expand collapsed breadcrumb items"
  prop(collapsed_icon, :string)

  @doc "Screen size, where breadcrumb items with multiple words are partially replaced with ellipsis (...)"
  prop(responsive_crumbs_on, :string, values: ~w(sm md lg xl 2xl))

  def render(assigns) do
    ~F"""
    <div class={@class} data-testid={@testid}>
      {#if Enum.count(@breadcrumbs) > @collapsible_crumbs}
        <Collapsed
          id={"#{@id}_inner_breadcrumb"}
          breadcrumbs={@breadcrumbs}
          {=@divider}
          {=@collapsed_icon}
          {=@responsive_crumbs_on}
        />
      {#else}
        <Extended breadcrumbs={@breadcrumbs} {=@divider} {=@responsive_crumbs_on} />
      {/if}
    </div>
    """
  end
end
