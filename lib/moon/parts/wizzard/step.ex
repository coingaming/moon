defmodule Moon.Parts.Wizard.Step do
  @moduledoc false

  use Moon.StatelessComponent, slot: "tabs"

  defstruct title: "", text: ""

  # open API
  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "if true, the tab is disabled"
  prop(disabled, :boolean, default: false)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Additional Tailwind classes for unselected tab"
  prop(unselected_class, :css_class, default: "text-beerus")
  @doc "Additional Tailwind classes for selected tab"
  prop(selected_class, :css_class, default: "text-roshi")
  @doc "Additional Tailwind classes for step icon background"
  prop(icon_bg_class, :css_class, default: "bg-goku")
  @doc "Additional Tailwind classes for step line"
  prop(line_class, :css_class)
  @doc "Additional Tailwind classes for step title"
  prop(title_class, :css_class)
  @doc "Content inside the tab"
  slot(default)

  # inner API
  @doc "Will be got from Tabs.List in most cases"
  prop(tabindex, :integer, from_context: :tabindex)
  @doc "Will be got from Tabs.List in most cases"
  prop(is_selected, :boolean, from_context: :is_selected)
  @doc "Will be got from Tabs in most cases"
  prop(on_change, :event, from_context: :on_change)
  @doc "Will be got from Tabs.List in most cases"
  prop(selected, :integer, from_context: :selected)
  @doc "Will be got from Tabs.List in most cases"
  prop(is_last, :boolean, from_context: :is_last)

  def render(assigns) do
    ~F"""
    <button
      {=@id}
      data-testid={@testid}
      class={merge(["relative", @class])}
      role="tab"
      type="button"
      {=@tabindex}
      aria-selected={"#{@is_selected}"}
      disabled={@disabled || @tabindex > @selected}
      :on-click={!(@disabled || @tabindex > @selected) && @on_change}
      value={@tabindex}
    >
      <div
        class={merge([
          [
            "absolute left-3 top-4 -ml-px mt-0.5 h-full w-0.5 bg-beerus",
            "bg-roshi": @selected > @tabindex
          ],
          @line_class
        ])}
        aria-hidden="true"
        :if={!@is_last}
      />
      <span class="group relative flex items-start">
        <span class={merge(["flex items-center rounded-full", @icon_bg_class])}>
          {#if @selected == @tabindex}
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="24"
              height="24"
              viewBox="0 0 24 24"
              fill="none"
              class={@selected_class}
            >
              <circle cx="12" cy="12" r="11" fill="none" stroke="currentColor" stroke-width="2" />
              <circle cx="12" cy="12" r="3.5" fill="currentColor" stroke="currentColor" />
            </svg>
          {#elseif @selected > @tabindex}
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="24"
              height="24"
              viewBox="0 0 24 24"
              fill="none"
              class={@selected_class}
            >
              <circle cx="12" cy="12" r="12" fill="currentColor" />
              <path
                d="M8 12.6667L10.5455 15L16 10"
                stroke="white"
                stroke-width="2"
                stroke-linecap="round"
                stroke-linejoin="round"
              />
            </svg>
          {#else}
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="24"
              height="24"
              viewBox="0 0 24 24"
              fill="none"
              class={@unselected_class}
            >
              <circle cx="12" cy="12" r="11" fill="none" stroke="currentColor" stroke-width="2" />
            </svg>
          {/if}
        </span>
        <span class={merge(["ml-6 mb-6 gap-2 items-start flex min-w-0 flex-col", @title_class])}><#slot /></span>
      </span>
    </button>
    """
  end
end
