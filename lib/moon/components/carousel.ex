defmodule Moon.Components.Carousel do
  use Moon.StatelessComponent

  prop(class, :string)
  slot(default)

  def render(assigns) do
    ~F"""
    {asset_import(@socket, "js/components/carousel")}

    <div class={"overflow-hidden overflow-x-scroll scroll-snap-x-mandatory w-full #{@class}"}>
      <div class="w-auto whitespace-nowrap">
        <#slot />
      </div>
    </div>
    """
  end
end
