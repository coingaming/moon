defmodule Moon.Design.Tabs.List do
  @moduledoc false

  use Moon.StatelessComponent, slot: "header"

  alias Surface.Components.Dynamic.Component

  import Moon.Helpers.MakeList

  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Size of tabs"
  prop(size, :string, values!: ~w(sm md), default: "md")
  @doc "Will be got from Tabs in most cases"
  prop(selected, :integer, from_context: :selected)
  @doc "Value of the tab"
  prop(value, :integer, from_context: :value)
  @doc "List of tab titles. They are rendered with tab_module. Only if no slot tabs assigned"
  prop(tab_titles, :list, default: [])
  @doc "List of tab titles. THe are rendered with tab_module. Only if no slot tabs assigned"
  prop(tab_module, :atom, default: Moon.Design.Tabs.Tab)
  @doc "Event to happen when non-disabled tab is clicked"
  prop(on_change, :event, from_context: :on_change)
  @doc "Tabs slot"
  slot(tabs)
  @doc "Default slot"
  slot(default)
  @doc "Slot for redering tab title when tab_tiltles given"
  slot(tab_title)

  def render(assigns) do
    ~F"""
    <div
      class={merge(["flex items-center justify-left w-full", (@size == "sm" && "gap-1") || "gap-2", @class])}
      role="tablist"
      aria-orientation="horizontal"
      {=@id}
      data-testid={@testid}
    >
      <#slot {@default} />
      {#if slot_assigned?(:tabs)}
        {#for {tab, tabindex} <- Enum.with_index(make_list(@tabs))}
          <#slot
            {tab}
            context_put={
              is_selected: tabindex == @selected,
              is_last: tabindex + 1 == make_list(@tabs) |> length(),
              size: @size,
              tabindex: tabindex,
              selected: @selected
            }
          />
        {/for}
      {#else}
        <Component
          :for={{title, tabindex} <- Enum.with_index(@tab_titles)}
          module={@tab_module}
          is_selected={tabindex == @selected}
          {=@size}
          is_last={tabindex + 1 == @tab_titles |> length()}
          {=tabindex}
          {=@on_change}
          {=@selected}
        >
          <#slot {@tab_title, title: title, tabindex: tabindex}>{title}</#slot>
        </Component>
      {/if}
    </div>
    """
  end
end
