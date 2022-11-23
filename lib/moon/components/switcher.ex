defmodule Moon.Components.Switcher do
  @moduledoc false

  use Moon.StatelessComponent

  prop(items, :list, default: [])
  prop(selected_item, :string)
  prop(click, :event, required: true)
  prop(class, :string, default: "flex items-center p-1 border rounded gap-x-2 border-beerus")

  def render(assigns) do
    ~F"""
    <div :if={length(@items) > 0} class={@class}>
      <button
        :for={item <- @items}
        class={
          "p-1.5 lg:ps-2.5 lg:pe-3.5 font-medium text-sm rounded-md",
          "bg-gohan text-bulma": item == @selected_item,
          "text-trunks": item != @selected_item
        }
        :on-click={@click}
        phx-value-selected-item={item}
      >
        {item}
      </button>
    </div>
    """
  end
end
