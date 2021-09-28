defmodule Moon.Components.Reel do
  @moduledoc false

  use Moon.StatelessComponent

  prop(class, :string)
  slot(default)

  def render(assigns) do
    ~F"""
    <div class={"moon-carousel #{@class}"}>
      <div class="carousel-inner">
        <#slot />
      </div>
    </div>
    """
  end
end
