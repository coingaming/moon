defmodule Moon.Design.Tabs.Step do
  @moduledoc false

  use Moon.StatelessComponent, slot: "tabs"


  # open API
  prop(id, :string)
  prop(disabled, :boolean, default: false)
  prop(class, :css_class)
  prop(testid, :string)

  prop(unselected_class, :css_class, default: "after:scale-x-0 text-bulma")
  prop(selected_class, :css_class, default: "after:scale-x-100 text-piccolo")

  slot(default)

  # inner API
  prop(tabindex, :integer, from_context: :tabindex)
  prop(is_selected, :boolean, from_context: :is_selected)
  prop(on_change, :event, from_context: :on_change)

  prop(is_completed, :boolean)
  prop(is_last, :boolean)

  def render(assigns) do
    ~F"""
    <button
      {=@id}
      data-testid={@testid}
      class={merge(["flex flex-row w-full", @class])}
      role="tab"
      type="button"
      {=@tabindex}
      aria-selected={"#{@is_selected}"}
      {=@disabled}
      :on-click={!@disabled && @on_change}
      value={@tabindex}
    >
      <span class="flex flex-col w-full h-full">
        {#if @is_selected}
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
            <circle cx="12" cy="12" r="11" fill="none" stroke="#2E7D32" stroke-width="2"/>
            <circle cx="12" cy="12" r="3.5" fill="#2E7D32" stroke="#2E7D32"/>
          </svg>
        {#elseif @is_completed}
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
            <circle cx="12" cy="12" r="12" fill="#2E7D32"/>
            <path d="M8 12.6667L10.5455 15L16 10" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
          </svg>
        {#else}
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
            <circle cx="12" cy="12" r="11" fill="none" stroke="#292929" stroke-width="2"/>
          </svg>
        {/if}
        <span class="w-1 h-full bg-roshi"> </span>
      </span>
      <span><#slot /></span>
    </button>
    """
  end
end
