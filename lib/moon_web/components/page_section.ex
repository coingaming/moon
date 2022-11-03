defmodule MoonWeb.Components.PageSection do
  @moduledoc false

  use MoonWeb, :stateless_component

  prop(title, :string)
  prop(image, :string)
  slot(default)

  def render(assigns) do
    ~F"""
    <section class="flex flex-col lg:flex-row gap-6">
      <div class={
        "flex flex-col w-full gap-6",
        "basis-1/2": @image
      }>
        <h2 :if={@title} class="text-moon-24 font-medium">{@title}</h2>
        <div class="w-full flex flex-col gap-2 text-moon-16">
          <#slot />
        </div>
      </div>
      <div
        :if={@image}
        class="flex lg:basis-1/2 items-center justify-center h-80 rounded-moon-s-md overflow-hidden"
      >
        <img src={@image} alt={@title} class="h-full">
      </div>
    </section>
    """
  end
end
