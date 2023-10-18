defmodule Moon.Parts.Header.Title do
  @moduledoc false

  use Moon.StatelessComponent, slot: "title"

  @doc "Default slot"
  slot(default)

  def render(assigns) do
    ~F"""
    <h3 class="text-bulma text-moon-32 font-grotesk">
      <#slot />
    </h3>
    """
  end
end
