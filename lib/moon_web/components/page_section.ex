defmodule MoonWeb.Components.PageSection do
  @moduledoc false

  use MoonWeb, :stateless_component

  prop title, :string
  slot default

  def render(assigns) do
    ~F"""
    <section class="flex flex-col gap-6">
      <h2 :if={@title} class="text-moon-24 font-semibold">{@title}</h2>
      <div class="flex flex-col gap-4">
        <#slot />
      </div>
    </section>
    """
  end
end
