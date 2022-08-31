defmodule Moon.Components.InputGroup.Container do
  @moduledoc false

  use Moon.StatelessComponent

  prop orientation, :string
  slot default

  def render(assigns) do
    ~F"""
    <div class={@orientation, "moon-input-group", flex: @orientation == "vertical"}>
      <#slot />
    </div>
    """
  end
end
