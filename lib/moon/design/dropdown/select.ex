defmodule Moon.Design.Dropdown.Select do
  @moduledoc "Element that triggers Dropdown component, renders as a button"

  use Moon.StatelessComponent, slot: "trigger"

  alias Moon.Icon
  alias Moon.Design.Dropdown.Badge

  @doc "Data-testid attribute for html tag"
  prop(testid, :string)
  @doc "Id attribute for html tag"
  prop(id, :string)
  @doc "Additional CSS classes for the html tag"
  prop(class, :css_class)

  @doc "Text to be shown when no value given"
  prop(prompt, :string, default: "...")
  @doc "Value to be shown"
  prop(value, :string)
  @doc "Badge to show selected items count or smth else"
  prop(badge, :integer)

  @doc "Some additional styling will be set to indicate field is iinvalid"
  prop(error, :boolean, from_context: :error)
  @doc "If the open indicator is active or not"
  prop(is_open, :boolean, from_context: :is_open)
  @doc "Site of the select"
  prop(size, :string, values!: ~w(sm md lg), from_context: :size)
  @doc "If the item should be marked as disabled"
  prop(disabled, :boolean)
  @doc "Event that fired when trigger is clicked"
  prop(on_click, :event, from_context: :on_trigger)
  @doc "Content of the button"
  slot(default)

  def render(assigns) do
    ~F"""
    <button
      {=@id}
      data-testid={@testid}
      type="button"
      :on-click={@on_click}
      {=@error}
      {=@disabled}
      class={merge([
        "flex items-center justify-between w-full bg-gohan border-beerus",
        "shadow-input hover:shadow-input-hov transition-shadow duration-200",
        "focus:shadow-input-focus focus:outline-none py-0 px-4 m-0",
        "moon-error:shadow-input-err moon-error:hover:shadow-input-err moon-error:focus:shadow-input-err",
        [
          "leading-8 rounded-moon-i-xs text-moon-14": @size == "sm",
          "leading-10 rounded-moon-i-sm text-moon-16": !(@size in ~w(sm lg)),
          "leading-[3rem] rounded-moon-i-sm text-moon-16": @size == "lg",
          "opacity-30 outline-0 border-none cursor-not-allowed hover:shadow-input focus:shadow-input":
            @disabled
        ],
        @class
      ])}
    >
      <Badge :if={@badge && @badge > 0} {=@size} count={@badge} />
      <span class={merge([
        "overflow-hidden whitespace-nowrap text-trunks",
        "text-bulma": !!@value
      ])}>
        <#slot>{@value || @prompt}</#slot>
      </span>
      <Icon
        name="controls_chevron_down"
        class={"text-trunks flex-shrink-0 transition-transform", "rotate-180": @is_open}
      />
    </button>
    """
  end
end
