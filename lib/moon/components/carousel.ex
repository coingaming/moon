defmodule Moon.Components.Carousel do
  @moduledoc false

  use Moon.StatelessComponent

  prop(class, :string)
  slot(default)

  def render(assigns) do
    ~F"""
    <div class={"overflow-hidden overflow-x-scroll scroll-snap-x-mandatory w-full #{@class}"}>
      <div class="w-auto whitespace-nowrap">
        <#slot />
      </div>
    </div>
    """
  end
end
