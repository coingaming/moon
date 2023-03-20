defmodule MoonWeb.Components.ComponetsPage.ComponentsPageCard do
  @moduledoc false
alias Surface.Components.Link

  use MoonWeb, :stateless_component

  prop(title, :string)
  prop(image, :string)
  slot(default)

  def render(assigns) do
    ~F"""
    <Link>
      <div class="flex flex-col gap-4 border border-beerus rounded-moon-s-lg p-2 pb-6">
        <img src={@image} alt={@title} width={408} height={224} />
        <div class="flex flex-col gap-2">
          <h3 class="text-moon-20 font-medium">{@title}</h3>
          <p class="h-12 text-moon-16 text-ellipsis overflow-hidden">
            <#slot />
          </p>
        </div>
      </div>
    </Link>
    """
  end
end
