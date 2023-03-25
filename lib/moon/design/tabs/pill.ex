defmodule Moon.Design.Tabs.Pill do
  @moduledoc false

  use Moon.StatelessComponent, slot: "tabs"

  # open API
  prop(id, :string)
  prop(testid, :string)
  prop(class, :css_class)

  prop(disabled, :boolean, default: false)

  prop(unselected_class, :css_class, default: "")
  prop(selected_class, :css_class, default: "bg-gohan")

  slot(default, required: true)

  # inner API
  prop(tabindex, :integer, from_context: :tabindex)
  prop(is_selected, :boolean, from_context: :is_selected)
  prop(size, :string, values!: ~w(sm md), from_context: :size)
  prop(on_change, :event, from_context: :on_change)

  def render(assigns) do
    ~F"""
    <button
      {=@id}
      data-testid={@testid}
      role="tab"
      type="button"
      {=@tabindex}
      aria-selected={"#{@is_selected}"}
      {=@disabled}
      class={merge([
        "focus:outline-none text-moon-14 text-bulma font-semibold flex items-center justify-center transition-colors cursor-pointer rounded-moon-i-sm",
        (@is_selected && @selected_class) || @unselected_class,
        (@size === "sm" && "px-2 py-1 gap-1") || "py-2 px-3 gap-2",
        (@disabled && "cursor-default text-trunks") || "hover:bg-gohan",
        @class
      ])}
      :on-click={!@disabled && @on_change}
      value={@tabindex}
    ><#slot /></button>
    """
  end
end
