defmodule MoonWeb.Pages.ExamplePages.Components.Switcher do
  use Moon.StatelessComponent

  prop items, :list, default: []
  prop selected_item, :string
  prop click, :event, required: true

  def render(assigns) do
    ~F"""
    <div
      :if={length(@items) > 0}
      class="flex items-center px-2 gap-x-2 border rounded border-beerus-100"
    >
      <button
        :for={item <- @items}
        class={
          "px-2 py-1 text-sm rounded",
          "font-semibold bg-bulma-100 text-gohan-100": item.value == @selected_item,
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
