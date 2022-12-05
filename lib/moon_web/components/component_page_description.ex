defmodule MoonWeb.Components.ComponentPageDescription do
  @moduledoc false

  use MoonWeb, :stateless_component

  prop(title, :string)
  prop(image, :string)
  slot(default)

  def render(assigns) do
    ~F"""
    <div class="flex flex-col lg:flex-row gap-4">
      <div class="flex flex-col gap-12 lg:basis-1/2">
        <div class="flex flex-col gap-2">
          <h1 class="text-moon-32 font-medium">{@title}</h1>
        </div>
        <div class="flex flex-col items-start gap-2 text-moon-16">
          <#slot />
        </div>
      </div>
      <div
        :if={@image}
        class="flex lg:basis-1/2 items-center justify-center h-80 rounded-moon-s-md overflow-hidden"
      >
        <img src={@image} alt={@title}>
      </div>
    </div>
    """
  end
end
