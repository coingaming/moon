defmodule Moon.Components.Caption do
  @moduledoc false

  use Moon.StatelessComponent

  slot default
  prop text_align, :string
  prop color, :string, default: "text-bulma-100"

  def render(assigns) do
    ~F"""
    <span
      style={get_style(color: @color, text_align: @text_align)}
      class={"text-[10px] leading-4 font-semibold uppercase tracking-[1px]"}>
      <#slot />
    </span>
    """
  end
end
