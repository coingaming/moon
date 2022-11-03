defmodule Moon.Components.Divider do
  @moduledoc false

  use Moon.StatelessComponent

  prop(class, :string)
  prop(color, :string, default: "beerus-100")
  prop(height, :string, default: "full")

  prop(orientation, :string,
    values: ["vertical", "horizontal"],
    default: "horizontal"
  )

  def render(assigns) do
    ~F"""
    {#if @orientation == "horizontal"}
      <hr class={"border-#{@color} #{@class}"}>
    {#elseif @orientation == "vertical"}
      <div class={"h-#{@height} border-#{@color} border-r #{@class}"} />
    {/if}
    """
  end
end
