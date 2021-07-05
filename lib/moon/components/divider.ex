defmodule Moon.Components.Divider do
  use Moon.StatelessComponent

  prop class, :string
  prop orientation, :string,
    values: ["vertical", "horizontal"],
    default: "horizontal"

  def render(assigns) do
    ~F"""
    {asset_import @socket, "js/tailwind"}

    {#if @orientation == "horizontal"}
      <hr class={"border-beerus-100 #{@class}"}/>
    {#elseif @orientation == "vertical"}
      <div class={"border-beerus-100 border #{@class}"} />
    {/if}
    """
  end
end
