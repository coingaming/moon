defmodule Moon.Components.SelectTrigger do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Icons.{ControlsChevronDown, ControlsChevronUp}
  alias Phoenix.LiveView.JS

  prop id, :string
  prop placeholder, :string, default: "Choose"
  prop selected_option, :any
  prop size, :string, values: ~w(md lg xl), default: "md"
  prop state, :string, values: ~w(active error disabled)
  prop class, :string
  prop on_click, :event
  slot default

  def render(assigns) do
    ~F"""
    <button
      class={
        "w-full text-left border border-solid rounded border-beerus-100 bg-gohan-100 flex items-center focus:border-piccolo-100 active:border-piccolo-100 #{@class}",
        "text-sm h-10 leading-4 px-3": @size == "md",
        "text-base h-12 leading-6 px-4": @size == "lg",
        "text-base h-14 leading-6 px-4": @size == "xl",
        "text-trunks-100": is_nil(@selected_option),
        "text-bulma-100": !is_nil(@selected_option)
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
        <ControlsChevronDown class="flex-shrink-0 w-6 h-6" color="bulma-100" />
      </div>

      <div id={"#{@id}-chevron-up"} class="items-center" style="display: none;">
        <ControlsChevronUp class="flex-shrink-0 w-6 h-6" color="bulma-100" />
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
