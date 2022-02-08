defmodule Moon.Components.ListItems.SingleLineItem do
  @moduledoc false

  use Moon.StatelessComponent

  slot default
  slot left_icon
  slot right_icon

  prop size, :string, values: ["medium", "large"], default: "medium"
  prop background_color, :string, values: Moon.colors(), default: "gohan-100"
  prop current, :boolean, default: false
  prop on_select, :event
  prop values, :any
  prop testid, :string

  def render(assigns) do
    ~F"""
    <div
      data-testid={@testid}
      :on-click={@on_select}
      :values={@values}
      phx-value-toggled_item_id={@values && Access.get(@values, :toggled_item_id)}
      class={
        "relative rounded px-3 text-sm text-bulma-100 leading-6 cursor-pointer hover:bg-goku-120 w-100 block",
        "py-2": @size == "medium",
        "py-3": @size == "large",
        "pl-10": @size == "medium" and slot_assigned?(:left_icon),
        "pl-12": @size == "large" and slot_assigned?(:left_icon),
        "bg-goku-120": @current,
        "bg-#{@background_color}": true
      }
    >
      <div
        :if={slot_assigned?(:left_icon)}
        class={
          "absolute inset-y-0 left-0 flex items-center justify-center",
          "text-bulma-100": @current,
          "text-trunks-100": !@current,
          "w-10": @size == "medium",
          "w-12": @size == "large"
        }
      >
        <#slot name="left_icon" />
      </div>

      <div
        :if={slot_assigned?(:right_icon)}
        class={
          "absolute inset-y-0 right-0 flex items-center justify-center",
          "text-bulma-100": @current,
          "text-trunks-100": !@current,
          "w-10": @size == "medium",
          "w-12": @size == "large"
        }
      >
        <#slot name="right_icon" />
      </div>

      <#slot />
    </div>
    """
  end
end
