defmodule Moon.Components.Reel do
  use Moon.StatelessComponent

  prop(class, :string)
  slot(default)

  def render(assigns) do
    ~H"""
    {{ asset_import @socket, "js/components/carousel" }}

    <div class="moon-carousel {{ @class }}">
      <div class="carousel-inner">
        <slot />
      </div>
    </div>
    """
  end
end
