defmodule Moon.Design.Tabs.List do
  @moduledoc false

  use Moon.StatelessComponent, slot: "header"

  alias Surface.Components.Dynamic.Component

  import Moon.Helpers.MakeList

  prop(id, :string)
  prop(testid, :string)
  prop(class, :css_class)
  prop(size, :string, values!: ~w(sm md), default: "md")

  prop(selected, :integer, from_context: :selected)

  prop(tab_titles, :list, default: [])
  prop(tab_module, :atom, default: Moon.Design.Tabs.Tab)

  prop(on_change, :event, from_context: :on_change)

  slot(tabs)

  def render(assigns) do
    ~F"""
    <div
      class={merge(["flex items-center justify-center", (@size == "sm" && "gap-1") || "gap-2", @class])}
      role="tablist"
      aria-orientation="horizontal"
      {=@id}
      data-testid={@testid}
    >
      {#if slot_assigned?(:tabs)}
        {#for {tab, tabindex} <- Enum.with_index(make_list(@tabs))}
          <#slot
            {tab}
            context_put={
              is_selected: tabindex == @selected,
              size: @size,
              tabindex: tabindex
            }
          />
        {/for}
      {#else}
        <Component
          :for={{title, tabindex} <- Enum.with_index(@tab_titles)}
          module={@tab_module}
          is_selected={tabindex == @selected}
          {=@size}
          {=tabindex}
          {=@on_change}
        >{title}</Component>
      {/if}
    </div>
    """
  end
end
