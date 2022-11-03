defmodule Moon.Components.Breadcrumb do
  @moduledoc false

  use Moon.StatefulComponent

  alias Moon.Components.Breadcrumb.Collapsed
  alias Moon.Components.Breadcrumb.Extended

  prop(breadcrumbs, :list, default: [])
  prop(class, :string, default: nil)

  def render(assigns) do
    ~F"""
    <div class={@class}>
      {#if Enum.count(@breadcrumbs) > 4}
        <Collapsed id={"#{@id}_inner_breadcrumb"} breadcrumbs={@breadcrumbs} />
      {#else}
        <Extended breadcrumbs={@breadcrumbs} />
      {/if}
    </div>
    """
  end
end
