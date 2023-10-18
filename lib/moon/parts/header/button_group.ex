defmodule Moon.Parts.Header.ButtonGroup do
  @moduledoc false

  use Moon.StatelessComponent, slot: "button_group"

  @doc "Default slot"
  slot(default)

  def render(assigns) do
    ~F"""
    <div class="gap-2">
      <#slot />
    </div>
    """
  end
end
