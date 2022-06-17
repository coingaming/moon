defmodule MoonWeb.Components.Facing.SectionTitle do
  @moduledoc false

  use MoonWeb, :stateless_component

  prop title, :string
  prop description, :string
  slot default

  def render(assigns) do
    ~F"""
    <div className="flex flex-col gap-6">
      <h2 :if={@title} className="text-moon-32 font-medium">{@title}</h2>
      <p :if={@description} className="text-moon-16">{@description}</p>
    </div>
    """
  end
end
