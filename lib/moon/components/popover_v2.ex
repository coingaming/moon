defmodule Moon.Components.PopoverV2 do
  use Moon.StatelessComponent

  prop show, :boolean, required: true
  prop on_close, :event

  prop placement, :string,
    values: ~w(
    top-left
    top-center
    top-right
    bottom-left
    bottom-center
    bottom-right
  ),
    default: "bottom-right"

  slot default, required: true
  slot content, required: true

  prop placement_class, :map,
    default: %{
      "bottom-left" => "right-0",
      "bottom-right" => "left-0"
    }

  # TODO: Add ability to position content to on top, left and right

  def render(assigns) do
    ~F"""
    {asset_import @socket, "js/tailwind"}

    <div class="relative inline-block">
      <#slot />
      <div
        :if={@show}
        :on-click={@on_close}
        class="fixed inset-0 z-40"
      />
      <div
        :if={@show}
        class={
          "absolute mt-2 z-40 #{@placement_class[@placement]}"
        }
      >
        <#slot name="content"/>
      </div>
    </div>
    """
  end
end
