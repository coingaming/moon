defmodule Moon.Design.Tabs.Segment do
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
      role="tab"
      type="button"
      {=@tabindex}
      aria-selected={"#{@is_selected}"}
      {=@disabled}
      class={merge([
        "items-center justify-center whitespace-nowrap text-moon-14 text-bulma font-medium rounded-moon-i-sm transition-colors focus:outline-none",
        (@is_selected && @selected_class) || @unselected_class,
        (@size === "sm" && "px-3 py-1") || "py-2 px-4",
        (@disabled && "cursor-default text-trunks") || "cursor-pointer hover:bg-gohan",
        @class
      ])}
      :on-click={!@disabled && @on_change}
      value={@tabindex}
      {=@id}
      data-testid={@testid}
    ><#slot /></button>
    """
  end
end
