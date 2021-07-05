defmodule Moon.Components.PopoverV2 do
  use Moon.StatelessComponent

  prop show, :boolean

  slot default, required: true
  slot content, required: true

  # TODO: Add ability to position content to on top, left and right

  def render(assigns) do
    ~F"""
    {asset_import @socket, "js/tailwind"}

    <div class="relative inline-block">
      <#slot />
      <div
        :if={@show}
        class="origin-top-left absolute left-0 mt-2 z-40"
      >
        <#slot name="content"/>
      </div>
    </div>
    """
  end
end
