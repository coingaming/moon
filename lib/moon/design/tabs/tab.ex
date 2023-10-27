defmodule Moon.Design.Tabs.Tab do
  @moduledoc false

  use Moon.StatelessComponent, slot: "tabs"

  # open API
  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "If true, the tab is disabled"
  prop(disabled, :boolean, default: false)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Additional Tailwind classes for unselected tab"
  prop(unselected_class, :css_class, default: "after:scale-x-0 text-bulma")
  @doc "Additional Tailwind classes for selected tab"
  prop(selected_class, :css_class, default: "after:scale-x-100 text-piccolo")
  @doc "Default slot"
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
      role="tab"
      type="button"
      {=@tabindex}
      aria-selected={"#{@is_selected}"}
      {=@disabled}
      class={merge([
        "focus:outline-none text-moon-14 font-semibold flex items-center justify-center cursor-pointer",
        "relative after:content-[\"\"] after:absolute after:left-0 after:bottom-0 after:w-full",
        "after:h-[2px] after:bg-piccolo  after:transition-transform after:duration-300 after:origin-top-left after:scale-y-100",
        (@size === "sm" && "px-2 py-1 gap-1") || "py-2 px-3 gap-2",
        (@is_selected && @selected_class) || @unselected_class,
        (@disabled && "cursor-default text-trunks") ||
          "hover:after:origin-top-left hover:after:scale-100 hover:text-piccolo",
        @class
      ])}
      :on-click={!@disabled && @on_change}
      value={@tabindex}
      data-testid={@testid}
    ><#slot /></button>
    """
  end
end
