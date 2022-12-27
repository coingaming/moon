defmodule Moon.Design.Tabs.Pill do
  @moduledoc false

  use Surface.Component, slot: "tabs"

  # open API
  prop(disabled, :boolean, default: false)
  prop(class, :css_class)

  prop(unselected_class, :css_class, default: "")
  prop(selected_class, :css_class, default: "bg-gohan")

  slot(default, required: true)

  # inner API
  prop(tabindex, :string, from_context: :tabindex)
  prop(selected, :boolean, from_context: :selected)
  prop(size, :string, values!: ~w(sm md), from_context: :size)
  prop(on_change, :event, from_context: :on_change)

  def render(assigns) do
    ~F"""
    <button
      role="tab"
      type="button"
      {=@tabindex}
      aria-selected={@selected}
      {=@disabled}
      class={
        @class,
        (@disabled && "cursor-default text-trunks") || "hover:bg-gohan",
        (@selected && @selected_class) || @unselected_class,
        (@size === "sm" && "px-2 py-1 gap-1") || "py-2 px-3 gap-2",
        "focus:outline-none text-moon-14 text-bulma font-semibold flex items-center justify-center transition-colors cursor-pointer rounded-moon-i-sm"
      }
      :on-click={!@disabled && @on_change}
      phx-value-selected-index={@tabindex}
    ><#slot /></button>
    """
  end
end
