defmodule Moon.Components.TextInput.Container do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.TextInput.Utils

  prop disabled, :boolean, default: false
  prop size, :string, values: ["md", "lg", "xl"]

  slot default

  def render(assigns) do
    ~F"""
    <div class={
      "w-full max-w-full relative z-0",
      Utils.get_border_radius(@size),
      "opacity-30 cursor-not-allowed": @disabled
    }>
      <#slot />
    </div>
    """
  end
end
