defmodule MoonWeb.Components.ComponetsPage.ComponentsPageSection do
  @moduledoc false

  use MoonWeb, :stateless_component

  prop(title, :string)
  slot(default)

  def render(assigns) do
    ~F"""
    <section class="flex flex-col gap-6">
      <h2 class="text-moon-24 font-medium">{@title}</h2>
      <div class="grid gap-6 grid-cols-1 md:grid-cols-3"><#slot /></div>
    </section>
    """
  end
end
