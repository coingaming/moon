defmodule MoonWeb.Components.ComponetsPage.ComponentsPageCard do
  @moduledoc false

  use MoonWeb, :stateless_component

  prop(image, :string)
  prop(title, :string, required: true)
  slot(default, required: true)

  prop(page, :atom)
  data(theme_name, :string, from_context: :theme_name)
  data(direction, :string, from_context: :direction)

  def render(assigns) do
    ~F"""
    <div>
      <a href={live_path(MoonWeb.Endpoint, @page, theme_name: @theme_name, direction: @direction)}>
        <div class="flex flex-col border border-beerus rounded-moon-s-lg p-2 pb-6">
          <div :if={@image} class="pb-2">
            <img src={"/moon/assets/images/#{@image}"} alt={@title} width={408} height={224}>
          </div>
          <div class="flex flex-col gap-2 pt-2 px-4">
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
