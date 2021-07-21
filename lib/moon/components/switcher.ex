defmodule Moon.Components.Switcher do
  use Moon.StatelessComponent

  prop items, :list, default: []
  prop selected_item, :string
  prop click, :event, required: true

  def render(assigns) do
    ~F"""
    {asset_import @socket, "js/tailwind"}

    <div
      :if={length(@items) > 0}
      class="flex items-center p-1 border rounded gap-x-2 border-beerus-100"
    >
      <button
        :for={item <- @items}
        class={
          "px-2 py-1 text-sm leading-6 rounded",
          "bg-piccolo-100 text-goten-100": item.value == @selected_item,
          "text-trunks-100": item.value != @selected_item
        }
        :on-click={@click}
        phx-value-selected-item={item.value}
      >
        {item.name}
      </button>
    </div>
    """
  end
end
