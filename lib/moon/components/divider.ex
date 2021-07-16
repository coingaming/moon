defmodule Moon.Components.Divider do
  use Moon.StatelessComponent

  prop class, :string
  prop color, :string, default: "goku-100"

  prop orientation, :string,
    values: ["vertical", "horizontal"],
    default: "horizontal"

  def render(assigns) do
    ~F"""
    {asset_import @socket, "js/tailwind"}

    {#if @orientation == "horizontal"}
      <hr class={"border-#{@color} #{@class}"}/>
    {#elseif @orientation == "vertical"}
      <div class={"h-full border-#{@color} border-r #{@class}"} />
    {/if}
    """
  end
end
