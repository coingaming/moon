defmodule MoonWeb.Components.Facing.SectionTitle do
  @moduledoc false

  use MoonWeb, :stateless_component

  prop title, :string
  prop description, :string
  slot default

  def render(assigns) do
    ~F"""
    <div class="flex flex-col gap-6">
      <h2 :if={@title} class="text-moon-32 font-semibold">{@title}</h2>
      <p :if={@description} class="text-moon-16">{@description}</p>
    </div>
    """
  end
end
