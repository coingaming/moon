defmodule Moon.Parts.Sidebar.SectionTitle do
  @moduledoc false

  use Moon.StatelessComponent

  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Default slot"
  slot(default)

  def render(assigns) do
    ~F"""
    <span {=@id} data-testid={@testid} class={merge(["text-trunks text-moon-14 p-2", @class])}><#slot /></span>
    """
  end
end
