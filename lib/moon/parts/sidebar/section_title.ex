defmodule Moon.Parts.Sidebar.SectionTitle do
  @moduledoc false

  use Moon.StatelessComponent

  slot(default)

  def render(assigns) do
    ~F"""
    <span class="text-trunks text-moon-14 p-2"><#slot /></span>
    """
  end
end
