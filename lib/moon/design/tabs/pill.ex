defmodule Moon.Design.Tabs.Pill do
  @moduledoc false

  use Moon.StatelessComponent, slot: "tabs"

  # open API
  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "If true, the tab is disabled"
  prop(disabled, :boolean, default: false)
  @doc "Additional Tailwind classes for unselected tab"
  prop(unselected_class, :css_class, default: "")
  @doc "Additional Tailwind classes for selected tab"
  prop(selected_class, :css_class, default: "bg-goku")
  @doc "Content inside the tab"
  slot(default, required: true)

  # inner API
  @doc "Will be got from Tabs.List in most cases"
  prop(tabindex, :integer, from_context: :tabindex)
  @doc "Will be got from Tabs.List in most cases"
  prop(is_selected, :boolean, from_context: :is_selected)
  @doc "Will be got from Tabs.List in most cases"
  prop(size, :string, values!: ~w(sm md), from_context: :size)
  @doc "Will be got from Tabs in most cases"
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
        (@disabled && "cursor-default text-trunks") || "hover:bg-goku",
        @class
      ])}
      :on-click={!@disabled && @on_change}
      value={@tabindex}
    ><#slot /></button>
    """
  end
end
