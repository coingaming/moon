defmodule Moon.Design.Breadcrumb do
  @moduledoc false

  use Moon.StatefulComponent

  alias Moon.Design.Breadcrumb.Collapsed
  alias Moon.Design.Breadcrumb.Extended

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
