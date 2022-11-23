defmodule Moon.Components.SelectTrigger do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Icons.{ControlsChevronDown, ControlsChevronUp}
  alias Phoenix.LiveView.JS

  prop(id, :string)
  prop(placeholder, :string, default: "Choose")
  prop(selected_option, :any)
  prop(size, :string, values: ~w(md lg xl), default: "md")
  prop(state, :string, values: ~w(active error disabled))
  prop(class, :string)
  prop(on_click, :event)
  slot(default)

  def render(assigns) do
    ~F"""
    <button
      class={
        "w-full text-left border border-solid rounded border-beerus bg-gohan flex items-center focus:border-piccolo active:border-piccolo #{@class}",
        "text-moon-14 h-10 px-3": @size == "md",
        "text-moon-16 h-12 px-4": @size == "lg",
        "text-moon-16 h-14 px-4": @size == "xl",
        "text-trunks": is_nil(@selected_option),
        "text-bulma": !is_nil(@selected_option)
      }
      :on-click={@on_click}
    >
      <div class="grow">
        {#if @selected_option}
          <#slot />
        {#else}
          {@placeholder}
        {/if}
      </div>

      <div id={"#{@id}-chevron-down"} class="items-center">
        <ControlsChevronDown class="flex-shrink-0 w-6 h-6" color="bulma" />
      </div>

      <div id={"#{@id}-chevron-up"} class="items-center" style="display: none;">
        <ControlsChevronUp class="flex-shrink-0 w-6 h-6" color="bulma" />
      </div>
    </button>
    """
  end

  def toggle_icons(js, id) do
    js
    |> JS.toggle(to: "##{id}-trigger-chevron-up", display: "flex")
    |> JS.toggle(to: "##{id}-trigger-chevron-down", display: "flex")
  end

  def reset_icons(js, id) do
    js
    |> JS.hide(to: "##{id}-trigger-chevron-up")
    |> JS.show(to: "##{id}-trigger-chevron-down", display: "flex")
  end
end
