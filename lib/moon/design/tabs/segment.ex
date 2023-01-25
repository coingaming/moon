defmodule Moon.Design.Tabs.Segment do
  @moduledoc false

  use Surface.Component, slot: "tabs"

  import Moon.Helpers.MergeClass, only: [merge: 1]

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
      class={merge([
        "items-center justify-center whitespace-nowrap text-moon-14 text-bulma font-medium rounded-moon-i-sm transition-colors focus:outline-none",
        (@selected && @selected_class) || @unselected_class,
        (@size === "sm" && "px-3 py-1") || "py-2 px-4",
        (@disabled && "cursor-default text-trunks") || "cursor-pointer hover:bg-gohan",
        @class
      ])}
      :on-click={!@disabled && @on_change}
      phx-value-selected-index={@tabindex}
    ><#slot /></button>
    """
  end
end
