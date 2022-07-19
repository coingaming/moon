defmodule MoonWeb.Components.ComponentPageDescription do
  @moduledoc false

  use MoonWeb, :stateless_component

  prop title, :string
  prop image, :string
  slot default

  def render(assigns) do
    ~F"""
    <h1 class="text-moon-32 font-semibold">{@title}</h1>
    <div class="flex flex-col lg:flex-row gap-2 lg:gap-4 justify-between items-start">
      <div class="flex flex-col gap-2 max-w-screen-sm text-moon-16">
        <#slot />
      </div>
      <div :if={@image} class="w-full max-w-md rounded-moon-s-sm overflow-hidden">
        <img src={@image} alt={@title}>
      </div>
    </div>
    """
  end
end
