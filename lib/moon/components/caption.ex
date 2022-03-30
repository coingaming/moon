defmodule Moon.Components.Caption do
  @moduledoc false

  use Moon.StatelessComponent

  slot default
  prop text_align_class, :string, default: "left"
  prop color_class, :string, default: "bulma-100"

  def render(assigns) do
    ~F"""
    <span class={
      "text-[10px] leading-4 font-semibold uppercase tracking-[1px]",
      "text-#{@color_class}",
      "text-#{@text_align_class}"
    }>
      <#slot />
    </span>
    """
  end
end
