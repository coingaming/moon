defmodule Moon.Components.Carousel do
  use Moon.StatelessComponent

  def render(assigns) do
    ~H"""
    {{ asset_import @socket, "js/components/carousel" }}

    <div class="moon-carousel">
      <div class="carousel-inner">
        <slot />
      </div>
    </div>
    """
  end
end
