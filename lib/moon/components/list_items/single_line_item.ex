defmodule Moon.Components.ListItems.SingleLineItem do
  @moduledoc false

  use Moon.StatelessComponent

  slot default
  slot left_icon
  slot right_icon

  prop size, :string, values: ["medium", "large"], default: "medium"
  prop background_color, :string, values: Moon.colors(), default: "gohan-100"
  prop current, :boolean, default: false

  def render(assigns) do
    ~F"""
    <div class={
      "relative rounded bg-#{@background_color} px-3 text-sm text-bulma-100 leading-6 cursor-pointer hover:bg-goku-120",
      "py-2": @size == "medium",
      "py-3": @size == "large",
      "pl-10": @size == "medium" and slot_assigned?(:left_icon),
      "pl-12": @size == "large" and slot_assigned?(:left_icon),
      "bg-goku-120": @current
    }>
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
