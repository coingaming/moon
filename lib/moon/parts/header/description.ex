defmodule Moon.Parts.Header.Description do
  @moduledoc false

  use Moon.StatelessComponent, slot: "description"

  @doc "Default slot"
  slot(default)

  def render(assigns) do
    ~F"""
    <p class="text-trunks text-moon-18">
      <#slot />
    </p>
    """
  end
end
