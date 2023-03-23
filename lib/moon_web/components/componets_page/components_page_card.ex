defmodule MoonWeb.Components.ComponetsPage.ComponentsPageCard do
  @moduledoc false

  use MoonWeb, :stateless_component

  prop(href, :string)
  prop(image, :string)
  prop(title, :string)
  slot(default)

  def render(assigns) do
    ~F"""
    <div>
      <a href={@href}>
        <div class="flex flex-col gap-4 border border-beerus rounded-moon-s-lg p-2 pb-6">
          <img src={@image} alt={@title} width={408} height={224}>
          <div class="flex flex-col gap-2 px-4">
            <h3 class="text-moon-20 font-medium">
              {@title}</h3>
            <p class="h-12 text-moon-16 text-ellipsis overflow-hidden">
              <#slot />
            </p>
          </div>
        </div>
      </a>
    </div>
    """
  end
end
